[![Build Status](https://travis-ci.org/jeffdk/rPackageTemplate.svg?branch=master)](https://travis-ci.org/jeffdk/rPackageTemplate) 
## Generates a clean template for a new R package

### Instructions

Navagate to the directory in which you wish to create your new
package.  If you are using Rstudio, you can use `setwd("<dir>")` to do
this.  Create the package with:
```R
library(rPackageTemplate)
new_package()
```
You will be prompted for the following:
 * Package Name  (please use no spaces or special characters)
 * First Name
 * Last Name
 * Email address

If you would like to use Rstudio integration with this package, go to
New Package and select the directory of the new package you just created.

### Installation notes
To use you should have the following packages:

 - devtools
 - roxygen2
 - testthat

Additionally, `git` should be installed so rPackageTemplate can
auto-initialize your new package as a `git` repository.
