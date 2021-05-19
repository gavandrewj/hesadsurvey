## code to prepare `issues` dataset goes here

issues <- data.frame(varnames = names(surveydataset) ,issue = '' )

issues[issues$varnames == 'q20','issue'] <- 'Has a zero value that shouldnt be possible to enter. Is currently treated as a missing value with no label'



usethis::use_data(issues, overwrite = TRUE)
