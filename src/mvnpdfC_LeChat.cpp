#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace arma;

// [[Rcpp::depends(RcppArmadillo)]]

const double log2pi2 = std::log(2.0 * M_PI) / 2.0;
//'@rdname mvnpdf
//'@order 7
//'@export
// [[Rcpp::export]]
arma::vec mvnpdfC_LeChat(arma::mat x,
                         arma::colvec mean,
                         arma::mat varcovM,
                         bool Log=true) {
  int p = x.n_rows;
  int n = x.n_cols;
  vec y(n);
  mat Rinvsr = inv(trimatu(chol(varcovM)));
  double logSqrtDetvarcovM = sum(log(Rinvsr.diag()));
  double constant = -p * log2pi2;

  for (int i = 0; i < n; i++) {
    // Avoid trans() and %: use dot(Rinvsr * x_i, Rinvsr * x_i)
    // and substract mean in place
    colvec Rinvsr_x_i = Rinvsr * (x.col(i) - mean);
    double quadform = arma::dot(Rinvsr_x_i, Rinvsr_x_i);
    if (!Log) {
      y(i) = std::exp(-0.5 * quadform + logSqrtDetvarcovM + constant);
    } else {
      y(i) = -0.5 * quadform + logSqrtDetvarcovM + constant;
    }
  }
  return y;
}
