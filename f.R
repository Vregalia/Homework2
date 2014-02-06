f = function(fn){
  delays = readLines(fn)
  delays = as.numeric(delays)
  avg = mean(delays, na.rm = TRUE)
  stdev = sd(delays, na.rm = TRUE)
  med = median(delays, na.rm = TRUE)
  l = length(delays)
  
  rm(delays)
  
  return(list(avg, stdev, med, l))
  
}