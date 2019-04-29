#!/bin/sh

# enable notebook/lab extensions needed for ipywdigets
jupyter nbextension enable --py --sys-prefix widgetsnbextension
# use --dev suffix as otherwise webpack stalls
jupyter labextension install @jupyter-widgets/jupyterlab-manager --dev

# print instructions for starting jupyterlab web server
ip=`ifconfig eth0 2>/dev/null | awk '/inet addr:/ {print $2}' | sed 's/addr://'`
echo "jupyter lab --no-browser --allow-root --ip=${ip} &"
