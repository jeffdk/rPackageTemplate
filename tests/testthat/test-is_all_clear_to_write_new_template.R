context("Testing file_operations")


## This test is risky, and will fail if you cannot read/write from directory
## in which the test is run
test_that("is_all_clear_to_write_new_template yields TRUE for 
           a filename which does not already exist", {
    ## From a UUID generator, so user should never have a file with this name
    arbitrary_string <- "021457fb-f240-4d77-bdab-8dd63b62428e"

    expect_true( is_all_clear_to_write_new_template( arbitrary_string) )  
})

test_that("is_all_clear_to_write_new_template yields FALSE on the current directory", {
    expect_false( is_all_clear_to_write_new_template('.'))
})
