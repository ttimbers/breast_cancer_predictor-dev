#!/usr/bin/env python
# author: Tiffany Timbers
# date: 2019-12-18
#
# Downloads data csv data from the web to a local filepath as either a csv or feather file format.
#
# Example
# python src/download_data.py --out=feather --url=http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data --path=data/raw/wdbc.feather

import argparse
import os
import re
import pandas as pd
import feather

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument("--out")
  parser.add_argument("--url")
  parser.add_argument("--path")
  args = parser.parse_args()

  # out = "feather"
  # url = "http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
  # path = "data/raw/wdbc.feather"
  out = args.out
  url = args.url
  path = args.path
  
  data = pd.read_csv(url)
  
  if out == "csv":
    try:
      data.to_csv(path, index = False)
    except:
      os.makedirs(os.path.dirname(path))
      data.to_csv(path, index = False)
  elif out == "feather":
    try:  
      feather.write_dataframe(data, path)
    except:
      os.makedirs(os.path.dirname(path))
      feather.write_dataframe(data, path)

if __name__ == "__main__":
  main()
