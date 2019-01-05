# ordering

![](https://img.shields.io/cran/v/ordering.svg) <!-- Version --> 
![](https://img.shields.io/cran/l/ordering.svg) <!-- License --> 
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Downloads](https://cranlogs.r-pkg.org/badges/ordering?color=brightgreen)](https://www.r-pkg.org/pkg/ordering)
[![](http://cranlogs.r-pkg.org/badges/grand-total/ordering)](https://cran.rstudio.com/web/packages/ordering/index.html)
<!-- [![Research software impact](http://depsy.org/api/package/cran/ordering/badge.svg)](http://depsy.org/package/r/ordering) -->

**Test/Check/Verify/Investigate the Ordering of Vectors**

**ordering** provides several functions for testing/checking/verify/investigating the ordering of vectors (numeric or otherwise). 

The packages has the following tests:

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

    install.packages('ordering')
     
    # -OR-
     
    devtools::install_github( "decisionpatterns/ordering")


## Usage 

The usage of the packages is probably best demonstrated by a few examples:

    x <- 1:5
    
    is_sorted(x)              # TRUE
    is_strictly_sorted(x)     # TRUE
    
    is_increasing(x)          # TRUE    
    is_strictly_increasing(x) # TRUE
    
    is_decreasing(x)          # FALSE
    is_strictly_decreasing(x) # FALSE
    
    is_sorted(x)              # TRUE
    is_strictly_sorted(x)     # TRUE 
    
    is_constant(x)            # FALSE
    is_incremental()          # TRUE
    
    monotonicity(x)           # 2 - strictly increasing
    