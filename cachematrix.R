
##August, 2014
##1.  makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix<-function(x = matrix()) {
  m <-NULL
  
  set <-function(y) {
    x <<-y
    m <<-NULL
  }
  
  get <-function() x
  setinverse <-function(inv) m <<- inv
  getinverse <-function() m
  list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}

##2.	cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
#attention: the input in 2 comes from output in 1 
cacheSolve <- function(x,...) {
  m<-x$getinverse()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data<- x$get()

  m<-solve(data, ...) 
  x$setinverse(m)
  m
  
}

