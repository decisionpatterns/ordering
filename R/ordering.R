#' ordering
#' 
#' Determining the ordering (montonicity) of a vector 
#' 
#' @param x numeric vector
#' @param na.rm logical; whether to omit `NA` values. (Default: TRUE)
# @param na.action function to handle \code{NA} values 
# (default:\code{\link[stats]{na.omit}})
# @param ... additional arguments passed to \code{na.action}
#' 
#' @details 
#' 
#' \code{monotonicty} determines the monotonicy (first derivative) of a numeric 
#' vector as one of:
#' 
#'  - stictly increasing, 
#'  - increasing / montonically increasing / non-decreasing, 
#'  - decreasing / monotonically decreasing / non-increasing, 
#'  - strictly decreasing, or  
#'  - constant  
#' 
#' ordering tests, e.g. [is_increasing] are more efficient at testing.
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
#' @examples
#'   ordering( 1:3 )      # 2  
#'   ordering( c(1,1,3) ) # 1 
#'   ordering( c(1,0,1) ) # 0  "No ordering, does not apply constant"
#'   ordering( c(3,1,1) ) # -1
#'   ordering( 3:1 )      # -2
#'   
#' @md
#' @rdname ordering
#' @export

ordering <- function( x, na.rm=TRUE ) { 
  
  # if( ! is.numeric(x) ) stop( "ordering can only be determined for numeric vectors.")
  
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