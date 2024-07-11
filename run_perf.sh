#!/bin/bash -l
:set ff=unix
#SBATCH --job-name=run_perf        # Job name
#SBATCH --nodes=1 --time=01:00:00  # Time limit hrs:min:sec
#SBATCH --export=NONE
#SBATCH --mail-type=START
#SBATCH --mail-type=ALL            # Send email when job ends
#SBATCH --mail-user=akpvu@outlook.com  # Email address to send notifications

# Load any necessary modules (if needed)
# module load intel

# Set OpenMP environment variables
export OMP_NUM_THREADS=72
export OMP_PROC_BIND=close
export OMP_PLACES=cores


# Loop to run the command 10 times
for i in {1..20}
do
   echo "Run #$i"
   srun -qopenmp --cpu-freq=2000000-2000000 ./perf 1000 1000
done
