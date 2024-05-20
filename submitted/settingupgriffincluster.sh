pwd 
ls 
rm -rf GRIFFIN2 
cd /private/home/beidic/yang/ 
ls 
pwd 
git clone git@github.com:Infini-AI-Lab/GRIFFIN2.git 
cd GRIFFIN2 
# source /private/home/beidic/.bashrc 
# source /public/apps/anaconda3/2022.05/etc/profile.d/conda.sh 
conda env create -f griffin.yml 
conda activate griffin 
cd src 
pip install lm_eval 
