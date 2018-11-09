# monotone

**Test, Check, Verify, Investigate the Monotonic Properties of Numeric Vectors**

**monotone** provides several functions for testing/checking/verify/investigating the ordering properties of vectors (numeric or otherwise). 


    is_[strictly_]*
    
Where `*` can be one of:
 
 - `monotonic` -or- `sorted`  whether the values are (strictly) ordered
 - `increasing` whether the values are in (strictly) increasing ordered
 - `decreasing` whehter the values are in (strictly) decreasing ordered   
 
In addition: 

 - `is_constant` whether all values are equal 
 - `is_incremental` whether x is incremental, ordered and equally spaced 
 - `monotoniciy` reports the degree of monotonicty.   

## install 

Install using the standard methods 

    install.packages('monotone')
     
    # -OR-
     
    devtools::install_github( "decisionpatterns/monotone")


## Usage 

The usage of the packages is probably best demonstrated by a few examples:

    x <- 1:5
    
    is_monotonic(x)           # TRUE
    is_strictly_monotonic(x)  # TRUE
    
    is_increasing(x)          # TRUE    
    is_strictly_increasing(x) # TRUE
    
    is_decreasing(x)          # FALSE
    is_strictly_decreasing(x) # FALSE
    
    is_sorted(x)              # TRUE
    is_strictly_sorted(x)     # TRUE 
    
    is_constant(x)            # FALSE
    is_incremental()          # TRUE
    
    monotonicity(x)           # 2 - strictly increasing
    