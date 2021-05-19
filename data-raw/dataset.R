## code to prepare `dataset` dataset goes here
library(readxl)
library(tidyverse)

rawsurveydata <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_survey_-_all_versions_-_False_-_2021-05-18-13-12-26.xlsx')
rawsurveydata <- filter(rawsurveydata,q0_5 == 1)
usethis::use_data(rawsurveydata, overwrite = TRUE)

#do not touch the above code



surveydataset <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_survey_-_all_versions_-_False_-_2021-05-18-13-12-26.xlsx')

#filter to remove records with no data


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

# filter out non response
nonresponsesurveydataset <- filter(surveydataset,q0_5 != 'Respondent agreed to participate in the survey')
surveydataset <- filter(surveydataset,q0_5 == 'Respondent agreed to participate in the survey')

##q0_5oth removed

surveydataset <- surveydataset[,-10]
surveydataset <- surveydataset[,-10]

##


##q1_0
surveydataset$q1_0 <- as.numeric(surveydataset$q1_0)
attr(surveydataset$q1_0, "var.labels") <- 'How many members does your household have?'
attr(surveydataset$q1_0,'label') <- 'How many members does your household have?'
##

##p1 - p20

attr(surveydataset$p1, "var.labels") <- 'Name of Person One'
attr(surveydataset$p1,'label') <- 'Name of Person One' 

attr(surveydataset$p2, "var.labels") <- 'Name of Person Two'
attr(surveydataset$p2,'label') <- 'Name of Person Two'

attr(surveydataset$p3, "var.labels") <- 'Name of Person Three'
attr(surveydataset$p3,'label') <- 'Name of Person Three'

attr(surveydataset$p4, "var.labels") <- 'Name of Person Four'
attr(surveydataset$p4,'label') <- 'Name of Person Four'

attr(surveydataset$p5, "var.labels") <- 'Name of Person Five'
attr(surveydataset$p5,'label') <- 'Name of Person Five'

attr(surveydataset$p6, "var.labels") <- 'Name of Person Six'
attr(surveydataset$p6,'label') <- 'Name of Person Six'

attr(surveydataset$p7, "var.labels") <- 'Name of Person Seven'
attr(surveydataset$p7,'label') <- 'Name of Person Seven'

attr(surveydataset$p8, "var.labels") <- 'Name of Person Eight'
attr(surveydataset$p8,'label') <- 'Name of Person Eight'

attr(surveydataset$p9, "var.labels") <- 'Name of Person Nine'
attr(surveydataset$p9,'label') <- 'Name of Person Nine'


attr(surveydataset$p10, "var.labels") <- 'Name of Person Ten'
attr(surveydataset$p10,'label') <- 'Name of Person Ten'

attr(surveydataset$p11, "var.labels") <- 'Name of Person Eleven'
attr(surveydataset$p11,'label') <- 'Name of Person Eleven'

attr(surveydataset$p12, "var.labels") <- 'Name of Person Twelve'
attr(surveydataset$p12,'label') <- 'Name of Person Twelve'

attr(surveydataset$p13, "var.labels") <- 'Name of Person Thirteen'
attr(surveydataset$p13,'label') <- 'Name of Person Thirteen'

attr(surveydataset$p14, "var.labels") <- 'Name of Person Fourteen'
attr(surveydataset$p14,'label') <- 'Name of Person Fourteen'

attr(surveydataset$p15, "var.labels") <- 'Name of Person Fifteen'
attr(surveydataset$p15,'label') <- 'Name of Person Fifteen'


attr(surveydataset$p16, "var.labels") <- 'Name of Person Sixteen'
attr(surveydataset$p16,'label') <- 'Name of Person Sixteen'

attr(surveydataset$p17, "var.labels") <- 'Name of Person Seventeen'
attr(surveydataset$p17,'label') <- 'Name of Person Seventeen'

attr(surveydataset$p18, "var.labels") <- 'Name of Person Eighteen'
attr(surveydataset$p18,'label') <- 'Name of Person Eighteen'

attr(surveydataset$p19, "var.labels") <- 'Name of Person Nineteen'
attr(surveydataset$p19,'label') <- 'Name of Person Nineteen'

surveydataset <- surveydataset[,-30]


## q10

surveydataset$q10 <- factor(surveydataset$q10,
                            levels = 1:4,
                            labels = c(
                              'Male headed',
                              'Female headed',
                              'Child headed (below age 18)/Orphan', 
                              'Jointly headed by male and female'
                              )
                            )
surveydataset$q10 <- factor(surveydataset$q10)

attr(surveydataset$q10, "var.labels") <- 'Which of the following best describes your household?'
attr(surveydataset$q10,'label') <- 'Which of the following best describes your household?'



## q-10-1

surveydataset$q10_1 <- factor(surveydataset$q10_1,
                              levels = 1:4,
                              labels = c(
                                'Managed by a male',
                                'Managed by a female',
                                'Managed by a child (below age 18)/Orphan', 
                                'Jointly managed by male and female'
                                      )
                              )

surveydataset$q10_1 <- factor(surveydataset$q10_1)

attr(surveydataset$q10_1, "var.labels") <- 'Which of the following best describes how your household is managed?'
attr(surveydataset$q10_1,'label') <- 'Which of the following best describes how your household is managed?'


## q11
surveydataset$q11 <- factor(surveydataset$q11,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'

                            )
                            )

surveydataset$q11 <- factor(surveydataset$q11)

attr(surveydataset$q11, "var.labels") <- 'Have one or more household members participated in the development or updating of a community development plan, village investment plan or similar types of plans **in the last 12 months?**'
attr(surveydataset$q11,'label') <- 'Have one or more household members participated in the development or updating of a community development plan, village investment plan or similar types of plans **in the last 12 months?**'

