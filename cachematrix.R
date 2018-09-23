## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Test commit

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
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

# Testing
if (F) {
    # Create inversable matrix
    A <- matrix( c(5, 1, 0,
                   3,-1, 2,
                   4, 0,-1), nrow=3, byrow=TRUE)
    # Expected output without cache
    solve(A)
    
    # Create object with cache functionality
    A.c <- makeCacheMatrix(A)
    
    # Creating cache
    cacheSolve(A.c)
    
    # Using cache
    cacheSolve(A.c)
}
