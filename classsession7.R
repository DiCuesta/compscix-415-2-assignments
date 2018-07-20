> (diam_lm <- lm(formula = price ~ carat, data = diamonds))

Call:
  lm(formula = price ~ carat, data = diamonds)

Coefficients:
  (Intercept)        carat  
-2256         7756  

> n <- 1000 #how many samples
> slopes <- rep(NA, n) # empty vector for saving coefficients
> for(i in 1:n) {
  +   diam_samp <- diamonds %>% sample_n(10000) # random sample
  +   diam_samp_lm <- lm(price ~ carat, data = diam_samp)
  +   slopes[i] <- coef(diam_samp_lm)[2] # store the coefficient
  + }
> slopes <- as_tibble(slopes)
> 
  > 
  > slopes
# A tibble: 1,000 x 1
value
<dbl>
  1 7828.
2 7792.
3 7760.
4 7736.
5 7751.
6 7804.
7 7762.
8 7667.
9 7755.
10 7717.
# ... with 990 more rows
> hist(slopes)
Error in hist.default(slopes) : 'x' must be numeric
> slopes
# A tibble: 1,000 x 1
value
<dbl>
  1 7828.
2 7792.
3 7760.
4 7736.
5 7751.
6 7804.
7 7762.
8 7667.
9 7755.
10 7717.
# ... with 990 more rows
> slopes %>% ggplot(aes(x=slopes)) + geom_histogram()
Don't know how to automatically pick scale for object of type tbl_df/tbl/data.frame. Defaulting to continuous.
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
> install.packages("broom")
Error in install.packages : Updating loaded packages

Restarting R session...

> library("broom")
> glance(diam_samp)
Error: evaluation nested too deeply: infinite recursion / options(expressions=)?
Error during wrapup: evaluation nested too deeply: infinite recursion / options(expressions=)?
> glance(diam_samp_lm)
r.squared adj.r.squared    sigma statistic p.value df    logLik      AIC      BIC    deviance
1 0.8477194     0.8477042 1564.177  55657.12       0  2 -87739.53 175485.1 175506.7 24461588816
df.residual
1        9998
> 
> diamonds <- diamonds %>% mutate(cut_fct = factor(cut, ordered = FALSE))
Error: could not find function "%>%"
> diamonds %>% mutate(cut_fct = factor(cut, ordered = FALSE))
Error: could not find function "%>%"
> diamonds
# A tibble: 53,940 x 10
carat cut       color clarity depth table price     x     y     z
<dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
7 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47
8 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53
9 0.22  Fair      E     VS2      65.1    61   337  3.87  3.78  2.49
10 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39
# ... with 53,930 more rows
> diamondss <- diamonds %>% mutate(cut_fct = factor(cut, ordered = FALSE))
Error: could not find function "%>%"
> library(tidyverse)
── Attaching packages ─────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
✔ ggplot2 2.2.1     ✔ purrr   0.2.5
✔ tibble  1.4.2     ✔ dplyr   0.7.6
✔ tidyr   0.8.1     ✔ stringr 1.3.1
✔ readr   1.1.1     ✔ forcats 0.3.0
── Conflicts ────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
> diamondss <- diamonds %>% mutate(cut_fct = factor(cut, ordered = FALSE))
> diamondss
# A tibble: 53,940 x 11
carat cut       color clarity depth table price     x     y     z cut_fct  
<dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl> <fct>    
1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43 Ideal    
2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31 Premium  
3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31 Good     
4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63 Premium  
5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75 Good     
6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48 Very Good
7 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47 Very Good
8 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53 Very Good
9 0.22  Fair      E     VS2      65.1    61   337  3.87  3.78  2.49 Fair     
10 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39 Very Good
# ... with 53,930 more rows
> diamonds
# A tibble: 53,940 x 10
carat cut       color clarity depth table price     x     y     z
<dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
7 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47
8 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53
9 0.22  Fair      E     VS2      65.1    61   337  3.87  3.78  2.49
10 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39
# ... with 53,930 more rows
> install.packages("rvest")
Error in install.packages : Updating loaded packages

Restarting R session...

> install.packages("rvest")
trying URL 'https://cran.rstudio.com/bin/macosx/mavericks/contrib/3.3/rvest_0.3.2.tgz'
Content type 'unknown' length 851402 bytes (831 KB)
==================================================
downloaded 831 KB


The downloaded binary packages are in
/var/folders/_p/szxb5jy14h7cdmj56sxm50xw0000gp/T//RtmpWjVJU8/downloaded_packages
> library(rvest)
Loading required package: xml2
> library(rvest)
> thenote <- read_html("https://www.imdb.com/title/tt0332280/?ref_=nv_sr_1")
> class(thenote)
[1] "xml_document" "xml_node"    
> thenote
{xml_document}
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<script type="te ...
[2] <body id="styleguide-v2" class="fixed">\n            <img height="1" width="1" style="display ...
> thenote %>% html_nodes("#titleCast .itemprop span") %>% html_text()
[1] "Tim Ivey"                  "Gena Rowlands"             "Starletta DuPois"         
[4] "James Garner"              "Anthony-Michael Q. Thomas" "Ed Grady"                 
[7] "Renée Amber"               "Jennifer Echols"           "Geoffrey Knight"          
[10] "Kevin Connolly"            "Ryan Gosling"              "Heather Wahlquist"        
[13] "Rachel McAdams"            "Andrew Schaff"             "Matt Shelly"              
> library("jsonlite")
> chocolate_brands <- c('
+   [
  +     {
    +       "name" : "Dove Bar",
    +       "founded" : 1956
    +     },
  +     {
    +       "name" : "Toblerone",
    +       "founded" : 1908
    +     }
  +   ]')
> chocolate_brands
[1] "\n  [\n    {\n      \"name\" : \"Dove Bar\",\n      \"founded\" : 1956\n    },\n    {\n      \"name\" : \"Toblerone\",\n      \"founded\" : 1908\n    }\n  ]"
> choco_json <- fromJSON(chocolate_brands)
> choco_json
name founded
1  Dove Bar    1956
2 Toblerone    1908
> url<- https://api.jcdecaux.com/vls/v1/stations?contract=",'Dublin',"9d2f84692667db73003bc253006f4ef90d89fb0"
Error: unexpected '/' in "url<- https:/"
> url<- "https://api.jcdecaux.com/vls/v1/stations?contract=",'Dublin',"9d2f84692667db73003bc253006f4ef90d89fb0"
Error: unexpected ',' in "url<- "https://api.jcdecaux.com/vls/v1/stations?contract=","
 url<- paste0("https://api.jcdecaux.com/vls/v1/stations?contract=",'Dublin',"9d2f84692667db73003bc253006f4ef90d89fb0")

Error in open.connection(con, "rb") : HTTP error 403.

