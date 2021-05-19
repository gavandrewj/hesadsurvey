## code to prepare `dataset` dataset goes here
library(readxl)
library(tidyverse)

rawsurveydata <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_survey_-_all_versions_-_False_-_2021-05-18-13-12-26.xlsx')
usethis::use_data(rawsurveydata, overwrite = TRUE)

#do not touch the above code



surveydataset <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_survey_-_all_versions_-_False_-_2021-05-18-13-12-26.xlsx')

#q0-0
surveydataset$q0_0 <- factor(surveydataset$q0_0,
                             levels = c(1,2),
                             labels = c('Mabaruma','Moruca')
                             )


attr(surveydataset$q0_0, "var.labels") <- 'District'
attr(surveydataset$q0_0,'label') <- 'District'

##

#q0-1
surveydataset$q0_1 <- factor(surveydataset$q0_1,
                             levels = 1:35,
                             labels = c('Arukamai',
                                        'Barabina',
                                        'Hosororo',
                                        'Hotoquai',
                                        'Kamwatta (Mab)',
                                        'Khanhill',
                                        'Mabaruma Settlement',
                                        'Red Hill',
                                        'Sacred Heart',
                                        'St. Anslym Barima River',
                                        'Thomas Hill',
                                        'Three Brothers',
                                        'Tobago', 
                                        'White Water',
                                        'Yarakita',
                                        'Assakata',
                                        'Cabora',
                                        'Haimacabra',
                                        'Huradiah',
                                        'Kamwatta(Moruca)',
                                        'Karaburi',
                                        'Kariako',
                                        'Koko & Island', 
                                        'Kumaka',
                                        'Kwebanna',
                                        'Manawarin',
                                        'Mora',
                                        'Parakese Island', 
                                        'Rincon',
                                        'Santa Cruz',
                                        'Wallaba',
                                        'Waramuri',
                                        'Warapoka',
                                        'Other',
                                        'Other')
)
                                        
attr(surveydataset$q0_1, "var.labels") <- 'Community'
attr(surveydataset$q0_1,'label') <- 'Community'

varlabel <- c(
  'start',
  'end',
  'today',
  'District',
  'Community',
  rep('eh',354)
)

attr(surveydataset, "var.labels") <- varlabel





usethis::use_data(surveydataset, overwrite = TRUE)





