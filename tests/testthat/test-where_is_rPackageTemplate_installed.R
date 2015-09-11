context("Testing file_operations")

test_that("where_is_rPackageTemplate_installed gives a library location containing rPackageTemplate", {
    location <- where_is_rPackageTemplate_installed()

    file_exists <- function(file)  { file.access(file, mode=0) == 0 }
    
    expect_true( file_exists(location) )
    expect_true( file_exists(paste0(location, "/rPackageTemplate")) )
    expect_true( file_exists(paste0(location, "/rPackageTemplate/R/rPackageTemplate")) )
    expect_true( file_exists(paste0(location, "/rPackageTemplate/templates")) )
})
