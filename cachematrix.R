## These functions allow you to create a matrix and pull its inverse from a cache.
## If the inverse is not calculated, then it will calculate the answer.

## sets and calls the value of the matrix, then sets and calls the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
      x <<- y
      m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <- inverse
  getinverse <- function() m
  list (set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## gets inverse from cache or, if necessary, calculates the inverse

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}