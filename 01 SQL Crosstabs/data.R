library("bitops")
library("boot")
library("gdata")
library("ggplot2")
library("gplots")
library("knitr")
library("plyr")
library("RCurl")
library("reshape2")
library("tidyr")
library("grid")
library("dplyr")
library("jsonlite")
library("rmarkdown")

rank <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT id, magtype, mag, rank() OVER (PARTITION by magtype order by mag desc) rank from EARTHQUAKES order by 2,3 desc"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_hhz76', PASS='orcl_hhz76', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

max_mag <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select id, magtype, mag, last_value(max_mag) OVER (PARTITION BY magtype order by mag) max_mag, last_value(max_mag) OVER (PARTITION BY magtype order by mag) - mag mag_diff from (SELECT id, magtype, mag, max(mag) OVER (PARTITION BY magtype) max_mag FROM earthquakes) order by 2,3 desc" '), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_hhz76', PASS='orcl_hhz76', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

n_term <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT id, magtype, mag, nth_value(mag, 2) OVER (PARTITION BY magtype) nth_mag FROM earthquakes order by 2,3 desc"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_hhz76', PASS='orcl_hhz76', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

cume_dist <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select id, magtype, mag, cume_dist() OVER (PARTITION BY magtype order by mag) cume_dist from EARTHQUAKES order by 2,3 desc" '), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_hhz76', PASS='orcl_hhz76', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))


head(rank)
head(max_mag)
head(n_term)
head(cume_dist)