# author: Tiffany Timbers
# date: 2019-12-18
#
# Downloads data csv data from the web to a local filepath as either a csv or feather file format.
#
# Example
# python src/download_data.py --out_type=feather --url=http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data --out_file=data/raw/wdbc.feather

import argparse
import os
import re
import pandas as pd
import feather

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument("--out_type")
  parser.add_argument("--url")
  parser.add_argument("--out_file")
  args = parser.parse_args()

  out_type = args.out_type
  url = args.url
  out_file = args.out_file
  
  data = pd.read_csv(url, header=None)
  
  if out_type == "csv":
    try:
      data.to_csv(out_file, index = False)
    except:
      os.makedirs(os.path.dirname(out_file))
      data.to_csv(out_file, index = False)
  elif out_type == "feather":
    try:  
      feather.write_dataframe(data, out_file)
    except:
      os.makedirs(os.path.dirname(out_file))
      feather.write_dataframe(data, out_file)

if __name__ == "__main__":
  main()
