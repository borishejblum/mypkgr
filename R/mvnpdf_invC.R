#' @rdname mvnpdf
#' @export
mvnpdf_invC <- function(x, mean =  rep(0, nrow(x)),
                        varcovM = diag(nrow(x)), Log = TRUE) {
  n <- ncol(x)
  p <- nrow(x)
  x0 <- x - mean
  Rinv <- invC(varcovM)
  LogDetvarcovM <- log(det(varcovM))

  y <- rep(NA, n)
  for (j in 1:n) {
    yj <- - p/2 * log(2*pi) - 0.5 * LogDetvarcovM -
      0.5 * t(x0[, j]) %*% Rinv %*% x0[, j]
    y[j] <- yj
  }

  if (!Log) {
    y <- exp(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)
}
