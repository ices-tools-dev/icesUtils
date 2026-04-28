#' Retrieve bycatch advice results for a given ecoregion
#'
#' Queries the ICES bycatch API and returns the bycatch advice results for a
#' specified ecoregion.
#'
#' @param Ecoregion A character string giving the ecoregion name to be passed to
#'   the ICES bycatch API.
#'
#' @return A data frame or list, depending on the API response structure,
#'   containing bycatch advice results for the requested ecoregion.
#'
#' @details
#' This function builds the API request URL using the supplied ecoregion name,
#' URL-encodes it, and parses the JSON response with `jsonlite::fromJSON()`.
#'
#' It does not perform validation of the API response, so downstream cleaning is
#' usually needed before plotting or analysis.
#'
#' @examples
#' \dontrun{
#' bycatch_raw <- get_bycatch_ecoregion("Greater North Sea")
#' }
#'
#' @export
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
get_bycatch_ecoregion <- function(Ecoregion) {

        bycatch <- fromJSON(
                URLencode(
                        sprintf("https://bycatch.ices.dk/API/GetAdviceResults?ecoregion=%s", Ecoregion)
                )
        )
        return(bycatch)
}