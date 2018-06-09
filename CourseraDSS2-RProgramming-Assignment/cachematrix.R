## Coursera.org course on R Programming
## Programming Assignment 2 on Lexical Scoping

## The following pair of functions cache the inverse of a matrix.

###########################
## makeCacheMatrix function
###########################

## This function creates a special "matrix" object that can cache its inverse.

## It creates a special vector consisting of:
## a function to set the value of a vector,
## a function to get the value of the matrix,
## a function to solve the matrix for its inverse,
## a function to get the inverse of the matrix.

## It is based on makeVector function provided for explaining the assignment.

makeCacheMatrix <- function(x = matrix()) {
       z <- NULL
        set <- function(y) {
                x <<- y
                z <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) z <<- solve
        getInverse <- function() z
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

######################
## cacheSolve function
######################

## This function computes the inverse of the special "matrix"
## returned by the above makeCacheMatrix function.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cacheSolve retrieves the inverse from the cache.

## It is based on cachemean function provided for explaining the assignment.

cacheSolve <- function(x, ...) {
        z <- x$getInverse()
        if(!is.null(z)) {
                message("getting cached data")
                return(z)
        }
        data <- x$get()
        z <- solve(data, ...)
        x$setInverse(z)
        z
}