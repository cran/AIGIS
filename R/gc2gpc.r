

#convert gridcell bounding box to a gpc.poly
#as is transparent in the code, bounds should be constructed as a vector with
#entries: minlongitude, maxlongitude, minlatitude, maxlatitude. 

gc2gpc <- function(bounds){


    minglon <- bounds[1]
    maxglon <- bounds[2]
    minglat <- bounds[3]
    maxglat <- bounds[4]

     gpoly <- cbind(c(minglon, maxglon, maxglon, minglon),c(minglat, minglat, maxglat, maxglat))

     gpoly <- as(gpoly, "gpc.poly")

     return(gpoly)
     
}
