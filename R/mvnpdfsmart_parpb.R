#' @rdname mvnpdf
#' @param ncpus number of cores for parallelized pbapply
#' @importFrom pbapply pbsapply
#' @export
mvnpdfsmart_parpb <- function(x, mean =  rep(0, nrow(x)),
                            varcovM = diag(nrow(x)), Log = TRUE, ncpus=1) {
  n <- ncol(x)
  p <- nrow(x)
  x0 <- x - mean
  Rinv <- solve(varcovM)
  LogDetvarcovM <- log(det(varcovM))

  y <- pbapply::pbsapply(1:n, function(j){
    x0j <- x0[, j]
    - p/2 * log(2*pi) - 0.5 * LogDetvarcovM - 0.5 * t(x0j) %*% Rinv %*% x0j
  }, cl=ncpus)

  if (!Log) {
    y <- exp(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)
}
