#' Copy of mvtnorm::dmvnorm for progiling and reference
#'
#' @param x matrix
#' @param mean vector
#' @param sigma covariance matrix
#' @param log logical. Default is `FALSE`
#' @param checkSymmetry logical. Default is `TRUE`
#'
#' @export
#'
my_dmvnorm <- function(x, mean = rep(0, p), sigma = diag(p), log = FALSE,
                       checkSymmetry = TRUE) {

  tmp <- backsolve(dec, t(x) - mean, transpose = TRUE)
  rss <- colSums(tmp^2)
  logretval <- -sum(log(diag(dec))) - 0.5 * p * log(2 *
    pi) - 0.5 * rss

  if (log)
    logretval
  else exp(logretval)
}
