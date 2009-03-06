
#wrapper to assemble expected value and bound statistics for all points in the MASK grid

ab.gstats <- function(area=200, units="ha",gridgpcobj=gridgpc, gws = gridinws, strind=1, valind=2, recvals=bgvals, recarea=rbgarea, dr = damrats, cap=TRUE){

#calls:                                                                  
#ab.gmu
#ab.gbounds
#area2frac

  gfracs <- sapply(gridgpcobj[[1]],area2frac, area=area,units=units, cap=cap)

  gstarray <- array(dim=c(93,97,9))
  
  gstarray[,,1] <- ab.gmu(gridgpcobj = gridgpcobj, gws = gws, afrac = gfracs, recvar = strind, recvals = recvals, trimmedin=TRUE, dr = dr, appdam=FALSE)
  
  print("a")
  
  gstarray[,,2] <- ab.gmu(gridgpcobj = gridgpcobj, gws = gws, afrac = gfracs, recvar = strind, recvals = recvals, trimmedin=TRUE, dr = dr, appdam=TRUE)
  
  print("b")
  
  gstarray[,,3] <- ab.gmu(gridgpcobj = gridgpcobj, gws = gws, afrac = gfracs, recvar = valind, recvals = recvals, trimmedin=TRUE, dr = dr, appdam=TRUE) 
 
  print("c")
  

  strb  <- ab.gbounds(gridgpcobj=gridgpcobj,gws=gws, area=area, recarea=recarea, recvar=strind, recvals=recvals, dr=dr, appdam=FALSE)  
 
  print("d")
 
  strdb <- ab.gbounds(gridgpcobj=gridgpcobj,gws=gws, area=area, recarea=recarea, recvar=strind, recvals=recvals, dr=dr, appdam=TRUE)
 
  print("e")  
 
  vdb   <- ab.gbounds(gridgpcobj=gridgpcobj,gws=gws, area=area, recarea=recarea, recvar=valind, recvals=recvals, dr=dr, appdam=TRUE)
 
  print("f")  
    
  gstarray[,,4] <- strb[,,1]
  gstarray[,,5] <- strdb[,,1]
  gstarray[,,6] <- vdb[,,1]
    
  gstarray[,,7] <- strb[,,2]
  gstarray[,,8] <- strdb[,,2]
  gstarray[,,9] <- vdb[,,2]
  
  return(gstarray)

}
  
  
  

#
#
#ab.mu <- function(gridgpcobj=gridgpc,gws=gridinws){ 
#  
##   gtots <- sapply(gridinws,dp.interp,trimmedin=T,nobounds=T)
##   gfracs <- sapply(gridgpc,area2frac,area=200,units="ha")
#
#   
#   gtots <- sapply(gws,dp.interp,trimmedin=T,nobounds=T)
#   gfracs <- sapply(gridgpcobj[[1]],area2frac,area=200,units="ha")
#
#   gdams <- gfracs*gtots
#   
#   gstats <- matrix(0,nrow=nrow(MASK),ncol=ncol(MASK))
#   
#   for(i in 1:length(gridgpcobj[[3]])){
#      ki = gridgpcobj[[2]][gridgpcobj[[3]][i]]
#   
#      gridi = ki%/%79 + 4
#      gridj = ki%%79 + 59
#      
#      gridi <- gridi - 3
#      gridj <- gridj - 55
#   
#      gstats[gridi,gridj] <-  gdams[gridgpcobj[[3]][i]]      
#   }
#   
#   
#   
   
   #
#   for (i in 1:maske){
#      for (j in 1: masksey){   
#   
#        figuredoutindex <- idist*(i-1),j]
#   
#        gdamsm[i,j] <- gdams[figuredoutindex]
#
#      }
#    }
#


#gridinws <- mult.arealw(target.ind="all",targetlist=gridgpcobj[[1]])




#now, convert back to grid indices, and into mask:

#



#area-based grid collapse:  Collapse census block data to the gridcell level
#
#ab.gstats <- function(grid, zones, ...){
#
#
#
#
#
#
#
#
#possvect <- !((bbmat[,3] > tbb$y[2]) | (bbmat[,4] < tbb$y[1]) | (bbmat[,1] > tbb$x[2]) | (bbmat[,2] < tbb$x[1])))
#
#incvect <- c(1:length(zones))[possvect]
#
#for 
#
#
#
#given area and gridcell, find expected value, lower bound and upper bound
#for a fire of that area.
#
#too low bound would be to just find zone with lowest density and scale to area
#too high bound would be to find zone with highest value density and scale to area.
#
#more sophisticated would be to 'fill up' lowest to highest... worth it?
#
#
#while area not met
#  find bg with lowest density.  Contribute min of (arealeft, areaofit)
#  [areaofit = wts*rbgarea]
#
#  arealeft = arealeft-newcontrib
#  
#  
#