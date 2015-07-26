### Evaluating this assignment (R Programming @Coursera, Assignment 2)
Here's how I tested cachematrix.R, and how I plan to evaluate my peer
assignments. You could do likewise if you wish.
#### Step 1
Create the test matrix. It's easier to create a *unimodular integer matrix* whose inverse is also
an integer matrix. You can search online for such examples of 3x3 matrices.

`t_mat <- matrix(c(2,4,9,3,2,6,2,3,7),nrow = 3,ncol = 3)`
#### Step 2
Print the test matrix

`print(t_mat)`

Look good?
#### Step 3
Find it's inverse by normal means. Make a note of it.

`solve(t_mat)`

OK. So now you know what to expect.
#### Step 4
Load the assignment; you should not see any errors

`source("cachematrix.R")`
#### Step 5
Create the environment cache; this starts to test the `makeCacheMatrix` function.

`t_mat_cache <- makeCacheMatrix(t_mat)`

For my assignment I used function names: `get`, `set`, `getCacheInv`, `setCacheInv`. You should
substitute appropriately.
#### Step 6
Inspect the environment cache; this verifies that the test matrix is properly cached, and will
print it out.

`t_mat_cache$get()`
#### Step 7
At this point you have not cached the inverse. Let's check that. Use the appropriate function name.
This should return NULL.

`t_mat_cache$getCacheInv()`
#### Step 8
Now let's compute and cache the inverse. The `cacheSolve` function should do this.

`cacheSolve(t_mat_cache)`

This should return the inverse as computed in **Step 3**.
#### Step 9
The inverse just computed should now be cached. Let's check that. Repeat **Step 7**. It should return
the inverse matrix (no longer NULL).

`t_mat_cache$getCacheInv()`
#### Step 10
Finally, let's re-compute the inverse. This should now retrieve data from the cache and print an
appropriate message e.g. 'getting cached data'. This verifies that the `cacheSolve` function is
working as expected.

`cacheSolve(t_mat_cache)`
