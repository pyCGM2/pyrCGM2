#' load a normative dataset
#'
#' @param fullXlsFile
#' @param sheet
#'
#' @return
#' @export
#'
#' @examples
loadNormativeDataSet <- function(fullXlsFile, sheet){

  normativeTable = read_excel(fullXlsFile, sheet = sheet ,col_names = TRUE)


  table_transform = normativeTable  %>%
      gather(Frame, Values,  Frame0:Frame100)%>%
      unite(temp, StatType) %>%
      spread(temp, Values)%>%
      mutate(Max= mean+sd, Min = mean-sd )


  }
