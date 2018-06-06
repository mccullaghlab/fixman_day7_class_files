#!/bin/bash
#SBATCH --job-name=min2 
#SBATCH --output=job.2.out
#SBATCH --time=48:00:00
#SBATCH --nodes=1 
#SBATCH --partition=mccullagh-gpu
#SBATCH --gres=gpu:titan:1 
#SBATCH --reservation=workshop_gpu

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/usr/gcc-4.9.2/lib64"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/usr/hpcx-v1.2.0-292-gcc-MLNX_OFED_LINUX-2.4-1.0.0-redhat6.6/ompi-mellanox-v1.8/lib"
export AMBERHOME="/mnt/lustre_fs/users/mjmcc/apps/amber14"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$AMBERHOME/lib"
srun -N1 -n2 $AMBERHOME/bin/pmemd.MPI -O -i min.2.in -o min.2.out -r min.2.rst7 -x min.2.nc -c min.1.rst7 -p ../../tleap/trpcage.parm7 -ref min.1.rst7
