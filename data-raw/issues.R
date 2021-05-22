## code to prepare `issues` dataset goes here

issues <- data.frame(varnames = names(surveydataset) ,issue = '' )

issues[issues$varnames == 'q20','issue'] <- 'Has a zero value that shouldnt be possible to enter. Is currently treated as a missing value with no label'
issues[issues$varnames == 'q30oth','issue'] <- 'Other options are culvert/koker and dam which do not seem to be in keeping with protecting a water resource'
issues[issues$varnames == 'q49_1','issue'] <- 'Has 77 as an entry value'
issues[issues$varnames == 'q30_1','issue'] <- 'Which water source is this question referring to. I dont see any retriction'
issues[issues$varnames == 'q40','issue'] <- 'At times more than two persons were selected. The first two persons chosen were retained. There were six interviewers that did not keep to this instruction'
issues[issues$varnames == 'q36_1','issue'] <- '12 Interviewers entered 00 or - for the units'
issues[issues$varnames == 'q36_2','issue'] <- 'Quite a number of interviwers selected the other option for units and did not specify a useful measure'



usethis::use_data(issues, overwrite = TRUE)
