#include <RcppArmadillo.h>

// [[Rcpp::depends(RcppArmadillo)]]
//'Compute the inverse of a matrix
//'
//'@param A a matrix
//'
//'
// [[Rcpp::export]]
arma::mat invC(arma::mat A) {
  arma::mat Ainv = inv(A);
  return Ainv;
}


