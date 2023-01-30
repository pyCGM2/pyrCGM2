#' construction of the  standard deviation ribbon
#'
#' @param descrFrames a descriptive dataFrame Sequence
#'
#' @return
#' @export
#'
#' @examples
geom_corridor_ribbon <- function(descrFrames) {

  data = descrFrames  %>%
      select(c(Id,Index,Stats,Axis,Frame0:Frame100))%>%
      pivot_longer(cols = Frame0:Frame100, names_to = "Frame", values_to = "Value")%>%
      pivot_wider(-Index,names_from = Stats, values_from = Value)%>%
      mutate(Max= mean+std, Min = mean-std )

  list(
    geom_ribbon(data = data,
                aes(ymin = Min, ymax = Max,
                    fill = ComparisonFactor,
                    x= Frame,
                    group=interaction(Id,ComparisonFactor,Label,Axis)),
                alpha = 0.4)
  )
}
