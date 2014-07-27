## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## This function creates a special matrix object that can cache its inverse
 inverseX <- NULL ## forget inverse matrix
 set <- function(y){
     x <<- y ## to assign y to x
     inverseX <<- NULL ## set null again
 } 
 get <- function() {x} ## returns the present value of matrix x 
 setinverse <- function(inversematrix=matrix()) {inverseX <<- inversematrix} 
 getinverse <- function() {inverseX}
 list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
           ## Return a matrix that is the inverse of 'x'
    inverseX <- x$getinverse()  ## try to get inverse matrix
    if(!is.null(inverseX)) ## test if it is null
    {
        message("getting cached inverse data")
        return(inverseX) ## found !!! 
    }
    my_matrix_to_solve <- x$get() 
    inverseX <- solve(my_matrix_to_solve, ...) 
    x$setinverse(inverseX)  ## puts inverse matrix into the cache
    inverseX  ## returns inverse matrix
}
