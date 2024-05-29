#' Example of patient drugs/classes/stocks month-over-month for the Zavegepant US 2024 project
#'
#' A dataset containing drugs for migraine patients in the US month over month over the oast 5 years.
#'
#' @format A data frame with 43347 rows and 6 variables:
#' \describe{
#'   \item{patient_id}{patient ID}
#'   \item{weight}{patient projected}
#'   \item{month}{month}
#'   \item{molecule_name}{molecule the patient is on}
#'   \item{class_name}{drug class to which the molecule belongs to}
#'   \item{stock_name}{patient stock, as a function of the patient's highest molecules/classes on any given month}

#' }
#' @source {Created inhouse to be a used as an example.}
#' @examples
#' data(zavus24_stocks_table)  # Check Lazy Loading. It may only become visible once first called.
"zavus24_stocks_table"
