# lops-array
Play and benchmark xarray/dask libraries in an oceanographic / numerical modeling context

## Roadmap
- Define relevant diagnostics (AP)
- Write a starter notebook with NATL60 outputs (AP)
- Identify profiling tools and metrics
- Perform a technological watch on the pangeo project: [pangeo-data](https://pangeo-data.github.io/)  +  [github](https://github.com/pangeo-data/pangeo)
- Identify computing platformS
- Move data if necessary
- september/october 2018: NG actively works on the project

## Librairies installation

Librairies are installed via conda, see [here](https://github.com/apatlpo/lops-array/blob/master/doc/CONDA.md) for more details

## Init dask cluster

In order to start a dask cluster, run the following commands:

```
cd datarmor/
./launch-dask.sh ${N_WORK_NODES}
```

where ```N_WORK_NODES``` is the number of work nodes.

See [here](https://pangeo-data.github.io/pangeo/setup_guides/cheyenne.html) for a strong source of inspiration


## Useful links
Xarray: [doc](http://xarray.pydata.org/en/stable/index.html) + [github](https://github.com/pydata/xarray)

Dask: [doc](http://dask.pydata.org/en/latest/) + [github](https://github.com/dask/dask)

Distributed: [doc](https://distributed.readthedocs.io/en/latest/)

Pangeo: [pangeo-data](https://pangeo-data.github.io/)  +  [github](https://github.com/pangeo-data/pangeo)

