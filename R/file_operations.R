
#' Is all clear to write new template
#'
#' Checks filesystem to ensure we are not overwriting an existing directory
#' and checks that we can read and write in the current directory
#'
#' @param package_name char, new package directory name to create
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
