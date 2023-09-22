test_that("correct results for bivariate gaussian", {
  expect_equal(mvnpdfsmart(x=matrix(rep(1.96,2), nrow=2, ncol=1),
                           mean=c(0, 0), varcovM=diag(2), Log=FALSE)$y,
               mvtnorm::dmvnorm(rep(1.96, 2)))
})
