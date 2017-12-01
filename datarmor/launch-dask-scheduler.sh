#!/bin/csh
#PBS -N dask-scheduler
#PBS -q mpi_1
#PBS -l select=1:ncpus=28:mpiprocs=7:ompthreads=7:mem=100g
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -m abe

# Writes ~/dask/scheduler.json file in home directory
# Connect with
# >>> from dask.distributed import Client
# >>> client = Client(scheduler_file='~/dask/scheduler.json')

# Setup Environment
setenv PATH ${HOME}/.miniconda3/envs/pangeo/bin:${PATH}

setenv SCHEDULER ${HOME}/dask/scheduler.json
rm -f ${SCHEDULER}
mpirun --np 7 dask-mpi --nthreads 4 \
     --memory-limit 1e9 \
     --interface ib0 \
     --local-directory ${HOME}/dask \
     --scheduler-file=${SCHEDULER}

## useful info:
# - this requests 1Go per MPI process
#   (datarmor has 128Go per node, 128/7 = 18Go per mpi process)
# - for infos about the queue: qstat -Qf mpi_1
# - to get info about a job:   tracejob job_no    qstat -f job_no



