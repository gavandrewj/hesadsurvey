## code to prepare `dataset` dataset goes here
library(readxl)

rawsurveydata <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_survey_-_all_versions_-_False_-_2021-05-18-13-12-26.xlsx')
usethis::use_data(rawsurveydata, overwrite = TRUE)

#do not touch the above code



surveydataset <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_survey_-_all_versions_-_False_-_2021-05-18-13-12-26.xlsx')
usethis::use_data(surveydataset, overwrite = TRUE)




