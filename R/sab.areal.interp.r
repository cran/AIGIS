

sab.areal.interp <- function(target, recvar = 1, recvals = bgvals, appdam = FALSE, zones = cabggpc, zbbmat= cabgbbmat, zoneareas = rbgarea, twokcensus = TRUE, digits = 6, keepwts = TRUE, dr=damrats, nobounds=FALSE, trimout=TRUE){

  wts <- arealw(target, trimout = trimout, zones = zones, zbbmat = zbbmat, zoneareas = zoneareas, twokcensus = twokcensus, digits = digits)
  
  ptots <- dp.interp(wts, recvar = recvar, recvals = recvals, appdam = appdam, trimmedin = trimout, nobounds = nobounds, dr = dr)
  
  if(keepwts){ptots <- list(ptots,wts)}
  return(ptots)
    
}

      


