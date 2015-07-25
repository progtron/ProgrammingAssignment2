## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	ci <- NULL

	set <- function(y) {
		x <<- y
		ci <<- NULL
	}

	get <- function() { x }

	setCacheInv <- function(solve) { ci <<- solve }

	getCacheInv <- function() { ci }

	list (set = set,
	      get = get,
	      setCacheInv = setCacheInv,
	      getCacheInv = getCacheInv
	)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	ci <- x$getCacheInv()

	if(!is.null(ci)) {
		message("getting cached data")
		return(ci)
	}

	matrix <- x$get()
	ci <- solve(matrix)
	x$setCacheInv(ci)
	ci
}
