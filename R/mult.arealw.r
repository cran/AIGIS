

#mult.arealw: A wrapper for arealw, to get overlap weights for multiple polygons,
#whose indices are specified by the vector target.ind

mult.arealw <- function(target.ind="all", targetlist=firepgpc, trimout=TRUE, zones = cabggpc, zbbmat=cabgbbmat, zoneareas=rbgarea, twokcensus=TRUE, digits=6, verbose=2){

  lecall <- match.call()

  if(target.ind[1]=="all"){
    target.ind <- c(1:length(targetlist))
  }
  
  
    lt <- length(target.ind)
    
    if(zbbmat[1]=="none"){
    
      zbbmat <- bbox.mat(zones)
      
    }  
    

    #if no zone areas vector is given, calculate one - requires 1-1 record/polygon matching to work.
    
    if (zoneareas[1]==FALSE){
  
      zoneareas <- sapply(zones,area.poly)
      
    } 
                                                                    
    if(trimout){
    
      wtobj <- list()
        
      for (i in 1:lt){

        if (verbose>=0){
          if((i%%(10^verbose))==0){
            cat("on target polygon ",i," of ", lt,"\n")
          } 
        }
        wtobj[[i]] <- arealw(targetlist[[target.ind[i]]], trimout=trimout,zones = zones, zbbmat = zbbmat, zoneareas = zoneareas, twokcensus=twokcensus,digits=digits)
      
      }
    

    } else {

      wtobj <- matrix(ncol = length(zoneareas), nrow=lt)
            
      for (i in 1:lt){

        if (verbose>=0){
          if((i%%(10^verbose))==0){
            cat("on target polygon ",i," of ", lt,"\n")
          }
        }
        
        wtobj[i,] <- arealw(targetlist[[target.ind[i]]], trimout=trimout, zones = zones, zbbmat = zbbmat, zoneareas = zoneareas, twokcensus=twokcensus,digits=digits)
      
      }
    
    rownames(wtobj) <- target.ind
    
    wtobj <- t(wtobj)
    
  }
 
  attr(wtobj, "call") <- lecall
  
  return(wtobj)
    
}

      


