# install of xarray/dask and other on HAL


## generic librairies

In order to have internet access you need to set:
```
# ask aurelien
```

In order to pull and push from/to github, you need to run once:
```
# ask aurelien
```

For conda, you need to deactivate ssl in .condarc:
```
cat ~/.condarc
ssl_verify: false
```

This is what was installed:
```
module load conda
conda create -n equinox -c conda-forge python=3.6
conda activate equinox
conda install dask xarray jupyterlab cartopy python-graphviz
conda install -c conda-forge dask-jobqueue zarr spectrum
pip install --cert /etc/pki/tls/certs/ca-bundle.crt cmocean --user
```

You need to connect the equinox environment and jupyterhub:
```
module load conda
conda activate equinox
ipython kernel install --user --name equinox
```
See help on HAL [wiki](https://gitlab.cnes.fr/inno/rt-nouvelles-technos-distrib/blob/master/doc/utilisation_hub.rst)

netcdf4 was installed afterwards, may need to do it at the same time than dask-jobqueue:
```
conda install -c conda-forge netcdf4
```
(we may need to redo a clean install)

cartopy coastlines need to be downloaded and massaged, see `cartopy/log.md`

Optional (for testing): install latest xarray code and h5netcdf:
```
conda uninstall xarray --force
pip install --cert /etc/pki/tls/certs/ca-bundle.crt https://github.com/pydata/xarray/archive/master.zip --user
pip install --cert /etc/pki/tls/certs/ca-bundle.crt h5netcdf --user
```


## EQUINOx specific libraries

```
pip install --cert /etc/pki/tls/certs/ca-bundle.crt git+https://github.com/apatlpo/xmitgcm.git@angles --user
pip install --cert /etc/pki/tls/certs/ca-bundle.crt git+https://github.com/xgcm/xgcm.git --user
git clone https://github.com/apatlpo/mit_equinox.git
cd mit_equinox
pip install -e . --user
```



---

# old stuff

This is what was *not* installed because conda-forge is not working for some reason
```
module load conda
conda create -n equinox -c conda-forge python=3.6 dask dask-jobqueue \
            xarray jupyterlab cartopy zarr python-graphviz spectrum
conda activate equinox
#pip install git+https://github.com/xgcm/xmitgcm.git
pip install git+https://github.com/apatlpo/xmitgcm.git@angles
pip install git+https://github.com/xgcm/xgcm.git
#pip install git+https://github.com/rabernat/xrft.git
#pip install git+https://github.com/apatlpo/xscale.git
#pip install git+https://github.com/apatlpo/UTide.git
#pip install cmocean
cd mit_equinox; pip install -e .
cp datarmor/jobqueue.yaml datarmor/distributed.yaml ~/.config/dask/
```
