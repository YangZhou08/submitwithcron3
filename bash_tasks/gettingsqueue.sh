source /private/home/beidic/.bashrc 
source /private/home/beidic/anaconda3/etc/profile.d/conda.sh 
ls 
rm -rf transformersprofiling 
ls 

cd /private/home/beidic/yang/ 
ls 

conda create -n yangllm2 python=3.9 
conda activate yangllm2 
pwd 
ls 
git clone https://github.com/YangZhou08/transformersprofiling.git 
pip install torch 
ls 
cd transformersprofiling 
pip install -e . 
pip install datasets 
pip install accelerate 
pip install SentencePiece 
