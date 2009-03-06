
ab.gbounds <- function(gridgpcobj=gridgpc,gws=gridinws, area=200, units="ha", recvar=1, recvals=bgvals, recarea=rbgarea, appdam=TRUE, dr=damrats, cap=TRUE, maskobj=MASK){

   gstats <- array(0,dim=c(nrow(maskobj),ncol(maskobj),2))
   
#   gdams <- lapply(gws, ab.gcbounds,area = .125^2, recvar = 1, recvals = bgvals, appdam=F,dr=damrats)
   
   for(i in 1:length(gridgpcobj[[3]])){      
      
      gri <- gridgpcobj[[3]][i]
      ki <-  gridgpcobj[[2]][gri]
      
      carea <- area.poly(gridgpcobj[[1]][[gri]])*area2frac(gridgpcobj[[1]][[gri]],area=area, units=units, cap=cap, naive=TRUE)
      
      gridi <- ki%/%79 + 4
      gridj <- ki%%79 + 59
      
      gridi <- gridi - 3
      gridj <- gridj - 55
   
      gstats[gridi,gridj,] <-  ab.gcbounds(gws[[gridgpcobj[[3]][i]]], area = carea, recarea=recarea, recvar = recvar, recvals = recvals, appdam=TRUE, dr=dr)      
   }

  return(gstats)
   
}   
