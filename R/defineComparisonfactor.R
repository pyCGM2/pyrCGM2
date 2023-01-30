#' define the comparison factor
#'
#' @param table
#' @param groupBy
#'
#' @return
#' @export
#'
#' @examples
defineComparisonfactor<- function(table,groupBy){

  table = table %>%
    unite(ComparisonFactor, groupBy,remove = FALSE)

  table$ComparisonFactor = as.factor(table$ComparisonFactor)



  return (table)

}
