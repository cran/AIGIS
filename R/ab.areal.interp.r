

#ab.areal.interp: A wrapper for mult.arealw and dp.interp - lets one
#go from targets and zones to interpolated values in one function.  

ab.areal.interp <- function(target.ind="all", targetlist,#=firepgpc, 
	trim=TRUE, 
	recvar = 1, recvals = bgvals, zones = cabggpc, zbbmat = cabgbbmat, 
	zoneareas=rbgarea, appdam=TRUE, dr=damrats, twokcensus=TRUE, digits=6, 
	nobounds=FALSE, keepwts=TRUE,verbose=2){

#find weights:

#this section appropriately handles a variety of inputs.   

if(trim){

  wlist <- mult.arealw(target.ind=target.ind, targetlist=targetlist, trimout=TRUE, zones = zones, zbbmat=zbbmat, zoneareas=zoneareas, digits=digits,twokcensus=twokcensus, verbose=verbose)

  ptots <- lapply(wlist,dp.interp, recvar = recvar, recvals = recvals, appdam=appdam, trimmedin=trim, nobounds=nobounds,dr=dr) 

  lpt <- length(ptots)
  
  if(nobounds){  #don't return bounds, only return one value for each target
  
    ptotsmat <- matrix(nrow=lpt,ncol=1)
    for (i in 1:lpt){
      ptotsmat[i,] <- ptots[[i]]
    }
    
  
  } else {
    
    ptotsmat <- matrix(nrow=lpt,ncol=3)
    for (i in 1:lpt){
      ptotsmat[i,] <- ptots[[i]]
    }
    colnames(ptotsmat) <- c("ev","lb","ub")
    rownames(ptotsmat) <- target.ind
  
  }
  
  if(keepwts){
    return(list(ptotsmat,wlist))
  } else{
    return(ptotsmat)
  }
  
} else {

  wtmat <- mult.arealw(target.ind=target.ind, trimout=FALSE,targetlist=targetlist, zones = zones, zbbmat=zbbmat, zoneareas= zoneareas, digits=digits,twokcensus=twokcensus, verbose=verbose)

#find total:  

  ptots <- dp.interp(wtmat, recvar = recvar, recvals = recvals, appdam=appdam, dr=dr)
  
  if (keepwts) {return(list(ptots,wtmat))}
  else {return(ptots)}

}    
}

# Test values that you should get when running on firepgpc's 1 and 14316 
#
#              ev       lb         ub
#1       1.284104  0.00000   38.13907
#14316 765.707274 55.00473 1400.34600
#> sourcer()
#> marg <- ab.areal.interp(target.ind=c(1,14316),appdam=F)
#> marg[[1]]
#               ev       lb       ub
#1        20.30241    0.000   603.00
#14316 18443.74046 1269.286 40763.51

      


