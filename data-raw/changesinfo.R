## code to prepare `changesinfo` dataset goes here

changesinfo <- data.frame(varname = names(dataset), changes = 0 )

changesinfo[changesinfo$varname == 'q0_0',]$changes <- 'Labels'
changesinfo[changesinfo$varname == 'q0_1',]$changes <- 'Labels'

usethis::use_data(changesinfo, overwrite = TRUE)
