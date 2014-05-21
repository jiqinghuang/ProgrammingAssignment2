### after source the two functions, do the following to make sure it works
set.seed(123)                    # set seed

a <- makeCacheMatrix()           # create object "a"

a$set(matrix(rnorm(9), 3, 3))    # set input matrix

a$get()                          # see the matrix looks like

a$getinverse()                   # see the inverse matrix is get or not
                                 # when the first time you run the code, 
                                 # this gives you "NULL" as expected,
                                 # as the function makeCacheMatrix do not 
                                 # invert matrix.

cacheSolve(a)                    # invert the matrix and store it

a$getinverse()                   # now the inverse is obtained and stored

cacheSolve(a)                    # Red color message thrown means
                                 # the inverse is stored but not re-computed.


### let's try another example 
set.seed(123)                    # set seed

a$set(matrix(rpois(9,            # set another input matrix
      lambda = 1), 3, 3))    

a$get()                          # see the matrix looks like

a$getinverse()                   # this resets the the cached 
                                 # inverted matrix before as "NULL".

cacheSolve(a)                    # invert the new matrix and store it

a$getinverse()                   # now the inverse is obtained and stored

cacheSolve(a)                    # agian, the red color message thrown means
                                 # the inverse is stored but not re-computed.
                          

















