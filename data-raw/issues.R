## code to prepare `issues` dataset goes here

issues <- data.frame(varnames = names(surveydataset) ,issue = '' )

issues[issues$varnames == 'q20','issue'] <- 'Has a zero value that shouldnt be possible to enter. Is currently treated as a missing value with no label'
issues[issues$varnames == 'q30oth','issue'] <- 'Other options are culvert/koker and dam which do not seem to be in keeping with protecting a water resource'


usethis::use_data(issues, overwrite = TRUE)
