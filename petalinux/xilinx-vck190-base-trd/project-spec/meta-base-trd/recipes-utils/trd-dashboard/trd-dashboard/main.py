# Copyright 2021 Xilinx Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from bokeh.plotting import figure, curdoc
from bokeh.layouts import layout, row, column, gridplot
from bokeh.models.widgets import Tabs, Panel
from bokeh.models.annotations import Title
from bokeh.models import ColumnDataSource, DataTable, DateFormatter, TableColumn, HTMLTemplateFormatter
from bokeh.models import Button, Div, CheckboxGroup, Range1d
from bokeh.models import HoverTool
from bokeh.models import TextInput
from bokeh.models import Paragraph, Div, CustomJS
from bokeh.events import ButtonClick
from bokeh.themes import built_in_themes
from bokeh.driving import linear
from bokeh.palettes import Category20 
from collections import deque
from functools import partial
from hazelnut import MemInfo
import libxperfmon
import os
import psutil
import sensors
import sensors_config as cfg 
import subprocess

# identify platform
def get_pfm_name():
    pfms = {
        'vcap_csi'  : 'preset_pfm1',
        'vcap_gmsl' : 'preset_pfm2',
        'vcap_hdmi' : 'preset_pfm3'
    }
    for p in pfms:
        if os.path.exists("/sys/firmware/devicetree/base/amba_pl@0/" + p) == True:
            return pfms[p]

spfm = get_pfm_name()
if spfm == "preset_pfm1":
    sensor = cfg.sensor_pfm1
else :
    sensor = cfg.sensor_pfm23

# initialize hwmon based sensors
sensors.init()

# cpu labels
cpu_labels = [
    "A72 core 0",
    "A72 core 1",
]

# initialize meminfo
mem = MemInfo()

# color scheme
bg_color = '#15191C'
text_color = '#E0E0E0'
color_list = Category20[17]

# sample interval
sample_size = 60
sample_size_actual = 60
interval = 1

# data queues for plots
x = deque([0] * sample_size)
cpu_data = { c: deque([0.0] * sample_size) for c in cpu_labels }
volt_data = {}
power_data = {}
temp_data = {}
for chip in sensors.iter_detected_chips():
    for feature in chip:
        if str(chip) in sensor:
            if feature.label == 'power1' and feature.label in sensor[str(chip)]:
                volt_data[str(sensor[str(chip)][feature.label]['label'])] = deque([0.0] * sample_size)
                power_data[str(sensor[str(chip)][feature.label]['label'])] = deque([0.0] * sample_size)
            if 'temp' in feature.label and feature.label in sensor[str(chip)]:
                temp_data[str(sensor[str(chip)][feature.label]['label'])] = deque([0.0] * sample_size)

cpu_len = len(cpu_data)
volt_len = len(volt_data)
temp_len = len(temp_data)
                
# apm labels
apm_labels = [
    'AIE Wr  ',
    'AIE Rd  ',
    'PL Wr  ',
    'PL Rd  ',
    'Capture  ',
    'Display  ',
]

# apm initialization
            
apm = libxperfmon.APM(getattr(libxperfmon,get_pfm_name()))

# title
title1 = Div(text="""<h2 style="color :""" + text_color + """; text-align :center">Versal Base TRD: Platform Statistics</h2>""", width=550)

# CPU line plot
cpu_plot = figure(frame_width=420, frame_height=225, title='CPU Utilization in %')
cpu_ds = [0] * cpu_len
i = 0
for c in cpu_data:
    cpu_ds[i] = (cpu_plot.line(x, cpu_data[c], line_width=2, color=color_list[i], legend_label=c)).data_source
    i = i + 1
cpu_plot.legend.click_policy = "hide"
cpu_plot.add_layout(cpu_plot.legend[0], 'right')
cpu_plot.y_range = Range1d(0, 100)
cpu_plot.min_border_left = 55
cpu_plot.min_border_right = 100
cpu_plot.min_border_bottom = 30

# power line plot
power_plot = figure(frame_width=420, frame_height=500, title='Power in W')
power_ds = [0] * volt_len
i = 0
for p in power_data:
    power_ds[i] = (power_plot.line(x, power_data[p], line_width=2, color=color_list[i], legend_label=p)).data_source
    i = i + 1
power_plot.legend.click_policy = "hide"
power_plot.add_layout(power_plot.legend[0], 'right')
power_plot.y_range = Range1d(0, 20)
power_plot.min_border_left = 55
power_plot.min_border_right = 100
power_plot.min_border_bottom = 35

# temperature line plot
temp_plot = figure(frame_width=420, frame_height=225, title='Temperature in C')
temp_ds = [0] * temp_len
i = 0
for t in temp_data:
    temp_ds[i] = (temp_plot.line(x, temp_data[t], line_width=2, color=color_list[i], legend_label=t)).data_source
    i = i + 1
