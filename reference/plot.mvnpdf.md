# Plot of the mvnpdf function on the first dimension

Plot of the mvnpdf function on the first dimension

## Usage

``` r
# S3 method for class 'mvnpdf'
plot(x, ...)
```

## Arguments

- x:

  an object of class `mvnpdf` resulting from a call of `mnvpdf()`
  function.

- ...:

  graphical parameters passed to
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) function.

## Value

Nothing is returned, only a plot is given.

## Examples

``` r
pdfvalues <- mvnpdf(x=matrix(seq(-3, 3, by = 0.1), nrow = 1), Log=FALSE)
plot(pdfvalues)
```
