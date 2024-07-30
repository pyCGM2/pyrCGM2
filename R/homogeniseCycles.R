#' @title
#' homogeniseCycles
#' @description
#' homogenise the number of cycle for a combinaison of independant variables
#'
#' @param table [dataframe] all-cycle table
#' @param groupByList [list] group-by independant variables .
#' @return update all-cycle table
#' @examples
#' homogeniseCycles(kinematicTable, c("Id","Operator","Session"))

homogeniseCycles<-function(table,groupByList){

  #addCumulatedCycleindex
  nbCycles = table%>%
    filter(EventContext =="Left")%>%
    group_by_at(vars(groupByList)) %>%
    summarise(ncycles = max(Cycle)+1)


  tmp = left_join(table,nbCycles)

  cycleCumtable = tmp %>%
    rowwise() %>%
    mutate(CycleCum  = ifelse(EventContext == "Left",Cycle,Cycle + ncycles))
  # /addCumulatedCycleindex



  tmp =  cycleCumtable %>%
    group_by_at(vars(groupByList)) %>%
    summarise(maxCycles = max(CycleCum))

  minMax = min (tmp$maxCycles)

  outTable = filter (cycleCumtable, CycleCum <= minMax)

  return (outTable)

}


