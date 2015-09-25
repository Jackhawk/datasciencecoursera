## cachematrix caches the inverse of a matrix for latter use.
## This is useful in the event that you are working on a large
## dataset and the cached value is not likely to change.
## Caching this value saves computing the value each time
## that it is required.



# z <- makeCacheMatrix(matrix(a)) to store a matrix
# 'a' needs to be an invertible matrix
makeCacheMatrix <- function(x = matrix()) { 

    # 'm' is used to store the matrix for use by the functions
    m <- NULL
    
    # z$set() can be used to change the value of the original matrix
    set <- function(y) {
    
        # Assign the input matrix(y) of this function to
        # matrix(x) of the main function, makeCacheMatrix
        x <<- y
        
        # the variable 'm' is set to NULL in the main function
        # m <- NULL would only set m to NULL within this set() function
        m <<- NULL
    }
    
    # z$get() will return the original matrix
    get <- function() x
    
    # setInverse() is used by cacheSolve to save the inverted matrix
    setInverse <- function(inverse) m <<- inverse
    
    # z$getInverse() will return the inverse matrix
    getInverse <- function() m
    
    
    # A list of the individual functions 
    # the list is required for the functions to be available
    list(set = set, get = get, 
        setInverse = setInverse, getInverse = getInverse)
}



## cacheSolve does two things:
## 1. Calculate the inverse of a matrix and save the result
## 2. Return the inverse matrix

cacheSolve <- function(x)  {

    # Assigns the inverse matrix to the varible 'm' within this function
    m <- x$getInverse()
    
    # If the inverse matrix is in the cache
    #   show a message and then return the inverse matrix
    if(!is.null(m))  {
        message("getting cached data")
        return(m)
    }
    
    # If there is no inverse matrix cached
    #   calculate one and store it
    data <- x$get()
    m <- solve(data)
    x$setInverse(m)
    m
    
}

