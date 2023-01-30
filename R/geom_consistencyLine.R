#' Title
#'
#' @param table a dataframeSequences  with all cycles frame sequence
#' @param color
#' @param linetype
#' @param lineWidth
#'
#' @return
#' @export
#'
#' @examples
geom_consistencyLine<-function(table,color="ComparisonFactor", linetype=NULL,
                               lineWidth=0.5){


  data = table %>%
    pivot_longer(cols = Frame0:Frame100, names_to = "Frame", values_to = "Value")



  mapping <- aes(x=Frame, y=Value, color=.data[[color]],
                   linetype= .data[[linetype]],
                   group = interaction(.data[["Index"]],.data[["ComparisonFactor"]]))

  if (is.null(linetype))
    mapping$linetype <-NULL

  list(
    geom_line(data=data,
              mapping, size=lineWidth)
  )


}



