#include <RcppArmadillo.h>
using namespace arma;
// [[Rcpp::depends(RcppArmadillo)]]
//'@rdname mvnpdf
//'@export
// [[Rcpp::export]]
arma::vec mvnpdfsmartC(arma::mat x,
                       arma::colvec mean,
                       arma::mat varcovM,
                       bool Log=true) {
  int p = x.n_rows;
  int n = x.n_cols;

  mat invvarcovM = inv_sympd(varcovM);
  double LogDetvarcovM = log_det_sympd(varcovM);

  vec y(n);
  for (int j=0; j < n; j++){
    colvec x_0 = x.col(j) - mean;
    vec tempres = -p/2.0 * log(2.0*M_PI) - 0.5 * LogDetvarcovM - 0.5 * x_0.t() * invvarcovM * x_0;
    y(j) =  tempres(0);
  }

  if (!Log){
    y =  exp(y);
  }

  return y;
}
