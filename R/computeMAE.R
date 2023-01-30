
#' compute the Mean Absolute Deviation
#'
#' @param dataframeSequence  the Dataframe Sequence
#' @param modality1 modality 1 of the column Comparison Factor
#' @param modality2 modality 2 of the column Comparison Factor
#' @param comparisonLabel name of the comparison
#' @param vars variables to compare
#' @param colwise return metrics for each items of vars
#'
#' @return
#' @export
#'
#' @examples
computeMAE <- function(dataframeSequence,modality1,modality2,comparisonLabel=NULL,vars=Frame0:Frame100,colwise =FALSE) {

  if (is.null(comparisonLabel))
    comparisonLabel = "[" %+% modality1 %+% "]__VS__[" %+% modality2 %+% "]"



  if (colwise){

    out <-dataframeSequence%>%
      select(ComparisonFactor,Id,Label,Axis,EventContext,Cycle,{{vars}})%>%
      pivot_longer(cols = {{vars}}, values_to = "Value", names_to = "Variable")%>%
      pivot_wider(names_from = ComparisonFactor,values_from = Value)%>%
      group_by(Id,Label,Axis,EventContext,Cycle,Variable)%>%
      mutate(Metrics = Metrics::mae(.data[[modality1]],.data[[modality2]]),
             Comparisonlabel=comparisonLabel)%>%
      select(Id,Label,Axis,EventContext,Cycle,Variable,Metrics,Comparisonlabel)%>%
      distinct()%>%
      mutate(MetricsType = "MAE")
  } else {
    out <-dataframeSequence%>%
      select(ComparisonFactor,Id,Label,Axis,EventContext,Cycle,{{vars}})%>%
      pivot_longer(cols = {{vars}}, values_to = "Value", names_to = "Variable")%>%
      pivot_wider(names_from = ComparisonFactor,values_from = Value)%>%
      group_by(Id,Label,Axis,EventContext,Cycle)%>%
      mutate(Metrics = Metrics::mae(.data[[modality1]],.data[[modality2]]),
             Comparisonlabel=comparisonLabel)%>%
      select(Id,Label,Axis,EventContext,Cycle,Metrics,Comparisonlabel)%>%
      distinct()%>%
      mutate(MetricsType = "MAE")
  }

  out


}
