samplecalc = function(fn, times = 50){ 
  
  setwd("~/Documents/UCD/2013-2014/WINTER-2014/STA-250/Homework2")
  
  means = numeric(times)
  sds = numeric(times)
  medians = numeric(times)
  
  
  for(i in 1:times){
    x = csvSample(fn, 3000)
    x = as.numeric(x)
    means[i] = mean(x, na.rm = TRUE)
    sds[i] = sd(x, na.rm = TRUE)
    medians[i] = median(x, na.rm = TRUE)
  }
  
  mean.est = mean(means)
  sd.est = mean(sds)
  median.est = mean(medians)
  
  return( list( mean.est, sd.est, median.est ) )
  
  
}