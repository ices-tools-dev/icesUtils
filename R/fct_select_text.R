#' Get text to display from list of dfs.
#'
#' display_text´ subsets a list of dataframes and extracts the relevant section of text for tab and section
#' If top_level is supplied, accepts a named list of lists, and filters the top level list by top_level name.
#'
#' @param list_of_texts a list of dataframes each containing 'section' and 'text' columns
#' @param tab a character vector - the name of a list entry
#' @param section a character vector indicating which row to extract
#'
#' @author Neil Maginnis
#' @return A character string
#' @export
#' @seealso 
#' 
#'  \code{\link[icesUtils]{prepare_text_from_excel}} is a function that converts texts provided via an excel file into a structure that \code{select_text} can work with.
#'  
#'  \code{\link[icesUtils]{prepare_nested_text_lists_from_excel}} converts texts in multiple files into a hierarchical structure that \code{select_text} can work with.
#' @examples
#' greetings <- data.frame(section = c("welcome", "goodbye"), 
#' text = c("Hello world", "Thanks for stopping by"))
#' content <- data.frame(section = "help", text = "Use the function as shown here")
#' texts <- list(greetings=greetings, content = content)
#' select_text(list_of_texts = texts, "greetings", "welcome")
#' select_text(list_of_texts = texts, "content", "help")
#' select_text(list_of_texts = texts, "greetings", "goodbye")
#' 
select_text <- function(list_of_texts, tab, section = NULL) {

  if (is.null(list_of_texts[[tab]])) {
    stop("Tab '", tab, "' not found.")
  }

  df <- list_of_texts[[tab]]

  # Case 1: structured text table
  if ("section" %in% names(df) && "text" %in% names(df)) {

    if (is.null(section)) {
      stop("Section must be provided for tab '", tab, "'.")
    }

    out <- df[df$section == section, "text", drop = TRUE]

    if (length(out) == 0) return("")
    return(as.character(out))
  }

  # Case 2: non-text table (e.g. glossary)
  return(df)
}
