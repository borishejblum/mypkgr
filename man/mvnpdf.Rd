% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R, R/mvnpdf.R, R/mvnpdf_invC.R,
%   R/mvnpdfoptim.R, R/mvnpdfoptim_par.R, R/mvnpdfsmart.R, R/mvnpdfsmart_par.R,
%   R/mvnpdfsmart_parpb.R, R/mvnpdfsmart_sleepy.R, R/mvnpdfsmart_sleepy_par.R
\name{mvnpdfoptimC}
\alias{mvnpdfoptimC}
\alias{mvnpdfsmartC}
\alias{mvnpdf}
\alias{mvnpdf_invC}
\alias{mvnpdfoptim}
\alias{mvnpdfoptim_par}
\alias{mvnpdfoptim_parIter}
\alias{mvnpdfsmart}
\alias{mvnpdfsmart_par}
\alias{mvnpdfsmart_parpb}
\alias{mvnpdfsmart_sleepy}
\alias{mvnpdfsmart_sleepy_par}
\title{Based on the implementation from Nino Hardt and Dicko Ahmadou
http://gallery.rcpp.org/articles/dmvnorm_arma/
(accessed in August 2014)}
\usage{
mvnpdfoptimC(x, mean, varcovM, Log = TRUE)

mvnpdfsmartC(x, mean, varcovM, Log = TRUE)

mvnpdf(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdf_invC(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfoptim(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfoptim_par(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfoptim_parIter(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE,
  ncores = 1
)

mvnpdfsmart(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfsmart_par(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)

mvnpdfsmart_parpb(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE,
  ncpus = 1
)

mvnpdfsmart_sleepy(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE
)

mvnpdfsmart_sleepy_par(
  x,
  mean = rep(0, nrow(x)),
  varcovM = diag(nrow(x)),
  Log = TRUE
)
}
\arguments{
\item{x}{a p x n data matrix with n the number of observations and
p the number of dimensions}

\item{mean}{mean vector}

\item{varcovM}{variance-covariance matrix}

\item{Log}{logical flag for returning the log of the probability density
function. Default is \code{TRUE}.}

\item{ncores}{number of parallel cores to split task over when using itertools}

\item{ncpus}{number of cores for parallelized pbapply}
}
\value{
a list containing the input matrix x and y the multivariate-Normal probability density function
computed at x
}
\description{
This is a concise description of what the function does.
}
\details{
This part gives more details on the function.
}
\examples{
mvnpdf(x=matrix(1.96), Log=FALSE)
dnorm(1.96)

mvnpdf(x=matrix(rep(1.96, 2), nrow=2, ncol=1), Log=FALSE)
\dontrun{
n <- 10000
mb <- microbenchmark::microbenchmark(
  mvtnorm::dmvnorm(matrix(1.96, nrow = n, ncol = 2)),
  mvnpdfsmart(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
  mvnpdfoptim_par(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
  times=10L)
mb
}

}
