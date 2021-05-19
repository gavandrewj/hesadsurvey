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
                             levels = 1:34,
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
                                        'Black Water Barima')
)

surveydataset$q0_1 <- factor(surveydataset$q0_1)

                                        
attr(surveydataset$q0_1, "var.labels") <- 'Community'
attr(surveydataset$q0_1,'label') <- 'Community'



#q0-1oth removed

surveydataset <- surveydataset[,-6]
##



#q0-2
surveydataset$q0_4 <- factor(surveydataset$q0_4,
                             levels = c(1,2,3),
                             labels = c('Telephone',
                                        'Whatsapp',
                                        'Face-to-Face')
)


attr(surveydataset$q0_4, "var.labels") <- 'Interview Mode'
attr(surveydataset$q0_4,'label') <- 'Interview Mode'

##

#note0 note1 removed
surveydataset <- surveydataset[,-c(9,10)]

##

#q0-5
surveydataset[surveydataset$q0_5oth == 'Says Phone switch off or out of the service area' & is.na(surveydataset$q0_5oth) == F,'q0_5'] <- '4'
surveydataset[surveydataset$q0_5oth == 'the phone signal is very poor and they still cannot hear if they "hang" (higher) the phone up' & is.na(surveydataset$q0_5oth) == F,'q0_5'] <- '13'
surveydataset[surveydataset$q0_5oth == 'voicemail' & is.na(surveydataset$q0_5oth) == F,'q0_5'] <- '3'
surveydataset[surveydataset$q0_5oth == 'Voicemail' & is.na(surveydataset$q0_5oth) == F,'q0_5'] <- '3'

surveydataset$q0_5 <- factor(surveydataset$q0_5,
                             levels = 1:13,
                             labels = c(
                               'Respondent agreed to participate in the survey',
                               'Respondent refused to participate',
                               'No answer, the phone rang-out',
                               'Phone number not working',
                               'No adult at home to answer the survey questions',
                               'Unavailable/ busy (no appointment)',
                               'Interview scheduled for another time',
                               'Respondent ill or incapacitated',
                               'Security concerns of interviewer (face-to-face)',
                               'Building / household not accessible (face-to-face)',
                               'Occupants had known cases of COVID-19 (face-to-face)',
                               'Other',
                               'Poor signal (Telephone)'
                             ))
                               
surveydataset$q0_5 <- factor(surveydataset$q0_5)


attr(surveydataset$q0_5, "var.labels") <- 'Outcome of interview attempt'
attr(surveydataset$q0_5,'label') <- 'Outcome of interview attempt'

##q0_5oth removed

surveydataset <- surveydataset[,-10]

##

varlabel <- c(
  'start',
  'end',
  'today',
  'District',
  'Community',
  'Mode',
  'Telephone Numbers',
  'Household ID',
  'Interview Mode',
  'Outcome of interview attempt',
  rep('eh',347)
)

attr(surveydataset, "var.labels") <- varlabel





usethis::use_data(surveydataset, overwrite = TRUE)





