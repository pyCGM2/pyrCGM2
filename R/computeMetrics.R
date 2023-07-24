#' compute metrics from the Metrics package
#'
#' @param dataframeSequence  the Dataframe Sequence
#' @param modality1 modality 1 of the column Comparison Factor
#' @param modality2 modality 2 of the column Comparison Factor
#' @param comparisonLabel name of the comparison
#' @param vars variables to compare
#' @param colwise return metrics for each items of vars
#' @param metric metric name of the Metrics Package ( mae by default)
#'
#' @return
#' @export
#'
#' @examples
#'
computeMetrics <- function(dataframeSequence, modality1, modality2, comparisonLabel = NULL, vars = Frame0:Frame100, colwise = FALSE, metric = "mae") {

  if (is.null(comparisonLabel))
    comparisonLabel = "[" %+% modality1 %+% "]__VS__[" %+% modality2 %+% "]"

  if (colwise) {
    out <- dataframeSequence %>%
      select(ComparisonFactor, Id, Label, Axis, EventContext, Cycle, {{vars}}) %>%
      pivot_longer(cols = {{vars}}, values_to = "Value", names_to = "Variable") %>%
      pivot_wider(names_from = ComparisonFactor, values_from = Value) %>%
      group_by(Id, Label, Axis, EventContext, Cycle, Variable) %>%
      mutate(Metrics = do.call(get(metric), list(.data[[modality1]], .data[[modality2]])),
             Comparisonlabel = comparisonLabel) %>%
      select(Id, Label, Axis, EventContext, Cycle, Variable, Metrics, Comparisonlabel) %>%
      distinct() %>%
      mutate(MetricsType = metric)
  } else {
    out <- dataframeSequence %>%
      select(ComparisonFactor, Id, Label, Axis, EventContext, Cycle, {{vars}}) %>%
      pivot_longer(cols = {{vars}}, values_to = "Value", names_to = "Variable") %>%
      pivot_wider(names_from = ComparisonFactor, values_from = Value) %>%
      group_by(Id, Label, Axis, EventContext, Cycle) %>%
      mutate(Metrics = do.call(get(metric), list(.data[[modality1]], .data[[modality2]])),
             Comparisonlabel = comparisonLabel) %>%
      select(Id, Label, Axis, EventContext, Cycle, Metrics, Comparisonlabel) %>%
      distinct() %>%
      mutate(MetricsType = metric)
  }

  out
}
