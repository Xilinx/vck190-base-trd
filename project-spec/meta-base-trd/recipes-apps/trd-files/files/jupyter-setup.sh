#!/bin/sh

# enable notebook/lab extensions needed for ipywdigets
jupyter nbextension enable --py --sys-prefix widgetsnbextension

# use --dev suffix as otherwise webpack stalls
jupyter labextension install @jupyter-widgets/jupyterlab-manager --dev
