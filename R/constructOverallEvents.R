#' merge the left and right eventCOntext
#'
#' @param df
#' @param groupBy
#' @param removeFirstCharacter
#'
#' @return
#' @export
#'
#' @examples
constructOverallEvents <- function(df,groupBy,removeFirstCharacter=TRUE) {
  if (removeFirstCharacter)
    df$Label = substring(df$Label,2,  nchar(df$Label))

  df$EventContext0 = df$EventContext
  df$Cycle0 = df$Cycle
  df$EventContext = "Overall"

  groupBy = append(groupBy,c("Label","Axis"))

  df %>%
    group_by_at(groupBy)%>%
    mutate(Cycle = 1:n())
}