temp_plot.legend.click_policy = "hide"
temp_plot.add_layout(temp_plot.legend[0], 'right')
temp_plot.y_range = Range1d(0, 100)
temp_plot.min_border_left = 110
temp_plot.min_border_right = 100
temp_plot.min_border_bottom = 30

# table of min/max for voltages
max_volt = [0] * volt_len
min_volt = [7000] * volt_len
labels_volt = []
for v in volt_data:
    labels_volt.append(v)
min_max_volt = dict(labels=labels_volt, vmax=max_volt, vmin=min_volt)
min_max_volt_source = ColumnDataSource(min_max_volt)
min_max_volt_column = [
    TableColumn(field="labels", title="Voltage", width=145),
    TableColumn(field="vmax", title="Max", width=100),
    TableColumn(field="vmin", title="Min", width=100)
]
volt_data_table = DataTable(source=min_max_volt_source, columns=min_max_volt_column, index_position=None, autosize_mode='none',
                            width=350, height=500, margin=(20, 50, 10, 170), background=bg_color, css_classes=['custom_table'])

# memory bar plot
mem_bar_label = ['Swap ', 'Mem ', 'CMA ']
mem_bar_total = [0] * len(mem_bar_label)
mem_bar_used = [0] * len(mem_bar_label)
mem_bar_available = [0] * len(mem_bar_label)
mem_bar_percent = [0.0] * len(mem_bar_label)
mem_bar_dict = dict(mem_bar_label=mem_bar_label, mem_bar_total=mem_bar_total,
                    mem_bar_used=mem_bar_used, mem_bar_percent=mem_bar_percent,
                    mem_bar_available=mem_bar_available)
mem_bar_dict = dict(mem_bar_label=mem_bar_label, mem_bar_percent=mem_bar_percent)
mem_bar_source = ColumnDataSource(mem_bar_dict)
mem_plot_hbar = figure(y_range=mem_bar_label, x_range=[0, 100], frame_width=420, frame_height=225,
                       title='Memory Usage in %')
mem_percent_ds = (mem_plot_hbar.hbar(y='mem_bar_label', right='mem_bar_percent',
                                     tags=mem_bar_label, source=mem_bar_source,
                                     height=.5, fill_color='steelblue',
                                     hatch_pattern='vertical_line', hatch_weight=2, line_width=0)).data_source
hover = HoverTool(tooltips=[("Total in %:", "@mem_bar_percent")])
mem_plot_hbar.add_tools(hover)
mem_plot_hbar.min_border_left = 85
mem_plot_hbar.min_border_right = 55
mem_plot_hbar.min_border_bottom = 30

# apm bar plot
apm_len = len(apm_labels)
apm_bar = [0.0] * apm_len
apm_bar_dict = dict(apm_labels=apm_labels, apm_bar=apm_bar)
apm_bar_source = ColumnDataSource(apm_bar_dict)
apm_plot_hbar = figure(y_range=apm_labels, x_range=[0, 16], frame_width=420, frame_height=500,
                       title='Memory Throughput in Gbps')
apm_ds = (apm_plot_hbar.hbar(y='apm_labels', right='apm_bar', tags=apm_labels, source=apm_bar_source,
                             height=.5, fill_color='steelblue', hatch_pattern='vertical_line',
                             hatch_weight=2, line_width=0)).data_source
hover = HoverTool(tooltips=[("Memory Throughput in Gbps:", "@apm_bar")])
apm_plot_hbar.add_tools(hover)
apm_plot_hbar.min_border_left = 100
apm_plot_hbar.min_border_right = 100
apm_plot_hbar.min_border_bottom = 35

# helper function for reading sensor values
def hwmon_get_values():
    volts = []
    power = []
    temperatures = []
    for chip in sensors.iter_detected_chips():
        # read voltage and power values
        for feature in chip:
            if str(chip) in sensor:
                if feature.label == "in1":
                    if feature.label in sensor[str(chip)] and 'compute' in sensor[str(chip)][feature.label]:
#                         print(str(chip) + ' : ' + str(eval(str(feature.get_value()) + str(sensor[str(chip)][feature.label][compute]))))
                        volts.append(eval(str(feature.get_value()) + str(sensor[str(chip)][feature.label]['compute'])))
                    else:
                        volts.append(feature.get_value())
                if feature.label == "power1":
                    if feature.label in sensor[str(chip)] and 'compute' in sensor[str(chip)][feature.label]:
#                         print(str(chip) + ' : ' + str(eval(str(feature.get_value()) + str(sensor[str(chip)][feature.label][compute]))))
                        power.append(eval(str(feature.get_value()) + str(sensor[str(chip)][feature.label]['compute'])))
                    else:
                        power.append(feature.get_value())
                if 'temp' in feature.label:
                    if feature.label in sensor[str(chip)] and 'compute' in sensor[str(chip)][feature.label]:
