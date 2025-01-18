#!/bin/bash -e
# installation for norun_data_pipeline



conda create -n alphafold3  git python=3.11 -y
conda activate alphafold3


# clone repo
# git clone https://github.com/google-deepmind/alphafold3.git

# install dependencies with pip
cd alphafold3
pip3 install -r dev-requirements.txt --verbose
pip3 install --no-deps . --verbose #--verbose可以看到更详细的日志
build_data

echo "-----------------------------------------"
echo "Installation of AlphaFold 3 environment finished."
echo ""
echo "YOU NEED TO GET THE WEIGHTS FROM GOOGLE YOURSELF, AND ACCEPT THEIR LICENSE AGREEMENT!"
echo "Afterwards you can decompress them under $ALPHAFOLD3DIR/models"

echo "Inference step:"
echo "python $(realpath run_alphafold.py) \ "
echo "--output_dir \$YOUROUTPUTPATH \ "
echo "--json_path \$YOURINPUT \ "
echo "--model_dir \$model_parameter_path \ "
echo "--norun_data_pipeline "