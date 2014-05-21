## these two functions computes the invese of a matrix, 
## and the two functions combining together caching 
## the inverse of a matrix rather than computing it
## repeatedly, 



## this function is the initalize thep, and 
## caches the inversed matrix if you run the function
## "cacheSolve".
makeCacheMatrix <- function(x = matrix()) {
    
    ### m is the cached matrix, which is NULL initially.
    m <- NULL
    
    ### this "set" function the input function
    ### the argument y is the input matrix
    set <- function(y) {
      x <<- y
      # x use <<- means x can be used 
      # the "get" function.
      # m is still NULL in set step.
      m <<- NULL
    }
    
    ### in "get" function, the argument x is 
    ### actually the input matrix y.
    get <- function() x
    
    ### the setinverse and getinverse is used in
    ### function "cacheSolve".
    setinverse <- function(inverse) m <<- inverse
    ### m use <<- means m can be used in function
    ### "getinverse".
    
    getinverse <- function() m
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse) 
}




## this function actually "solve" the inverse of
## the matrix defined in the above makeCacheMatrix 
## function, and store it in getinverse 
## if the getinverse is already computed, 
## then the second time it will directly
## throw out stored the matrix without computing agian.
cacheSolve <- function(x, ...) {
  
  ### if x has not been inverted, then 
  ### x$getinverse() is "NULL", otherwise it is not,
  ### so the first time you run the code, m 
  ### should be "NULL".
  m <- x$getinverse()
  
  ### if m is not "NULL", means the inverse
  ### has already been computed, then
  ### return m directly.
  if(!is.null(m)) {
    message("getting cached inverse matrix")
    return(m)
  }
  
  ### "data" is actully the matrix  
  ### in function "makeCacheMatrix"
  data <- x$get()
  
  ### solve the inverse
  m <- solve(data, ...)
  
  ### after matrix inverted, set
  ### the inverse matrix in function
  ### "setinverse".
  x$setinverse(m)
  
  ### return the inverse if 
  ### first computed
  m
}



