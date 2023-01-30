
#' return descriptive stats
#'
#' @param table
#' @param bySubjectFlag
#'
#' @return
#' @export
#'
#' @examples
DescritiveFrameSequence<- function(table,bySubjectFlag=TRUE){


  if (bySubjectFlag) {
    group_var = c("ComparisonFactor","Id","EventContext","Label","Axis")
  } else{
    group_var = c("ComparisonFactor","EventContext","Label","Axis")
  }


  meanTrace=
    meanT = table%>%
    group_by(across(all_of(group_var)))%>%
    summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))

  sdTrace = table%>%
    group_by(across(all_of(group_var)))%>%
    summarise(across(where(is.numeric), ~ sd(.x, na.rm = TRUE)))


  meanTrace$Stats ="mean"
  sdTrace$Stats ="std"

  out = bind_rows(meanTrace, sdTrace)
  if (!(bySubjectFlag)) {
    out$Id = "All"
  }

  out$Cycle = 1
  out$Index = seq(1,nrow(out))

  return(out)

}


pivotLongerDescriptiveFrameSequence<- function(descFrames, option = "longer"){

    meanTraceGather = descFrames  %>%
      filter(Stats == "mean")%>%
      pivot_longer(cols = Frame0:Frame100, names_to = "Frame", values_to = "Value")


    sdTraceGather = descFrames  %>%
      filter(Stats == "std")%>%
      pivot_longer(cols = Frame0:Frame100, names_to = "Frame", values_to = "Value")

    final = bind_rows(meanTraceGather,sdTraceGather)

  return(final)
}
