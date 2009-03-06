

ab.gcbounds <- function(iwtmat, area=.125^2, recarea=rbgarea, recvar=1, recvals=bgvals,appdam=FALSE, dr=damrats){

  val <- recvals[,recvar]
  
  if(appdam){
    vals <- dr*val
  }  

  effdensinit  <- val[iwtmat[,1]]/recarea[iwtmat[,1]]
  leffdensinit <- effdensinit
  ueffdensinit <- effdensinit
  
  leffdensinit[iwtmat[,2]<1] <- 0
  ueffdensinit[iwtmat[,2]<1] <- (val[iwtmat[,1]]/(iwtmat[,2]*recarea[iwtmat[,1]]))[iwtmat[,2]<1]

  effareainit <- recarea[iwtmat[,1]]

#From below here, we assume we have created leffdensinit and ueffdensinit, whose entries are the true relevant density if the bg is entirely contained, 0's or overscaled densities appropriately for those on the boundary, and effareasinit, which is the min of actual area or area in gridcell.  Both only have length of only the number of bg's actually touched by the gc (which for census could be different than number of polys touched)
 

  lbtot = 0 
  ubtot = 0

  effdens <- sort(leffdensinit)
  effarea <- effareainit[order(leffdensinit)]
  
  i = 1
  
  tarea = 0 

  while(tarea < area){

    if(i > length(effdens)){
      warning("requested area larger than land area in cell.  May be a border case, or may be improper call.")
      tarea = area+1
    } else{
      carea <- min(effarea[i],area-tarea)
      lbtot <- lbtot + carea*effdens[i]
      tarea <- tarea+carea
      i = i+1
    }

  }  


  effdens <- sort(ueffdensinit,decreasing=TRUE)
  effarea <- effareainit[order(ueffdensinit,decreasing=TRUE)]
  
  i = 1
  tarea = 0

  while(tarea < area){
  
    if(i > length(effdens)){
      warning("requested area larger than land area in cell.  May be a border case, or may be improper call.")
      tarea = area+1
    } else{
      carea <- min(effarea[i],area-tarea)
      ubtot <- ubtot + carea*effdens[i]
      tarea <- tarea+carea
      i = i+1
    }
  }  

  return(c(lbtot,ubtot))

}





#
#bgdens
#rbgareas
#bgvals
#
#give it:  
#
#for structures, construct a vector who's entries are:
#
#bgdens if entire thing is included.  total/(frac*area) if only partially included
#bgdens if entire thing is included.  0 if only partially included
#
#for structures damaged, construct a vector who's entries are:
#same, but using sdamevaled/rgbareas
#
#for val dam:
#same, but using valdamevaled/rbgareas.
#
#
#
#SO:
#need:  sdamevlaed:    = bgvals*damrats
#         valdamev:    = bgvals*damrats
#
#vector to identify whether wholly or partially included:  however done before in dp.interp
#effdens <- sdamevaled/rbgareas
#effdens[wtvec<1] <- 0
#OR
#effdens[wtvec<1] <- sdamevaled[subset]/(fracin*rbgareas)[subset]
#sdamevaled[wtvec<1] <- 

###GETS:  output of arealw, trim=TRUE:
#matrix with col 1 = bgindices, col 2 = wts.


#
#
#
#
#
#
#the difference is then:  sort:
#
#algo is:  consider effdens to be appropriate vector
#
#ab.gbounds <- function(){
#
#carea = 0 
#
#
# asdf <- bgdens[onlyingcell]   #get densities only for those bg's in the gridcell
# 
# asdf <- sort(asdf)
#
# check area not bigger than cell
#
#while(carea<area){
#
#  technically, reassign densities as total value/fraction in (for upper bound)
#  and total value if enclosed=TRUE< 0 if not, for lbound.
#
#
# 
#for lbound finding, if partial in do zero
#
#  acontrib <- max(relareas[incell],area-carea)
#  carea <- carea+acontrib
#  tot <- tot + currval*.
#  
#  ind=ind+1
#  
#}
# 
# 
# 
#  
# 
#  [areaofit = wts*rbgarea]
#
#  arealeft = arealeft-newcontrib
#  
#  