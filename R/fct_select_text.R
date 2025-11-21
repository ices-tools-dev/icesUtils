#'´Get text to display from list of dfs.
#'
#' display_text´ subsets a list of dataframes and extracts the relevant section of text for tab and section
#' If ecoregion is supplied, accepts a named list of lists, and filters the top level list by ecoregion name.
#'
#' @param list_of_texts a list of dataframes each containing 'section' and 'text' columns
#' @param tab a character vector - the name of a list entry
#' @param section a character vector indicating which row to extract
#' @param ecoregion optional argument for top level sorting
#'
#' @author Neil Maginnis
#' @return A character string
#' @importFrom dplyr filter pull
#' @export
#' @examples
#' greetings <- data.frame(section = c("welcome", "goodbye"), 
#' text = c("Hello world", "Thanks for stopping by"))
#' content <- data.frame(section = "help", text = "Use the function as shown here")
#' texts <- list(greetings=greetings, content = content)
#' select_text(list_of_texts = texts, "greetings", "welcome")
#' select_text(list_of_texts = texts, "content", "help")
#' select_text(list_of_texts = texts, "greetings", "goodbye")
#' 
select_text <- function(list_of_texts, tab, section, ecoregion = NULL) {
  
  # Subset by ecoregion if provided
  if (!is.null(ecoregion)) {
    if (!ecoregion %in% names(list_of_texts)) {
      stop("Ecoregion ", ecoregion, " not found in list_of_texts.")
    }
    list_of_texts <- list_of_texts[[ecoregion]]
  }
  
  # Check that the tab exists
  if (!tab %in% names(list_of_texts)) {
    stop("Tab '", tab, "' not found in list_of_texts.")
  }
  
  df <- list_of_texts[[tab]]
  
  # Validate structure
  if (!all(c("section", "text") %in% names(df))) {
    stop("Data frame in tab '", tab, "' must contain 'section' and 'text' columns.")
  }
  
  # Filter and return text
  filtered_df <- filter(df, .data$section == .env$section) 
  out <- pull(filtered_df, .data$text)
  
  if (length(out) == 0) {
    warning("No text found for section '", section, "'. Returning NULL.")
    return(NULL)
  }
  
  out
}
