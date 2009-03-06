
ab.gmu <- function(gridgpcobj=gridgpc,gws=gridinws,afracs=gfracs, recvar = 1, recvals = bgvals, appdam=FALSE, trimmedin=TRUE, dr=damrats, maskobj=MASK){ 
   
   gtots <- sapply(gws, dp.interp, recvar = recvar, recvals = recvals, appdam=appdam, trimmedin=trimmedin, nobounds=TRUE, dr=dr)
   
   gdams <- afracs*gtots
   
   gstats <- matrix(NA,nrow=nrow(maskobj),ncol=ncol(maskobj))
   
   for(i in 1:length(gridgpcobj[[3]])){
      ki = gridgpcobj[[2]][gridgpcobj[[3]][i]]
   
      gridi = ki%/%79 + 4
      gridj = ki%%79 + 59
      
      gridi <- gridi - 3
      gridj <- gridj - 55
   
      gstats[gridi,gridj] <-  gdams[gridgpcobj[[3]][i]]      
   }
   
   return(gstats)   
}
   
   