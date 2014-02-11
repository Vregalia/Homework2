
library(FastCSVSample)

library(parallel)


filenames = c("arr1", "arr2", "arr3", "arr2003", "arr2004", "arr2005", "arr2006", "arr2007", "arr5", "arr6")


fns = rep(filenames, times = 100)

cl = makeCluster(10, "FORK")
x = clusterApply(cl, filenames, samplecalc)
system.time(clusterApply(cl, filenames, samplecalc))


means = numeric(10)
sds = numeric(10)
medians = numeric(10)

for(k in 1:10){
  t = x[[k]]
  means[k] = t[[1]]
  sds[k] = t[[2]]
  medians[k] = t[[3]]
}

mean.est = mean(means)
sd.est = mean(sds)
median.est = mean(medians)


#1000 sample size:{ mean = 6.2992, median = -1.393, sd = 31.6652, system.time =   #user  system elapsed 
#0.218   0.222 238.608   }


#Sample size: 3000 : {mean = 6.2964, median = -1.445, sd = 32.2935, time:    user  #system elapsed 
#0.258   0.242 245.693  }
