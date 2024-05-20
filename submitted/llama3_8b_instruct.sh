#!/bin/bash
## job name
#SBATCH --job-name=yangzho6
## filename for job standard output (stdout)
## %j is the job id, %u is the user id

#SBATCH --output=/private/home/beidic/yang/log/log-%j.out
## filename for job standard error output (stderr)
#SBATCH --error=/private/home/beidic/yang/log/log-%j.err

#SBATCH --time=24:00:00 

## partition name
#SBATCH --partition=devlab
## number of nodes
#SBATCH --nodes=1

## number of tasks per node
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=10
#SBATCH --mem=512GB
#SBATCH --gpus-per-node=8
#SBATCH -C volta32gb
#SBATCH --no-requeue
## SBATCH --array=0-11 # 12 jobs in total 

# source /data/home/beidic/.bashrc 
# source /data/home/beidic/anaconda3/etc/profile.d/conda.sh 
# source activate base
# conda activate base 
# mamba activate yangllm 
# conda activate yangllm 
conda activate griffin 
cd /fsx-storygen/beidic/yang/transformersprofiling 
git pull 
# pip install termcolor 
pip install -e . 
pip install termcolor 
pip install wandb 
pip install datasets 
pip install accelerate 
pip install -U "huggingface_hub[cli]" 
pip install matplotlib 
pip install sentencepiece 
which python 
