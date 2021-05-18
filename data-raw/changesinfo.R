## code to prepare `changesinfo` dataset goes here

changesinfo <- data.frame(varname = names(dataset), changes = 0 )

changesinfo[changesinfo$varname == 'q0_0',]$changes <- 'Somethingaboutsomething'

usethis::use_data(changesinfo, overwrite = TRUE)
