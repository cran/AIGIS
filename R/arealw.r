"arealw" <-
function(target, trimout=TRUE,zones = cabggpc, zbbmat = cabgbbmat, zoneareas=rbgarea, twokcensus=TRUE, digits=6, polytobgobj=polytobg){
  
  # a supporting function so that lapply can be used.

  rati <- function(gpc1,target){
    area.poly(intersect(gpc1, target))
  }

  
  if (zoneareas[1]=="none"){
    if (twokcensus){stop("Cannot calculate zone areas correctly for census. Please load 'rbgarea'")}
    
    zoneareas <- sapply(zones,area.poly)
    
  } 

  if(zbbmat[1]=="none"){
  
    zbbmat <- bbox.mat(zones)
    
  }  

    tbb <- get.bbox(target)
  
    #consider only those zones which have bounding box overlaps:
  
    zfilt <- !((zbbmat[,3] > tbb$y[2]) | (zbbmat[,4] < tbb$y[1]) | (zbbmat[,1] > tbb$x[2]) | (zbbmat[,2] < tbb$x[1]))

    zinc <- c(1:length(zones))[zfilt]
  
    olaps <- rep(0,length(zones))
       
    if(length(zinc)==0){
      #if(twokcensus){return(rep(0,22133))} else{return(matrix(nrow=0,ncol=2))}      
      if (trimout){
        return(matrix(nrow=0,ncol=2))
      } else{
        if(twokcensus){return(rep(0,22133))} else{return(rep(0,length(zones)))}
      }
    } else{
      for (i in 1:length(zinc)){
  
        olaps[zinc[i]] <- rati(zones[[zinc[i]]],target)
  
      }                               #vector of length length(zones)
                                #indicating area zone[i] overlaps with target

      if (twokcensus) {
  
      #there is not a 1-1 mapping of census GIS polygons to block groups,
      #this little bit addresses the issue.  
  
      olvs <- rep(0, 22133)
        
      for (i in 1:length(zinc)){
        bgind <- polytobgobj[zinc[i],1]
        olvs[bgind] <- olvs[bgind] + olaps[zinc[i]]
      }
      
        olaps <- olvs
    }   
      
    wts <- as.vector(olaps/zoneareas)

    wts <- round(wts, digits)
    
    if(trimout){
    
      nzs <- c(1:length(wts))[wts>0]
      retobj <- cbind(nzs,wts[wts>0])
      colnames(retobj) <- c("index","weight")
      return(retobj)
    
    } else {
      return(wts)
    }
    
    
  }
}

