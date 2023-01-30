#' draw gait phase as vertical lines
#'
#' @param descrDataFrame a descriptive dataFrame Sequence
#' @param color
#'
#' @return
#' @export
#'
#' @examples
geom_gaitPhaseLines<- function(descrDataFrame,color=NULL) {

  gaitPhases <-descrDataFrame%>%
    ungroup()%>%
    filter(Stats=="mean")%>%
    select(Id,ComparisonFactor,EventContext,stancePhase, doubleStance1, doubleStance2)%>%
    distinct()%>%
    mutate(doubleStance2 = stancePhase - doubleStance2)%>%
    pivot_longer(cols = c(stancePhase, doubleStance1, doubleStance2),
                 names_to = "Variable", values_to = "Value")


  if (is.null(color)){
    color="black"

    list(
      geom_vline( data = filter(gaitPhases,Variable  == "stancePhase"),
                  aes(xintercept=Value),color=color,
                  show.legend = FALSE),
      geom_vline( data = filter(gaitPhases,Variable  == "doubleStance1"),
                  aes(xintercept=Value),color=color,linetype ="dotted",
                  show.legend = FALSE),

      geom_vline( data = filter(gaitPhases,Variable  == "doubleStance2"),
                  aes(xintercept=Value),color=color,linetype ="dotted",
                  show.legend = FALSE)
    )


  } else {
    list(
      geom_vline( data = filter(gaitPhases,Variable  == "stancePhase"),
                  aes(xintercept=Value,
                      color=ComparisonFactor),
                  show.legend = FALSE),
      geom_vline( data = filter(gaitPhases,Variable  == "doubleStance1"),
                  aes(xintercept=Value,
                      color=ComparisonFactor),linetype ="dotted",
                  show.legend = FALSE),

      geom_vline( data = filter(gaitPhases,Variable  == "doubleStance2"),
                  aes(xintercept=Value,
                      color=ComparisonFactor),linetype ="dotted",
                  show.legend = FALSE)
    )
  }

}
