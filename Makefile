# breast cancer data pipe
# WORK IN PROGRESS

all: results/final_model.rds results/accuracy_vs_k.png results/predictor_distributions_across_class.png results/final_model_quality.rds

# download data
data/raw/wdbc.feather: src/download_data.py
	python src/download_data.py --out_type=feather --url=http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data --out_file=data/raw/wdbc.feather

# pre-process data 
data/processed/training.feather data/processed/test.feather scale_factor.rds: src/pre_process_wisc.r data/raw/wdbc.feather
	Rscript src/pre_process_wisc.r --input=data/raw/wdbc.feather --out_dir=data/processed 

# exploratory data analysis - visualize predictor distributions across classes
results/predictor_distributions_across_class.png: src/eda_wisc.r data/processed/training.feather
	Rscript src/eda_wisc.r --train=data/processed/training.feather --out_dir=results

# tune model
results/final_model.rds results/accuracy_vs_k.png: src/fit_breast_cancer_predict_model.r data/processed/training.feather
	Rscript src/fit_breast_cancer_predict_model.r --train=data/processed/training.feather --out_dir=results

# test model
results/final_model_quality.rds: src/breast_cancer_test_results.r data/processed/test.feather
	Rscript src/breast_cancer_test_results.r --test=data/processed/test.feather --out_dir=results

# render report

clean: 
	rm -rf data
	rm -rf results
			