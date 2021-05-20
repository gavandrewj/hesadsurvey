## code to prepare `changesinfo` dataset goes here

changesinfo <- data.frame(varname = names(surveydataset), changes = 'label applied' )

changesinfo[changesinfo$varname == 'q0_0',]$changes <- 'Labels'
changesinfo[changesinfo$varname == 'q0_1',]$changes <- 'Labels applied. All of the other option of is Black water or Black water Barima which are assumed the same'
changesinfo[changesinfo$varname == 'q0_2',]$changes <- 'Delete?'
changesinfo[changesinfo$varname == 'q0_3',]$changes <- 'Recheck to determine the valid records'
changesinfo[changesinfo$varname == 'q0_4',]$changes <- 'Labels'
changesinfo[changesinfo$varname == 'q0_5',]$changes <- 'Labels applied. One of the other option is ddd. Unclear if this record was a test record. Poor signal category added'
changesinfo[changesinfo$varname == 'q1_0',]$changes <- 'Changed to numeric. Large number of persons in one household (19). Seems like a legitimate record'
changesinfo[changesinfo$varname == 'p1',]$changes <- 'Check name S and ttt'
changesinfo[changesinfo$varname == 'p2',]$changes <- 'Check name A'
changesinfo[changesinfo$varname == 'p3',]$changes <- 'Check name C, child1'
changesinfo[changesinfo$varname == 'q15',]$changes <- 'There is a zero entry when this shouldnt be possible given that this a closed question that is required and 0 is not part of the "same" choice values. It is currently treated as missing with no label'
changesinfo[changesinfo$varname == 'q19',]$changes <- 'Other option has heavy out of season rainfall. Examples in survey given included unusual temperature thus this would qualify. Remaining other option has ccc'
changesinfo[changesinfo$varname == 'q29',]$changes <- 'Applied labels. Conditioned on yes from q28'

usethis::use_data(changesinfo, overwrite = TRUE)
