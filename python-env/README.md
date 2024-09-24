# Installation
The module list takes care of all the necessary installations for the JupyterLab
environment, except for the lmod module.

The following workflow is used:

```console
$ ml load py-jupyterlab
$ ml load py-pip
$ pip install jupyterlmod
```

The following command shows all the available extensions:
```console
$ jupyter server extension list
```
