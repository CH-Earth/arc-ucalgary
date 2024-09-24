#!/bin/bash

# load custom module system
. /work/comphyd_lab/local/modules/spack/2024v5/lmod-init-bash
ml unuse $MODULEPATH
ml use /work/comphyd_lab/local/modules/spack/2024v5/modules/linux-rocky8-x86_64/Core/
ml load py-jupyterlab
ml load node-js
ml load py-terminado
ml load py-pip

# As per https://rcs.ucalgary.ca/index.php/Jupyter_Notebooks
unset XDG_RUNTIME_DIR

# make the NotebookApp values into ServerApp for JupyterLab
sed -i 's/NotebookApp/ServerApp/g' "${CONFIG_FILE}"
sed -i 's/notebook_dir/root_dir/g' "${CONFIG_FILE}"

# Launch the Jupyter Notebook Server
set -x
export PS1='(comphyd) \u@\h:\W\$ '
jupyter lab --config="${CONFIG_FILE}"

