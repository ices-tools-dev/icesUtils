#' Generate a list of dataframes containing text content, from excel
#'
#' Converts an excel file into a list of dataframes. Works with \code{usethis::use_data} and
#'  \code{select_text} to provide a simple means of incorporating text in shiny applications.
#' To work with \code{usethis::use_data} the excel file should have named tabs, 
#' each tab having 2 columns, \strong{section} and \strong{text}. \emph{text} is the content,
#' \emph{section} is used by \code{select_text} to extract the relevant section.
#' Texts provided in \emph{text} are wrapped in the HTML paragraph tag <p>.
#' 
#' @param path_to_file path to the file containing text content
#'
#' @returns a list of dataframes
#' @export
#'
#' @importFrom readxl read_xlsx
#' @seealso 
#'  \code{\link[icesUtils]{prepare_nested_text_lists_from_excel}} converts texts
#'   in multiple files into a hierarchical structure that \code{select_text} can work with.
#'   
#'  \code{\link[icesUtils]{select_text}} extracts individual texts by tab,
#'  section and, optionally, top-level names.
#' @examples
#' example_path <- system.file("extdata", "text_function_example.xlsx", package = "icesUtils")
#' prepare_text_from_excel(path_to_file = example_path)

prepare_text_from_excel <- function(path_to_file){
  stopifnot(file.exists(path_to_file))
  
  sheets <- excel_sheets(path_to_file)
  texts <- lapply(sheets, read_excel, path = path_to_file) 
  names(texts) <- sheets
  texts <- lapply(texts, function(x) {
      x$text <- paste0("<p>", x$text, "</p>")
      x
    })
  texts
}


#' Create a named nested list of dataframes containing text content, from excel files and a vector of names.
#'
#' Uses \code{prepare_text_from_excel} to make a nested list containing text 
#' content extractable by \emph{section}. Requires that \emph{paths} and 
#' \emph{names} are vectors of equal length. 
#' Output works with \code{select_text} where \emph{names} gives the 
#' \emph{top_level} parameter to \code{select_text}.  vector of names an excel file into a list of dataframes. Works with \code{usethis::use_data} and
#'  \code{select_text} to provide a simple means of incorporating text in shiny applications.
#' To work with \code{usethis::use_data} the excel file should have named tabs, 
#' @param paths valid paths provided either as vector or list
#'
#' @param names list or vector of characters
#'
#' @export
#' @seealso 
#' 
#'  \code{\link{prepare_text_from_excel}} converts texts provided via
#'   a single excel file into a structure that \code{select_text} can work with. Used by this function on each file provided.
#'   
#'  \code{\link{select_text}} extracts individual texts by tab,
#'  section and, optionally, top-level names.
#'
prepare_nested_text_lists_from_excel <- function(paths, names){
  
  stopifnot(is.list(paths) | is.vector(paths, mode = "character"))
  stopifnot(is.list(names) | is.vector(names, mode = "character"))
  stopifnot(length(paths) == length(names))
  list_of_texts <- lapply(paths,prepare_text_from_excel)
  names(list_of_texts) <- names
  list_of_texts
}
  
