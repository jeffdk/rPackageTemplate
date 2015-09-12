context("Testing do_replacement* from file_operations")



test_that("do_replacement correctly does a replacement", {
    test_file <- tempfile()

    string <- "A: ${reasonable} B: ${Reasonable}\n C:${reasonable}"
    answer <- "A: dog B: ${Reasonable}\n C:dog"
    
    cat(string, file=test_file)

    do_replacement(test_file, 'reasonable', 'dog')

    output <- paste(readLines(test_file), collapse='\n')

    expect_equal(output, answer)
})


test_that("do_replacements_in_template works", {
    the_list<- list(package_name='chickenCheese', first_name='dogie')

    temp_file <- tempfile()
    
    string <- "A: ${package_name} B: ${first_name}\n C:${first_name}"
    answer <- "A: chickenCheese B: dogie\n C:dogie"

    cat(string, file=temp_file)

    do_replacements_in_file(temp_file, the_list)

    output <- paste(readLines(temp_file), collapse='\n')
    
    expect_equal(output, answer)
})
