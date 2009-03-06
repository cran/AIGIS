  
area2frac <- function(cell, area=200, units="ha", cap=TRUE, naive=TRUE, zones = cabggpc, zbbmat = cabgbbmat, twokcensus=TRUE, polytobgobj=polytobg){

  if(naive){

    if(class(cell)=="gpc.poly"){
      cbb <- get.bbox(cell)
      hilat   = cbb$y[2]
      lowlat  = cbb$y[1]
 
      rawarea <- area.poly(cell)   
    
    } else{    
      hilat  <- cell[4]
      lowlat <- cell[3]
      hilong <- cell[2]
      lowlong<- cell[1]
    
      rawarea <- (hilat-lowlat)*(hilong-lowlong)
    }
    
    }else{
      
      if(class(cell)!="gpc.poly"){stop("for smart (naive=FALSE) fraction finding, must pass         cell as a gpc.poly")}
      
      cbb <- get.bbox(cell)
      hilat   = cbb$y[2]
      lowlat  = cbb$y[1]
    
      rati <- function(gpc1,target){
        area.poly(intersect(gpc1, target))
      }

      if(zbbmat[1]=="none"){
  
        zbbmat <- bbox.mat(zones)
    
      }  

      tbb <- get.bbox(cell)
  
    #consider only those zones which have bounding box overlaps:
  
      zfilt <- !((zbbmat[,3] > tbb$y[2]) | (zbbmat[,4] < tbb$y[1]) | (zbbmat[,1] > tbb$x[2]) | (zbbmat[,2] < tbb$x[1]))

      zinc <- c(1:length(zones))[zfilt]
  
      olaps <- rep(0,length(zones))
       
      if(length(zinc)==0){
   
        rawarea <- 0
      
      } else{
      
        for (i in 1:length(zinc)){
  
        olaps[zinc[i]] <- rati(zones[[zinc[i]]],cell)
  
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
 
        rawarea <- sum(olaps)  
        
      }
    }   
  
  midlat = pi*(hilat+lowlat)/360

  acell =  rawarea*cos(midlat)

  
#one square degree at the equator is 3600 square nautical miles. 
#The following scalers convert that to various other area units.  
  
  if(units=="deg-area"){
    scaler = 1
  } else if(units=="ha"){
    scaler = 1234765.44
  } else if(units=="sqkm"){  
    scaler = 12347.6544
  } else if(units=="acres"){
    scaler = 3051171.85
  } else if(units=="sqmi"){
    scaler = 4767.45602
  } else{
    stop(units, " is not a valid option for units")
  }  
  
  if(cap){  
    return(min(c(area/(scaler*acell),1)))
  }else{
    return(area/(scaler*acell))
  }
}
