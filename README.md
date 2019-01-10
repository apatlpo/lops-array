# lops-array
Play and benchmark xarray/dask libraries in an oceanographic / numerical modeling context

## Librairies installation

Librairies are installed via conda, see notes for [hal](https://github.com/apatlpo/lops-array/blob/master/doc/hal.md) and [datarmor](https://github.com/apatlpo/lops-array/blob/master/doc/CONDA.md)

## Init dask cluster

You need first to start a jupyterlab session with the following commands (from the `lops-array/datarmor/` folder):

```
conda activate lops-array
./launch-jlab.sh
```

The dask cluster is then created from jupyter-lab with [dask-jobqueue](https://dask-jobqueue.readthedocs.io/en/latest/):

```
from dask_jobqueue import PBSCluster
cluster = PBSCluster()
w = cluster.scale(8)

from dask.distributed import Client
client = Client(cluster)
```

Kill jobs once done with computations in  a notebook with:
```
cluster.scheduler.close()
```

## Useful links

Xarray: [doc](http://xarray.pydata.org/en/stable/index.html) + [github](https://github.com/pydata/xarray)

Dask: [doc](http://dask.pydata.org/en/latest/) + [github](https://github.com/dask/dask)

Dask dash-board: [video](https://www.youtube.com/watch?v=N_GqzcuGLCY)

Distributed: [doc](https://distributed.readthedocs.io/en/latest/)

Pangeo: [pangeo-data](https://pangeo-data.github.io/)  +  [github](https://github.com/pangeo-data/pangeo)
