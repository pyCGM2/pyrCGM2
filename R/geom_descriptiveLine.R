#' Title
#'
#' @param descrFrames a descriptive dataFrameSequence
#' @param color
#' @param linetype
#' @param lineWidth
#'
#' @return
#' @export
#'
#' @examples
geom_descriptiveLine<-function(descrFrames,
                               color="ComparisonFactor", linetype=NULL,
                               lineWidth=0.5){

  filtData = descrFrames%>%
    pivotLongerDescriptiveFrameSequence()%>%
    filter(Stats == "mean")
  filtData$inter <- interaction(filtData$Index)

  mapping <- aes(x=Frame, y=Value, color=.data[[color]],
                 linetype= .data[[linetype]],
                 group = .data[["inter"]])

  if (is.null(linetype))
    mapping$linetype <-NULL

  list(
    geom_line(data=filtData,
              mapping, size=lineWidth)
  )


}

