#!/bin/bash
#SBATCH --job-name=min1 
#SBATCH --output=job.1.out
#SBATCH --nodes=1 
#SBATCH --time=06:00:00
#SBATCH --qos=normal
#SBATCH --partition=sgpu

module purge
module load cuda/9.0.176
module load gcc
#module load openmpi/2.0.1

export AMBERHOME="/projects/ptlake@colostate.edu/amber16"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${AMBERHOME}/lib"

# first minimization
$AMBERHOME/bin/pmemd.cuda -O -i min.1.in -o min.1.out -r min.1.rst7 -x min.1.nc -c ../../tleap/trpcage.rst7 -p ../../tleap/trpcage.parm7 -ref ../../tleap/trpcage.rst7

# second minimization
$AMBERHOME/bin/pmemd.cuda -O -i min.2.in -o min.2.out -r min.2.rst7 -x min.2.nc -c min.1.rst7 -p ../../tleap/trpcage.parm7 -ref min.1.rst7

