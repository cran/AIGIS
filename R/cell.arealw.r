
#Get areal weights for a rectangular region by prescribing the bounding box.
#You pass it a vector listing the bounds (minlat, maxlat, minlong, maxlong)
#it creates a gpc polygon and calls arealw.

cell.arealw <- function(bounds, trimout = TRUE, zones = cabggpc, zbbmat = cabgbbmat, zoneareas = rbgarea, twokcensus = TRUE, digits = 6){

     gpoly <- gc2gpc(bounds)

     wts <- arealw(target=gpoly, trimout=trimout,zones = zones, zbbmat = zbbmat, zoneareas = zoneareas, twokcensus=twokcensus,digits=digits)

     return(wts)

}
