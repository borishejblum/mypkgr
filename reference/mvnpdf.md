# Multivariate-Normal probability density function

This is a concise description of what the function does.

## Usage

``` r
mvnpdf(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfsmart(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfoptim(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdf_invC(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfsmartC(x, mean, varcovM, Log = TRUE)

mvnpdfoptimC(x, mean, varcovM, Log = TRUE)

mvnpdfC_LeChat(x, mean, varcovM, Log = TRUE)

mvnpdfsmart_par(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfsmart_parpb(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE,
  ncpus = 1
)

mvnpdfsmart_sleepy_par(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE
)

mvnpdfsmart_sleepy(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE
)

mvnpdfoptim_par(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfoptim_parIter(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE,
  ncores = 1
)
```

## Arguments

- x:

  a p x n data matrix with n the number of observations and p the number
  of dimensions

- mean:

  mean vector

- varcovM:

  variance-covariance matrix

- Log:

  logical flag for returning the log of the probability density
  function. Default is `TRUE`.

- ncpus:

  number of cores for parallelized pbapply

- ncores:

  number of parallel cores to split task over when using itertools

## Value

a list containing the input matrix x and y the multivariate-Normal
probability density function computed at x

## Details

This part gives more details on the function.

the implementation of mvnpdfoptimC based on the implementation from Nino
Hardt and Dicko Ahmadou http://gallery.rcpp.org/articles/dmvnorm_arma/
(accessed in August 2014)

## Examples

``` r
mvnpdf(x = matrix(1.96), Log = FALSE)
#> $x
#>      [,1]
#> [1,] 1.96
#> 
#> $y
#> [1] 0.05844094
#> 
#> attr(,"class")
#> [1] "mvnpdf"
dnorm(1.96)
#> [1] 0.05844094

mvnpdf(x = matrix(rep(1.96, 2), nrow = 2, ncol = 1), Log = FALSE)
#> $x
#>      [,1]
#> [1,] 1.96
#> [2,] 1.96
#> 
#> $y
#> [1] 0.003415344
#> 
#> attr(,"class")
#> [1] "mvnpdf"
if (FALSE) { # \dontrun{
n <- 10000
mb <- microbenchmark::microbenchmark(
  mvtnorm::dmvnorm(matrix(1.96, nrow = n, ncol = 2)),
  mvnpdfsmart(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
  mvnpdfoptim_par(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
  times=10L)
mb
} # }
```
