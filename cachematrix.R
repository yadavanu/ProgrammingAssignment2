## These fucntions are used to compute inverse of matrix and cache it to avoid
## repeated computation

## Following function creates an object that caches inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
	inverse = NULL
	set <- function(y){
		x <<- y
		inverse <<- NULL
	}
	get <- function() x
	setInverse <- function(inputMatrix) inverse <<- inputMatrix
	getInverse <- function() inverse
	list(set = set, get = get, setInverse= setInverse, getInverse= getInverse)
}


## Following function computes inverse of matrix returned by "makeCacheMatrix"
## if not already calculated.

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'

	inverse <- x$getInverse()
	if(!is.null(inverse)){
		message("Fetching cached data")
		return(inverse)
	}
	data <- x$get()
	inverse <- solve(data)
	x$setInverse(inverse)
	
	inverse 
}
