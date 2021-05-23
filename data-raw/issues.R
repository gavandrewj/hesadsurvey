## code to prepare `issues` dataset goes here

issues <- data.frame(varnames = names(surveydataset) ,issue = '' )

issues[issues$varnames == 'q20','issue'] <- 'Has a zero value that shouldnt be possible to enter. Is currently treated as a missing value with no label'
issues[issues$varnames == 'q30oth','issue'] <- 'Other options are culvert/koker and dam which do not seem to be in keeping with protecting a water resource'
issues[issues$varnames == 'q49_1','issue'] <- 'Has 77 as an entry value. Takes up 64 records which are currently put as missing. Also the condition for this question is strange because it mentioned area set aside for pasture and some persons would not have set aside any area but it was not conditioned to exclude those'
issues[issues$varnames == 'q30_1','issue'] <- 'Which water source is this question referring to. I dont see any retriction'
issues[issues$varnames == 'q40','issue'] <- 'At times more than two persons were selected. The first two persons chosen were retained. There were six interviewers that did not keep to this instruction'
issues[issues$varnames == 'q36_1','issue'] <- '12 Interviewers entered 00 or - for the units'
issues[issues$varnames == 'q36_2','issue'] <- 'Quite a number of interviwers selected the other option for units and did not specify a useful measure'
issues[issues$varnames == 'q42','issue'] <- 'Some interviewers put other and used natural rainfall. This is changed to option 5 rainfall harvesting system. The wording for this does seem debatable'
issues[issues$varnames == 'q0_2','issue'] <- 'Duplicate phone numbers but different answers'
issues[issues$varnames == 'q39','issue'] <- 'This is required. But the values for one record are missing in the raw datafile. All others are there or accounted for on the condition'
issues[issues$varnames == 'numcrop','issue'] <- 'This counts the number of crops for which "none" is an option. Thus persons with no reported crops have a count of one. This was removed'



usethis::use_data(issues, overwrite = TRUE)