## q12
 surveydataset[surveydataset$q11 != 'Yes','q12'] <- '97'

surveydataset$q12 <- factor(surveydataset$q12,
                            levels = c(0,1,98,99,97),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer',
                              'Not Applicable'
                            )
)

surveydataset$q12 <- factor(surveydataset$q12)

attr(surveydataset$q12, "var.labels") <- 'Were actions to reduce the impacts from climate events (such as floods, salt water intrusion or periods with unusual high temperatures) considered in this plan, in which you participated?'
attr(surveydataset$q12,'label') <- 'Were actions to reduce the impacts from climate events (such as floods, salt water intrusion or periods with unusual high temperatures) considered in this plan, in which you participated?'



## q13
surveydataset$q13 <- factor(surveydataset$q13,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'
                            )
)

surveydataset$q13 <- factor(surveydataset$q13)

attr(surveydataset$q13, "var.labels") <- 'Is at least one household member participating in a community or producer group that has an adopted business plan?'
attr(surveydataset$q13,'label') <- 'Is at least one household member participating in a community or producer group that has an adopted business plan?'


#q14
surveydataset[surveydataset$q13 != 'Yes','q14'] <- '97'

surveydataset$q14 <- factor(surveydataset$q14,
                            levels = c(0,1,98,99,97),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer',
                              'Not Applicable'
                            )
)

surveydataset$q14 <- factor(surveydataset$q14)

attr(surveydataset$q14, "var.labels") <- 'Has the business plan contributed to an increase in the household incomes in the last twelve months?'
attr(surveydataset$q14,'label') <- 'Has the business plan contributed to an increase in the household incomes in the last twelve months?'


# q15
surveydataset$q15 <- factor(surveydataset$q15,
                            levels = c(1,2,3,97,98,99),
                            labels = c(
                              'Decreased number',
                              'Same number',
                              'Increased number',
                              'Not applicable',
                              "Don't know",
                              'No answer'

                            )
)

surveydataset$q15 <- surveydataset$q15

attr(surveydataset$q15, "var.labels") <- 'Does the household use the same or an increased number of crop varieties, animal species and wild species as food or income generating source compared to 12 months ago?'
attr(surveydataset$q15,'label') <- 'Does the household use the same or an increased number of crop varieties, animal species and wild species as food or income generating source compared to 12 months ago?'


#q16

surveydataset$q16 <- factor(surveydataset$q16,
                            levels = c(0,1,97,9,99),
                            labels = c(
                              'No',
                              'Yes',
                              'Not applicable',
                              "Don't know",
                              'No answer'

                            ))
surveydataset$q16 <- factor(surveydataset$q16)

attr(surveydataset$q16, "var.labels") <- 'Has the household used climate-smart production practices or techniques, in at least 1/4 of its cultivated land **within the last 12 months?**'
attr(surveydataset$q16,'label') <- 'Has the household used climate-smart production practices or techniques, in at least 1/4 of its cultivated land **within the last 12 months?**'



#q17
surveydataset[surveydataset$q16 != 'Yes','q17'] <- '97'

surveydataset$q17 <- factor(surveydataset$q17,
                             levels = c(1,2,3,98,97),
                            labels = c(
                              'Within the last 12 months',
                              '1-5 years ago',
                              'More than 5 years ago',
                              'Don’t know',
                              'Not Applicable'
                            ))
surveydataset$q17 <- factor(surveydataset$q17)


attr(surveydataset$q17, "var.labels") <- 'When were these practices first adopted by the household?'
attr(surveydataset$q17,'label') <- 'When were these practices first adopted by the household?'



#q18
surveydataset$q18 <- factor(surveydataset$q18,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'

                            )
                              
                            )
surveydataset$q18 <- factor(surveydataset$q18)

attr(surveydataset$q18, "var.labels") <- 'Has the household experienced any extreme climate events the last 12 months?'
attr(surveydataset$q18,'label') <- 'Has the household experienced any extreme climate events the last 12 months?'



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
  'How many members does your household have?',
  'Name of Person One',
  'Name of Person Two',
  'Name of Person Three',
  'Name of Person Four',
  'Name of Person Five',
  'Name of Person Six',
  'Name of Person Seven',
  'Name of Person Eight',
  'Name of Person Nine',
  'Name of Person Ten',
  'Name of Person Eleven',
  'Name of Person Twelve',
  'Name of Person Thirteen',
  'Name of Person Fourteen',
  'Name of Person Fifteen',
  'Name of Person Sixteen',
  'Name of Person Seventeen',
  'Name of Person Eighteen',
  'Name of Person Nineteen',
  'Which of the following best describes your household?',
  'Which of the following best describes how your household is managed?',
  'Have one or more household members participated in the development or updating of a community development plan, village investment plan or similar types of plans **in the last 12 months?**',
  'Were actions to reduce the impacts from climate events (such as floods, salt water intrusion or periods with unusual high temperatures) considered in this plan, in which you participated?',
  'Is at least one household member participating in a community or producer group that has an adopted business plan?', 
  'Has the business plan contributed to an increase in the household incomes in the last twelve months?',
  'Does the household use the same or an increased number of crop varieties, animal species and wild species as food or income generating source compared to 12 months ago?',
  'Has the household used climate-smart production practices or techniques, in at least 1/4 of its cultivated land **within the last 12 months?**',
  'When were these practices first adopted by the household?',
  'Has the household experienced any extreme climate events the last 12 months?',
  rep('eh',314)
)

attr(surveydataset, "var.labels") <- varlabel





usethis::use_data(surveydataset, overwrite = TRUE)





