
#' Is all clear to write new template
#'
#' Checks filesystem to ensure we are not overwriting an existing directory
#' and checks that we can read and write in the current directory
#'
#' @param package_name char, new package directory name to create
#' @return logical can we write a new template
is_all_clear_to_write_new_template <- function(package_name) {

    exists <- file.access(package_name, mode = 0) == 0
    cannot_read <- file.access('.', mode = 4) ==  -1
    cannot_write <- file.access('.', mode = 2) == -1
    
    if (exists) {
        warning(paste(package_name, "already exists in this directory!"))
    }
    if (cannot_read) {
        warning("Cannot read in current directory!")
    }
    if (cannot_write) {
        warning("Cannot write to current directory!")
    }
   
    return( !any(exists, cannot_read, cannot_write))
}


#' Where is rPackageTemplate installed
#'
#' Returns a string which is the location where rPackageTemplate is installed
#' we need this to know where the templates are!
#' 
#' @return string install directory for rPackageTemplate
where_is_rPackageTemplate_installed <- function() {
    packages <- as.data.frame(installed.packages())
    location_of_rPackageTemplate <- packages$LibPath['rPackageTemplate']
    as.character(location_of_rPackageTemplate)
}

#' Copy template to directory
#'
#' Creates dir in current directory and copies templates to there
#'
#' @param dir
copy_template_to_dir <- function(dir) {

    from_location <- paste0(where_is_rPackageTemplate_installed(),
                            "/rPackageTemplate/templates/")
    to_location <- paste0(dir, "/")

    stopifnot(is_all_clear_to_write_new_template(dir))
    stopifnot(is_all_clear_to_write_new_template(to_location))
    
    system(paste("cp -R",
                 from_location,
                 to_location)
           )
}

#' Do replacements in template
#'
#' Given the directory of a freshly copied template, do all of the specified
#' replacements
#'
#' @param template_dir string, directory of the fresh template
#' @param list_of_replacements list in replacement key='value' format
do_replacements_in_template <- function(template_dir, list_of_replacements){
    files <- list.files(template_dir, recursive=TRUE, all.files=TRUE)
    
    for(file in files) {
        do_replacements_in_file(paste0(template_dir, "/", file),
                                list_of_replacements)
    }
}

#' Do list_of_replacements in a single file, file
do_replacements_in_file <- function(file, list_of_replacements) {
    
    for(repl_key in names(list_of_replacements)) {
        repl_value <- list_of_replacements[[repl_key]]
        do_replacement(file, repl_key, repl_value)
    }
}

#' Do replacement
#'
#' Replace keys in file with value.  Keys must be indentified in the file
#' with bash like syntax; i.e. ${key}
#'
#' @param file string, filename to do replacement in
#' @param key string, replace this key (identified by ${key}) in the file
#' @param value string, replace given key with this value
do_replacement <- function(file, key, value) {

    formatted_key <- paste0( "${", key, "}")
    
    input <- readLines(file)
    output <- gsub(formatted_key, value, input, fixed=TRUE)
    cat(output, file=file, sep='\n')
}

#' Rename the package_name.R file appropriately
rename_package_file <- function(package_name) {
    file.rename(paste0(package_name, "/R/package_name.R"),
                paste0(package_name, "/R/", package_name, ".R"))
}
