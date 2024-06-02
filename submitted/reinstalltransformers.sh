source /private/home/beidic/.bashrc 
source /public/apps/anaconda3/2022.05/etc/profile.d/conda.sh 
source activate base 
conda activate base 
conda activate griffin 
# pip uninstall transformers 
# pip install --force-reinstall transformers 
pip install --force-reinstall transformers==4.38.1 

python -c "from transformers.cache_utils import Cache, DynamicCache, StaticCache, SinkCache" 
