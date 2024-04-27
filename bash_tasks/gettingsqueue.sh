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
