#' Get summary data for a stock
#'
#' Find the summary data for a specific stock in a given assessment year.
#'
#' @param stock a stock name, e.g. cod-347d, or cod to find all cod stocks, or NULL (default)
#'              to process all stocks.
#' @param year the assessment year, e.g. 2015, or 0 to process all years.
#'
#' @return A dataframe.
#'
#' @details
#'
#' This function retrieves summary data for a specified stock and year from the
#' SAG and SD Databases. It first validates the stock code against the ICES vocabulary
#' database, then fetches stock information from the Stock Data (SD) database,
#' and the summary table data from the Stock Assessment Graphs (SAG) database.
#'
#' The results from both sources are combined into a single dataframe which is returned
#' to the user.
#'
#' @seealso
#'
#' \code{\link[icesSAG]{getSAG}} gets summary table from SAG DB.
#' \code{\link[icesSAG]{icesSAG-package}} gives an overview of the icesSAG package.
#'
#' \code{\link{icesUtils-package}} gives an overview of the icesUtils package.
#'
#' @author Colin Millar.
#'
#' @examples
#'
#' assessment_summary <- first_function("had.27.46a20", 2023)
#' head(assessment_summary)
#'
#' @importFrom icesSAG getSAG
#' @importFrom icesVocab getCodeDetail
#' @importFrom icesSD getSD
#' @export
first_function <- function(stock, year) {

  # check arg lengths
  if (length(stock) > 1) {
    warning("Argument 'stock' must be of length 1, using first element only.")
    stock <- stock[1]
  }

  if (length(year) > 1) {
    warning("Argument 'year' must be of length 1, using first element only.")
    year <- year[1]
  }

  # check stock:
  detail <- getCodeDetail(code = stock, code_type = "ICES_StockCode")
  if (is.null(detail)) {
    stop("Stock code not found: ", stock)
  }

  # get stock info from SID
  sid <- getSD(stock = stock, year = year)

  # call icesSAG to get summary table data
  sag <- getSAG(stock = stock, year = year)

  # join and return
  out <- cbind(sag, sid[rep(1, nrow(sag)), ])
  out
}
