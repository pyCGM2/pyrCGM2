#' compute the descriptive statistics of scalar values
#'
#' @param table
#' @param dependantVariables
#' @param bySubjectFlag
#'
#' @return
#' @export
#'
#' @examples
DescritiveScalarSequence<- function(table,dependantVariables,bySubjectFlag=TRUE){


  if (bySubjectFlag) {
    group_var = c("ComparisonFactor","Id","EventContext")
  } else{
    group_var = c("ComparisonFactor","EventContext")
  }

  mean = table%>%
    group_by(across(all_of(group_var)))%>%
    select(dependantVariables)%>%
    summarise(across(dependantVariables, ~ mean(.x, na.rm = TRUE)))

  sd= table%>%
    group_by(across(all_of(group_var)))%>%
    select(dependantVariables)%>%
    summarise(across(dependantVariables, ~ sd(.x, na.rm = TRUE)))

  mean$Stats ="mean"
  sd$Stats ="std"

  out = bind_rows(mean, sd)
  if (!(bySubjectFlag)) {
    out$Id = "All"
  }

  out$Index = seq(1,nrow(out))

  return(out)
}
