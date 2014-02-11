install.packages('snow')

library(parallel)

filenames = c("arr1", "arr2", "arr3", "arr2003", "arr2004", "arr2005", "arr2006", "arr2007", "arr5", "arr6")

cl = makeCluster(4, "FORK")

avgs = numeric(10)
stdevs = numeric(10)
medians = numeric(10)
lengths = numeric(10)


x = clusterApply(cl, filenames, f)
time = system.time(clusterApply(cl, filenames, f))

  for(k in 1:10){
    t = x[[k]]
    avgs[k] = t[[1]]
    stdevs[k] = t[[2]]
    medians[k] = t[[3]]
    lengths[k] = t[[4]]
  }

avg = weighted.mean(avgs, lengths) # 6.200016
stdev = weighted.mean(stdevs, lengths) # 30.93905
med = weighted.mean(medians, lengths) # -1.168566