#                        print(feature.label + ' : ' + str(eval(str(feature.get_value()) + str(sensor[str(chip)][feature.label]['compute'])))))
                        temperatures.append(eval(str(feature.get_value()) + str(sensor[str(chip)][feature.label]['compute'])))
                    else:
                        temperatures.append(feature.get_value())

    return volts, power, temperatures

time = 0

@linear()
def update(step):
    global time
    global sample_size_actual
    time = time + interval
    if sample_size_actual >= sample_size:
        x.popleft()
    x.append(time)

    # read metrics
    cpu = psutil.cpu_percent(percpu=True)
    volts, power, temperatures = hwmon_get_values()

    # plot cpu data
    j = 0
    for c in cpu_data:
#         print(c)
#         print('  cpu util: ' + str(cpu[j]))
        if sample_size_actual >= sample_size:
            cpu_data[c].popleft()

        cpu_data[c].append(cpu[j])
        cpu_ds[j].trigger('data', x, cpu_data[c])
        j = j + 1
    
    # plot power and voltage data
    j = 0
    for v in volt_data:
#         print(v)
#         print('  voltage: ' + str(volts[j]))
#         print('  power: ' + str(power[j]))           
#         print('')
        if sample_size_actual >= sample_size:
            volt_data[v].popleft()
            power_data[v].popleft()
           
        volt_data[v].append(volts[j])
        power_data[v].append(power[j])         
        power_ds[j].trigger('data', x, power_data[v])

        if (volts[j] < min_volt[j]) or (volts[j] > max_volt[j]):
            min_volt[j] = min(min_volt[j], volts[j])
            max_volt[j] = max(max_volt[j], volts[j])
            volt_data_table.source.trigger('data', volt_data_table.source, volt_data_table.source)
        
        j = j + 1

    # plot temperature data
    j = 0 
    for t in temp_data:
#         print(t)
#         print('  temperature: ' + str(temperatures[j]))
#         print('')
        if sample_size_actual >= sample_size:
            temp_data[t].popleft() 
        
        temp_data[t].append(temperatures[j])
        temp_ds[j].trigger('data', x, temp_data[t])
        j = j + 1

    # CmaTotal usage
    mem_bar_total[2] = mem.get('CmaTotal')
    mem_bar_available[2] = mem.get('CmaFree')
    mem_bar_used[2] = mem_bar_total[2] - mem_bar_available[2]
    mem_bar_percent[2] = 100 * mem_bar_used[2] / max(mem_bar_total[2], 1)
    # MemTotal usage 
    mem_bar_total[1] = mem.get('MemTotal')
    mem_bar_available[1] = mem.get('MemAvailable')
    mem_bar_used[1] = mem_bar_total[1] - mem_bar_available[1]
    mem_bar_percent[1] = 100 * mem_bar_used[1] / max(mem_bar_total[1], 1)   
    # SwapTotal usage
    mem_bar_total[0] = mem.get('SwapTotal')
    mem_bar_available[0] = mem.get('SwapFree')
    mem_bar_used[0] = mem_bar_total[0] - mem_bar_available[0]
    mem_bar_percent[0] = 100 * mem_bar_used[0] / max(mem_bar_total[0], 1)
    # update data
    mem_percent_ds.trigger('data', mem_bar_label, mem_bar_percent)
  
    # read APM values and add them to a list
    # the values for HDMI overlay planes 0 to 3 and 4 to 7 are added
    apm_bar[5] = apm.port[0].getThroughput(libxperfmon.Gbps) + apm.port[1].getThroughput(libxperfmon.Gbps)
    apm_bar[3] = apm.port[2].getThroughput(libxperfmon.Gbps)
    apm_bar[2] = apm.port[3].getThroughput(libxperfmon.Gbps)
    apm_bar[1] = apm.port[4].getThroughput(libxperfmon.Gbps)
    apm_bar[0] = apm.port[5].getThroughput(libxperfmon.Gbps)
    apm_bar[4] = apm.port[6].getThroughput(libxperfmon.Gbps)
    # update data
    apm_ds.trigger('data', apm_labels, apm_bar)
    
    if sample_size_actual < sample_size:
        sample_size_actual = sample_size_actual + 1

# create dashboard layout
layout1 = layout(column(row(title1, align='center'),   
                        row(cpu_plot, temp_plot, mem_plot_hbar, background=bg_color),
                        row(power_plot, apm_plot_hbar, volt_data_table, background=bg_color),
                        background=bg_color))

# Add a periodic callback to be run every 1000 milliseconds
callback = curdoc().add_periodic_callback(update, interval * 1000)
curdoc().theme = 'dark_minimal'
curdoc().add_root(layout1)
