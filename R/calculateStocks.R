#' Calculate total stock size for a set of user-specified months, molecules, classes and patient stocks
#' @param data   Dataframe to use containing patient_id, weight, month, molecule_name, class_name, and stock_name colunms
#' @param months   Month to filter on, either exact match [i.e., 60] or bounded list [i.e., (24, 36) ]
#' @param molecules   Set of molecules names to filter on
#' @param classes   Set of drug classes names to filter on
#' @param stocks   Set of patient stocks names to filter on
#' @param ever_tried   Whether to count each patient once ("ever tried") or multiple times ("patient-months")
#' @return   Total sum of weights for the use-specified months, drugs, classes and/or stocks
#' @export
#'
#' @examples  calculateStocks(zavus24_stocks_table, months=c(1,60), classes = c("CGRP Oral", "CGRP Injectable") )


calculateStocks <- function(data, months = NULL, molecules = NULL, classes = NULL, stocks = NULL, ever_tried = TRUE) {

  # Filter based on time range if specified
  if (!is.null(months)) {
    if (length(months) == 1) {
      data <- dplyr::filter(data, month == months)
    } else if (length(months) == 2) {
      data <- dplyr::filter(data, month >= months[1] & month <= months[2])
    }
  }

  # Filter based on stock_name if specified
  if (!is.null(molecules)) {
    data <- dplyr::filter(data, molecule_name %in% molecules)
  }

  # Filter based on class_name if specified
  if (!is.null(classes)) {
    data <- dplyr::filter(data, class_name %in% classes)
  }

  # Filter based on stock_name if specified
  if (!is.null(stocks)) {
    data <- dplyr::filter(data, stock_name %in% stocks)
  }

  # Filter for unique patient IDs and their corresponding weights based on 'ever_tried'
  if (ever_tried) {
    unique_data <- dplyr::distinct(dplyr::select(data, patient_id, weight))
  } else {
    unique_data <- dplyr::select(data, patient_id, weight)
  }

  # Sum of weights
  total_weight <- sum(unique_data$weight, na.rm = TRUE)

  return(total_weight)
}



