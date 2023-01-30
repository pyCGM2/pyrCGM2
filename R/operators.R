#' string concatenation operator
#'
#' @param a
#' @param b
#'
#' @return
#' @export
#'
#' @examples
`%+%` <- function(a, b){
  paste0(a, b)
}

#' negative operator
#'
#' @return
#' @export
#'
#' @examples
`%ni%` <- function(){
  Negate(`%in%`)
}
