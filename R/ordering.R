#' ordering
#' 
#' Determining the ordering (montonicity) of a vector 
#' 
#' @param x numeric vector
#' @param na.rm logical; whether to omit `NA` values. (Default: TRUE)
#' 
#' @details 
#' 
#' \code{monotonicty} determines the ordering/sorting of a vector, 
#' one of:
#' 
#'  - +2: stictly increasing, 
#'  - +1: increasing / montonically increasing / non-decreasing,
#'  -  0: constant or unsorted 
#'  - -1: decreasing / monotonically decreasing / non-increasing, 
#'  - -2: strictly decreasing, or  
#' 
#' ordering tests, e.g. [is_increasing] are more efficient at testing 
#' for specific cases.
#' 
#' `monotonicity()` is an alias for `ordering`. 
#' 
#' @return integer;
#' 
#'   - **2** : stictly increasing 
#'   - **1** : increasing / montonically increasing / non-decreasing
#'   - **0** : non-ordered or constant  
#'   - **-1**: decreasing / monotonically decreasing / non-increasing 
#'   - **-2**: strictly decreasing 
#'   - **`NA`**:` contains only `NA`s all `na.rm` did not resolve all `NA`s 
#'
#' @references
#'   http://en.wikipedia.org/wiki/Monotonic_function
#'   http://stackoverflow.com/questions/13093912/how-to-check-if-a-sequence-of-numbers-is-monotonically-increasing-or-decreasing
#'
#' @seealso 
#'  - [base::is.unsorted] 
#'          
#' @examples
#'   ordering( 1:3 )      # 2  
#'   ordering( c(1,1,3) ) # 1 
#'   ordering( c(1,0,1) ) # 0  "No ordering, does not apply constant"
#'   ordering( c(3,1,1) ) # -1
#'   ordering( 3:1 )      # -2
#'   
#'   ordering(letters)        # 2 
#'   ordering( rev(letters) ) # -2 
#'   
#' @md
#' @importFrom stats na.omit
#' @rdname ordering
#' @export


ordering <- function( x, na.rm=TRUE ) UseMethod('ordering')

ordering.default <- function(x, na.rm=TRUE) { 

  if( na.rm==TRUE ) x <- na.omit(x)  
  
 if( base::is.unsorted(x) ) return(0)
  
 if( is_increasing(x) ) 
   if( is_strictly_increasing(x) ) return(2) else return(1)
  
 if( is_decreasing(x) ) 
   if( is_strictly_decreasing(x) ) return(-2) else return(0) 
    
}


#' @export
ordering.numeric <- function( x, na.rm=TRUE ) { 
  
  if( na.rm==TRUE ) x <- na.omit(x)
  
  x. <- diff( x )
  
  # EXCEPTIONS:
  if( is.logical(x.) && length(x.) == 0 ) return( as.integer(NA) )
  if( any( is.na(x.) ) ) return( as.integer(NA) )  
   
  # NB, Order matters, the more stringent the criteria comes first
  # if( all( x. == 0 ) )  return(0L)  # constant
  
  if( all( x. >  0  ) ) return(2L)  # stricty increasing 
  if( all( x. >=  0 ) ) return(1L)  # monotonically incresing

  if( all( x. < 0  ) )  return(-2L) # monotonically decreasing     
  if( all( x. <= 0 ) )  return(-1L) # strictly decreasing 
  
  return(0)
  
}




#' @rdname ordering
#' @export

monotonicity <- ordering