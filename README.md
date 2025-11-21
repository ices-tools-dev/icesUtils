![Project Status](https://www.repostatus.org/badges/latest/active.svg)
[![r-universe
name](https://ices-tools-prod.r-universe.dev/badges/:name)](https://ices-tools-prod.r-universe.dev)
[![version
number](https://ices-tools-prod.r-universe.dev/badges/icesUtils)](https://ices-tools-prod.r-universe.dev/icesUtils)
![branch version
number](https://img.shields.io/badge/branch_version-0.0.2-blue)
[![GitHub
release](https://img.shields.io/github/release/ices-tools-prod/icesUtils.svg?maxAge=6000)]()
[![License](https://img.shields.io/badge/license-GPL%20(%3E%3D%202)-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

[<img align="right" alt="ICES Logo" width="17%" height="17%" src="http://ices.dk/_layouts/15/1033/images/icesimg/iceslogo.png">](http://ices.dk)

### icesUtils

icesUtils provides useful R functions for working with ICES webservices
and creating visualizations.

icesUtils is implemented as an [R](https://www.r-project.org) package
and is currently hosted on
[r-universe](https://ices-tools-prod.r-universe.dev).

### Installation

The stable version of icesUtils can be installed from r-univers using
the `install.packages` command:

``` r
install.packages("icesUtils", repos = "https://ices-tools-prod.r-universe.dev")
```

or a potentially more recent, but less stable version installed from
github using the `devtools` package:

``` r
devtools::install_github("ices-tools-dev/icesUtils@develop")
```

### Usage

For a summary of the package:

``` r
library(icesUtils)
?icesUtils
```

### Examples

### References

ICES Stock Assessment Graphs database: <https://sg.ices.dk>

ICES Stock Assessment Graphs web services:
<https://sg.ices.dk/webservices.aspx>

### Development

icesUtils is developed openly on
[GitHub](https://github.com/ices-tools-dev/icesUtils).

Feel free to open an
[issue](https://github.com/ices-tools-dev/icesUtils/issues) there if you
encounter problems or have suggestions for future versions.

The current development version can be installed using:

``` r
library(devtools)
install_github("ices-tools-dev/icesUtils@develop")
```
