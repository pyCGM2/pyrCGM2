#' pyrCGM2 ggplot layer
#'
#' @param iTitle
#' @param xLabel
#' @param yLabel
#' @param legendPosition
#'
#' @return
#' @export
#'
#' @examples
ggplotLayer<-function(iTitle="",xLabel="Time Normalized", yLabel="Deg", legendPosition = "top"){

    ggplot()+
    ggtitle(iTitle)+
    scale_x_discrete(name=xLabel)+
    ylab(yLabel)+scale_y_continuous(name=yLabel)+
    theme_bw()+
    geom_hline(yintercept = 0)+
    theme(panel.grid.minor = element_blank(),
          axis.title.x =      element_text(size = 10),
          axis.text.x  = element_blank(),
          axis.ticks.x = element_blank(),
          axis.title.y =  element_text(size = 10),
          axis.text.y  = element_text(size=8),
          legend.text = element_text(size = 8),
          legend.title = element_text(size = 10,face="plain"),
          plot.title = element_text(family="Times", face="plain", size=10),
          legend.position=legendPosition,
          panel.grid.major = element_blank())
}

