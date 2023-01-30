#' Construct a dataframe from a list of xls files
#'
#' @param fullXlsFiles a list of xls files
#' @param sheet sheetname to extract from the xls files
#'
#' @return
#' @export
#'
#' @examples
constructTableFromXls <- function(fullXlsFiles, sheet){

  table = data.frame()
  for (xlsfile in fullXlsFiles){

    out <- tryCatch(
      {
        data = read_excel(xlsfile, sheet = sheet ,col_names = TRUE,.name_repair = "minimal")
        table = bind_rows(table,data)
      },
      error=function(cond) {
        message(paste("ERROR", xlsfile,"not loaded"))
        message(cond)
      }
    )

  }

  table$Index = seq(1,nrow(table))


    return (  table )
}
