isColExist <- function(table, colname)
  if (colname %in% names(table)) {return(TRUE)}  else {return(FALSE)}


viewTable <- function(table) utils::View(table)


getColumIndex <- function(table, colname){
  index <- which( colnames(table)==colname)
  return(index)
}
