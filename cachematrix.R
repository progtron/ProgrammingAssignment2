## Two functions:
## (1)
## makeCacheMatrix: Sets up a persistent environment which holds a list
## of functions and their most recent values. Through the miracle of
## lexical scoping, this environment acts as a cache
## (2)
## cacheSolve: Returns the inverse of a matrix. If this value is not in
## the cache, it is computed and stored in the cache (environment). If it
## is, no computation occurs and the value is retrieved from the cache

## makeCacheMatrix:
## The main duty of this function is to create a persistent environment
## into which objects can be stored and retrieved. This is essentially
## the behaviour of a cache.
##
## It creates a list of four functions to set & get a matrix and its
## inverse. Any other module which wishes to cache a matrix or its
## inverse can perform these operations through these four funcions.

## Suggestion: Please see TestCacheMatrix.md for my notes on testing
## and evaluating this assignment.

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

## cacheSolve:
## This function returns the inverse of a matrix. Its added benefit is
## that if the inverse of the matrix has been previously cached, it is
## retrived from the cache, avoiding the compute overhead for solve()

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	ci <- x$getCacheInv()

	if(!is.null(ci)) {
		message("*** getting cached data")
		return(ci)
	}

	message("*** empty cache; computing inverse")
	matrix <- x$get()
	ci <- solve(matrix)
	x$setCacheInv(ci)
	ci
}
