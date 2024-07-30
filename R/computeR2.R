
#' compute of  the R-squared
#'
#' @param dataframeSequence  the Dataframe Sequence
#' @param modality1 modality 1 of the column Comparison Factor
#' @param modality2 modality 2 of the column Comparison Factor
#' @param comparisonLabel name of the comparison
#' @param vars variables to compare
#'
#' @return
#' @export
#'
#' @examples
computeR2 <- function(dataframeSequence,modality1,modality2,comparisonLabel=NULL,vars=Frame0:Frame100) {

  if (is.null(comparisonLabel))
    comparisonLabel = "[" %+% modality1 %+% "]__VS__[" %+% modality2 %+% "]"




  out <-dataframeSequence%>%
    select(ComparisonFactor,Id,Label,Axis,EventContext,Cycle,{{vars}})%>%
    pivot_longer(cols = {{vars}}, values_to = "Value", names_to = "Variable")%>%
    pivot_wider(names_from = ComparisonFactor,values_from = Value)%>%
    group_by(Id,Label,Axis,EventContext,Cycle)%>%
    mutate(Metrics = summary(lm(.data[[modality1]] ~ .data[[modality2]]))$adj.r.squared,
           Comparisonlabel=comparisonLabel)%>%
    select(Id,Label,Axis,EventContext,Cycle,Metrics,Comparisonlabel)%>%
    distinct()%>%
    mutate(MetricsType = "R2")


  out


}
#out = list(a0 = model$coefficients[1], a1 = model$coefficients[2], R2 = model_sum$adj.r.squared )
