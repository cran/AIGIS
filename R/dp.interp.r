
#takes matrix of overlap weights and multiplies by record values to get interpolated values.
#gets lower and upper bounds by considering only polygons completely enclosed, or any touched, respectively.

dp.interp <- function(wtmat, recvar = 1, recvals = bgvals, appdam=FALSE, trimmedin=FALSE, nobounds=FALSE,dr=damrats){
    
    if(trimmedin){      
      newwtmat <- rep(0,nrow(recvals))
      newwtmat[wtmat[,1]] <- wtmat[,2] 
      wtmat <- newwtmat
    }
    if(!is.vector(wtmat)){
      if(nrow(recvals)!=nrow(wtmat)){
        stop("dimension mismatch - are wtmat and recvals for same set of polys?")
      }    
    } else { 
      if(length(wtmat)!=nrow(recvals)){
        stop("wtmat given vector, but number of weights supplied (wtmat) does not equal number of records.")
      } else{
        wtmat <- matrix(wtmat,ncol=1)
      }   
    }
        
    if(appdam){recvals[,recvar] <- recvals[,recvar]*dr}
    
    ev <- apply(wtmat*recvals[,recvar],2,sum)  #expected value (assuming uniform spatial dist)
    lb <- apply(floor(wtmat)*recvals[,recvar],2,sum)  #lower bound (only those p's completely enclosed
    ub <- apply(ceiling(wtmat)*recvals[,recvar],2,sum) #upper bound (any with any zonzero overlap)
    
    if(nobounds){
      return(ev)
    } else {
      ptots<- t(rbind(ev,lb,ub))   #expval, lower and upper bounds for all target polygons passed       
      return(ptots)
    }
}

      


