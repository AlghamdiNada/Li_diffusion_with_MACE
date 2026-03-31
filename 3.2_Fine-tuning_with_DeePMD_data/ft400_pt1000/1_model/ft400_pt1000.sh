#!/bin/bash
#SBATCH --account=xxxxxx
#SBATCH --partition=boost_usr_prod  # partition to be used
#SBATCH --qos normal         # boost_qos_dbg, normal
#SBATCH --time 24:00:00             # format: HH:MM:SS
#SBATCH --nodes=2#2                   # node
#SBATCH --ntasks-per-node=4#4         # tasks out of 32
#SBATCH --gres=gpu:4#4               # gpus per node out of 4
#SBATCH --cpus-per-task=4#4           # cpus per node out of 32
##SBATCH --mem=100000 # all memory (494GB)
##SBATCH --mem-per-cpu=12GB         # higher than 12GB = higher pricing
##SBATCH --mem=494000 # all memory (494GB)
##SBATCH --exclusive # exclusive access to the node
############################

module purge
module load lammps-mace
source /leonardo/home/userexternal/nalghamd/env/mace-0.3.12/bin/activate

echo Starting on $SLURM_JOB_NODELIST with MPI: $SLURM_NTASKS OMP: $SLURM_CPUS_PER_TASK
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
echo GPU visible $CUDA_VISIBLE_DEVICES

#srun python3 ./mace-train-run.py
#srun python3 ./test-run.py
srun python /leonardo/home/userexternal/nalghamd/programs/mace-0.3.12/mace/cli/run_train.py \
    --name="MACE_1" \
    --train_file="../../400-REF_train.xyz" \
    --valid_file="../../400-REF_valid.xyz" \
    --loss='universal' \
    --E0s='{3: -202.82202355577203, 9: -803.8441491412796}' \
    --energy_weight=1 \
    --forces_weight=10 \
    --compute_stress=True \
    --stress_weight=1 \
    --energy_key='REF_energy' \
    --forces_key='REF_forces' \
    --stress_key='REF_stress' \
    --foundation_model='/leonardo/home/userexternal/nalghamd/.cache/mace/mace-mpa-0-medium.model' \
    --multiheads_finetuning=True \
    --num_samples=1000\
    --pt_train_file='../../train_mp_finetuning-MACE_900.xyz' \
    --pt_valid_file='../../valid_mp_finetuning-MACE_100.xyz' \
    --eval_interval=1 \
    --error_table='PerAtomMAE' \
    --model="MACE" \
    --num_interactions=2 \
    --correlation=3 \
    --max_ell=3 \
    --r_max=6.0 \
    --max_L=1 \
    --num_channels=128 \
    --num_radial_basis=8 \
    --MLP_irreps="16x0e" \
    --scaling='rms_forces_scaling' \
    --lr=0.005 \
    --weight_decay=1e-8 \
    --ema \
    --ema_decay=0.995 \
    --scheduler_patience=5 \
    --batch_size=2 \
    --valid_batch_size=2 \
    --pair_repulsion \
    --distance_transform="Agnesi" \
    --max_num_epochs=800 \
    --patience=50 \
    --amsgrad \
    --device=cuda \
    --seed=2 \
    --clip_grad=100 \
    --restart_latest \
    --default_dtype="float64" \
    --num_workers=$SLURM_CPUS_PER_TASK \
    --plot_frequency=50 \
    --enable_cueq=True \
    --save_cpu \
    --distributed
