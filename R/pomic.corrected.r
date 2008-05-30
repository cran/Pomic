`pomic.corrected` <-
function(object1,object2,eps=10^-30,nrange=1000)
{
  r1<-range(object1,na.rm=TRUE)
	r<-extendrange(r1,f=0.01)
	bw1<-bw.nrd0(object1)

  d1<-density(object1,bw=bw1,from=r[1],to=r[2],n=nrange)
  o1<-d1$y
  w <- o1 < eps
  if (any(w)) o1[w] <- eps
  pdf1 <- approxfun( d1$x, o1, yleft=eps, yright=eps)

  d2<-density(object2,bw=bw1,from=r[1],to=r[2],n=nrange)
	o2<-d2$y
	w <- o2 < eps
	if (any(w)) o2[w] <- eps
	pdf2 <- approxfun( d2$x, o2, yleft=eps, yright=eps)

  x <- sum( log(pdf1(object1)) ) - sum ( log(pdf2(object1)) )
  x
}