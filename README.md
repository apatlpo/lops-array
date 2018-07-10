# lops-array
Play and benchmark xarray/dask libraries in an oceanographic / numerical modeling context

## Roadmap
- Perform a technological watch on the pangeo project: [pangeo-data](https://pangeo-data.github.io/)  +  [github](https://github.com/pangeo-data/pangeo)
- Define relevant diagnostics (AP): rechunking to process along time with a synthetic dataset, identify data access choking plus appropriate chunking 
- Write a starter notebook with NATL60 outputs (AP): na
- Identify profiling tools and metrics: dashboard, basic timing
- Identify computing platformS: datarmor
- Move data if necessary: create synthetic dataset instead
- september/october 2018: NG actively works on the project

## Librairies installation

Librairies are installed via conda, see [here](https://github.com/apatlpo/lops-array/blob/master/doc/CONDA.md) for more details

## Init dask cluster

You need first to start a jupyterlab session with the following commands (from the `datarmor/` folder):

```
bash
source activate lops-array
./launch-jlab.sh
```

(*will be updated soon*) The dask cluster is then created from jupyter-lab with [dask-jobqueue](https://dask-jobqueue.readthedocs.io/en/latest/):

```
from dask_jobqueue import PBSCluster
local_dir = os.getenv('TMPDIR')
cluster = PBSCluster(local_directory=local_dir)
w = cluster.start_workers(10)

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

Distributed: [doc](https://distributed.readthedocs.io/en/latest/)

Pangeo: [pangeo-data](https://pangeo-data.github.io/)  +  [github](https://github.com/pangeo-data/pangeo)

