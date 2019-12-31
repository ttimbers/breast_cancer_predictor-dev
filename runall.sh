# breast cancer data pipe
# WORK IN PROGRESS

# download data
python src/download_data.py --out_type=feather --url=http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data --out_file=data/raw/wdbc.feather

# pre-process data 
Rscript src/pre_process_wisc.r --input=data/raw/wdbc.feather --out_dir=data/processed 

# tune model
Rscript src/fit_breast_cancer_predict_model.r --train=data/processed/training.feather --out_dir=results

# test model
Rscript src/breast_cancer_test_results.r --test=data/processed/test.feather --out_dir=results