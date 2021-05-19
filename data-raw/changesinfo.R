## code to prepare `changesinfo` dataset goes here

changesinfo <- data.frame(varname = names(dataset), changes = 0 )

changesinfo[changesinfo$varname == 'q0_0',]$changes <- 'Labels'
changesinfo[changesinfo$varname == 'q0_1',]$changes <- 'Labels applied. All of the other option of is Black water or Black water Barima which are assumed the same'
changesinfo[changesinfo$varname == 'q0_2',]$changes <- 'Delete?'
changesinfo[changesinfo$varname == 'q0_3',]$changes <- 'Recheck to determine the valid records'
changesinfo[changesinfo$varname == 'q0_4',]$changes <- 'Labels'
changesinfo[changesinfo$varname == 'q0_5',]$changes <- 'Labels applied. One of the other option is ddd. Unclear if this record was a test record. Poor signal category added'

usethis::use_data(changesinfo, overwrite = TRUE)
