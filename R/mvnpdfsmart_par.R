#' @rdname mvnpdf
#' @order 8
#' @export
mvnpdfsmart_par <- function(x, mean =  rep(0, nrow(x)),
                            varcovM = diag(nrow(x)), Log = TRUE) {
  n <- ncol(x)
  p <- nrow(x)
  x0 <- x - mean
  Rinv <- solve(varcovM)
  LogDetvarcovM <- log(det(varcovM))

  y <- future.apply::future_sapply(X = 1:n, FUN = function(j) {
    yj <- -p / 2 * log(2 * pi) - 0.5 * LogDetvarcovM -
      0.5 * t(x0[, j]) %*% Rinv %*% x0[, j]
  })

  if (!Log) {
    y <- exp(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)
}
