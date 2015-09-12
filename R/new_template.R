#' New template
#'
#' Prompts user to enter keys for new template
#'
#' @export
new_template <- function() {
    replacements <- list()
    print("Please provide the following information for your new package (no spaces, please): ")
    
    for(key in replacementKeys) {
        replacements[[key]] <- readline(paste0(key, ": \n"))
    }

    if( grepl("[[:space:]]", replacements$package_name) ) {
        stop("Package name cannot have spaces")
    }      
    
    message("Thank you, initializing new package in: ", replacements$package_name)
    is_all_clear_to_write_new_template(replacements$package_name)
    copy_template_to_dir(replacements$package_name)
    
    message("Template initialized, doing replacements.")
    do_replacements_in_template(replacements$package_name, replacements)
    rename_package_file(replacements$package_name)

    message("Done.  Your new package is ready!")
}

git_init <- function(dir_name) {
}
