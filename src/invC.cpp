#include <RcppArmadillo.h>
using namespace arma;
// [[Rcpp::depends(RcppArmadillo)]]
//'Compute the inverse of a matrix
//'
//'@param A a matrix
//'
//'@export
// [[Rcpp::export]]
arma::mat invC(arma::mat A) {
  mat Ainv = inv(A);
  return Ainv;
}


