"bbox.mat" <-
function(zones=cabggpc){

  bbmat <- matrix(nrow=length(zones), ncol=4)

  for (i in 1:length(zones)){

    zbb <- get.bbox(zones[[i]])

    bbmat[i,] <- append(zbb$x,zbb$y)
    
  }

  colnames(bbmat) <- c("minx", "maxx", "miny", "maxy")
  return(bbmat)

}

