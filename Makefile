# breast cancer data pipe
# WORK IN PROGRESS

all: data/processed/training.feather data/processed/test.feather scale_factor.rds

# download data
data/raw/wdbc.feather: src/download_data.py
	python src/download_data.py --out_type=feather --url=http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data --out_file=data/raw/wdbc.feather

# pre-process data 
data/processed/training.feather data/processed/test.feather scale_factor.rds: src/pre_process_wisc.r data/raw/wdbc.feather
	Rscript src/pre_process_wisc.r --input=data/raw/wdbc.feather --out_dir=data/processed 

clean: 
	rm -rf data
			