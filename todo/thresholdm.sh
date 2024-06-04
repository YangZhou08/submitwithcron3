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
#SBATCH --partition=learnfair 
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

source /private/home/beidic/.bashrc 
source /public/apps/anaconda3/2022.05/etc/profile.d/conda.sh 
source activate base 
conda activate base 
# mamba activate yangllm 
# conda activate yangllm 
conda activate griffin 
# cd /fsx-storygen/beidic/yang/transformersprofiling 
cd /private/home/beidic/yang/GRIFFIN2 
git checkout yangexp2 
git pull 

# git pull 
# pip install termcolor 
# pip install wandb 
# pip install -U "huggingface_hub[cli]" 
# pip install matplotlib 
# pip install langdetect 
# pip install immutabledict 
# pip install sentencepiece 
# which python 

export WANDB_API_KEY=fbb26fc8718b8e58d743b5cdcabaa2396656f773 
wandb login 

which python 
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 

echo 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 | transformers-cli login 
huggingface-cli login --token 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 

thresholds=(0.05 0.1 0.15 0.2 0.3 0.4)

for threshold in ${thresholds[@]}; do
    accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=meta-llama/Meta-Llama-3-8B-Instruct,griffin=True,spr=0.5,check=True,kernel_size=16,thr=$threshold --tasks gsm8k --batch_size 1 --limit 0.5 
done
# accelerate launch main.py --model xhf --model_args pretrained=meta-llama/Meta-Llama-3-8B-Instruct,griffin=True,check=True,thresh=0.9 --tasks gsm8k --batch_size 1 --limit=128 
