Predicting breast cancer from digitized images of breast mass
================
Tiffany A. Timbers </br>
2019/12/30 (updated: 2020-01-07)

# Summary

# Introduction

# Methods

## Data

The data used to train and test the breast cancer predictive model was
sourced from the UCI Machine Learning Repository (Dua and Graff 2017)
and can be found
[here](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+\(Diagnostic\)),
specifically [this
file](http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data).
Only the following 11 variables were used in the analysis:

  - class
  - maximum area
  - maximum compactness
  - maximum concave\_points
  - maximum concavity
  - maximum fractal\_dimension
  - maximum perimeter
  - maximum radius
  - maximum smoothness
  - maximum symmetry
  - maximum texture

## Analysis

The k-nearest neighbors (k-nn) algorithm was used to build a
classification model to predict whether a tumour mass was benign or
malignant (found in the class column of the data set). The remaining 9
variables listed above were used as predictors in the model. The
hyperparameter \(K\) was chosen using 10-fold cross validation with
overall classification accuracy as the loss function. The R and Python
programming languages (R Core Team 2019; Van Rossum and Drake 2009) and
the following R and Python packages were used to perform the analysis:
caret (Jed Wing et al. 2019), docopt (de Jonge 2018), feather (Wickham
2019), knitr (Xie 2014), tidyverse (Wickham 2017), docopt (Keleshev
2014), os (Van Rossum and Drake 2009), feather (Wickham 2019) Pandas
(McKinney 2010). The code used to perform the analysis and create this
report can be found here:
<https://github.com/ttimbers/breast_cancer_predictor>.

# Results & Discussion

<img src="../results/predictor_distributions_across_class.png" title="Comparison of the empirical distributions of training data predictors between benign and malignant tumour masses." alt="Comparison of the empirical distributions of training data predictors between benign and malignant tumour masses." width="60%" />

<img src="../results/accuracy_vs_k.png" title="30-fold cross validation classification accuracy as K is varied." alt="30-fold cross validation classification accuracy as K is varied." width="40%" />

trete

0.95

# References

<div id="refs" class="references">

<div id="ref-docopt">

de Jonge, Edwin. 2018. *Docopt: Command-Line Interface Specification
Language*. <https://CRAN.R-project.org/package=docopt>.

</div>

<div id="ref-Dua2019">

Dua, Dheeru, and Casey Graff. 2017. “UCI Machine Learning Repository.”
University of California, Irvine, School of Information; Computer
Sciences. <http://archive.ics.uci.edu/ml>.

</div>

<div id="ref-caret">

Jed Wing, Max Kuhn. Contributions from, Steve Weston, Andre Williams,
Chris Keefer, Allan Engelhardt, Tony Cooper, Zachary Mayer, et al. 2019.
*Caret: Classification and Regression Training*.
<https://CRAN.R-project.org/package=caret>.

</div>

<div id="ref-docoptpython">

Keleshev, Vladimir. 2014. *Docopt: Command-Line Interface Description
Language*. <https://github.com/docopt/docopt>.

</div>

<div id="ref-mckinney-proc-scipy-2010">

McKinney, Wes. 2010. “Data Structures for Statistical Computing in
Python.” In *Proceedings of the 9th Python in Science Conference*,
edited by Stéfan van der Walt and Jarrod Millman, 51–56.

</div>

<div id="ref-R">

R Core Team. 2019. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

</div>

<div id="ref-Python">

Van Rossum, Guido, and Fred L. Drake. 2009. *Python 3 Reference Manual*.
Scotts Valley, CA: CreateSpace.

</div>

<div id="ref-tidyverse">

Wickham, Hadley. 2017. *Tidyverse: Easily Install and Load the
’Tidyverse’*. <https://CRAN.R-project.org/package=tidyverse>.

</div>

<div id="ref-feather">

———. 2019. *Feather: R Bindings to the Feather ’Api’*.
<https://CRAN.R-project.org/package=feather>.

</div>

<div id="ref-knitr">

Xie, Yihui. 2014. “Knitr: A Comprehensive Tool for Reproducible Research
in R.” In *Implementing Reproducible Computational Research*, edited by
Victoria Stodden, Friedrich Leisch, and Roger D. Peng. Chapman;
Hall/CRC. <http://www.crcpress.com/product/isbn/9781466561595>.

</div>

</div>
