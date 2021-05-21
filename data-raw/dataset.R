## code to prepare `dataset` dataset goes here
library(readxl)
library(tidyverse)
library(stringr)
library(datapasta)

rawsurveydata <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_Survey2_-_all_versions_-_False_-_2021-05-21-10-31-53.xlsx')
rawsurveydata <- filter(rawsurveydata,q0_5 == 1)


rawsurveydata <- mutate(rawsurveydata,
                        q31_1 = `q31/1`,
                        q31_2 = `q31/2`,
                        q31_3 = `q31/3`,
                        q31_4 = `q31/4`,
                        q31_5 = `q31/5`,
                        q31_6 = `q31/6`,
                        q31_7 = `q31/7`,
                        q31_8 = `q31/8`,
                        q31_9 = `q31/9`,
                        q31_10 = `q31/10`
)
usethis::use_data(rawsurveydata, overwrite = TRUE)

#do not touch the above code



surveydataset <- read_excel('C:/Users/gavin/Documents/GitHub/hesadsurvey/data-raw/HESAD_Survey2_-_all_versions_-_False_-_2021-05-21-10-31-53.xlsx')

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


#q19
surveydataset[surveydataset$q18 != 'Yes','q19'] <- '97'
surveydataset[surveydataset$q19oth == 'Heavy rains from May-September' & is.na(surveydataset$q19oth)== F,'q19'] <- '5'

surveydataset$q19 <- factor(surveydataset$q19,
                            levels = c(1,2,3,4,5,97),
                            labels = c(
                              'Flood',
                              'Longer than normal dry period',
                              'Period with very hot days',
                              'Other',
                              'Heavy rains (Out of Season)',
                              'Not Applicable'
                            ))

surveydataset$q19 <- factor(surveydataset$q19)
attr(surveydataset$q19, "var.labels") <- 'What was the event about?'
attr(surveydataset$q19,'label') <- 'What was the event about?'

# q19oth removed 
surveydataset <- surveydataset[,-41]



#q20
surveydataset[surveydataset$q18 != 'Yes','q20'] <- '97'

surveydataset$q20  <- factor(surveydataset$q20,
                             levels = c(1,2,3,4,5,98,99,97),
                             labels = c(
                               'No significant loss',
                               'No more than one-third',
                               'More than one-third but less than one half',
                               'More than half but less than three-quarters',
                               'All or almost all',
                               "Don't know",
                               'No answer',
                               'Not Applicable'   
                             )
)

surveydataset$q20 <- factor(surveydataset$q20)


attr(surveydataset$q20, "var.labels") <- 'How severe was the loss of production of food and income due to this event? How much of the production and or income was lost?'
attr(surveydataset$q20,'label') <- 'How severe was the loss of production of food and income due to this event? How much of the production and or income was lost?'



#q21
surveydataset$q21 <- factor(surveydataset$q21,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'

                            ))

surveydataset$q21 <- factor(surveydataset$q21)

attr(surveydataset$q21, "var.labels") <- 'Did the household experience water scarcity **for household needs** the last 12 months?'
attr(surveydataset$q21,'label') <- 'Did the household experience water scarcity **for household needs** the last 12 months?'



#q22
surveydataset$q22 <- factor(surveydataset$q22,
                            levels = c(0,1,97,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              'Not applicable',
                              "Don't know",
                              'No answer'
                            ))

surveydataset$q22 <- factor(surveydataset$q22)

attr(surveydataset$q22, "var.labels") <- 'Has the household experienced water scarcity **for production needs** the last 12 months?'
attr(surveydataset$q22,'label') <- 'Has the household experienced water scarcity **for production needs** the last 12 months?'


#q23
surveydataset$q23 <- factor(surveydataset$q23,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'

                            ))
surveydataset$q23 <- factor(surveydataset$q23)

attr(surveydataset$q23, "var.labels") <- 'Does the household have access to a renewable energy source for household needs?'
attr(surveydataset$q23,'label') <- 'Does the household have access to a renewable energy source for household needs?'



#q24
surveydataset$q24 <- factor(surveydataset$q24,
                            levels = c(0,1,97,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              'Not applicable',
                              "Don't know",
                              'No answer'

                            ))

surveydataset$q24 <- factor(surveydataset$q24)

attr(surveydataset$q24, "var.labels") <- 'Does the household or the producer group it works with have access to a renewable energy source for production, storage and processing needs?'
attr(surveydataset$q24,'label') <- 'Does the household or the producer group it works with have access to a renewable energy source for production, storage and processing needs?'


#q25
surveydataset$q25 <- factor(surveydataset$q25,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'

                            ))
surveydataset$q25 <- factor(surveydataset$q25)

attr(surveydataset$q25, "var.labels") <- 'In the last 12 months, has the household used the internet to access information on markets (prices, buyers, demand for products etc.), weather forecast and early warnings or advice on climate smart farming practices?'
attr(surveydataset$q25,'label') <- 'In the last 12 months, has the household used the internet to access information on markets (prices, buyers, demand for products etc.), weather forecast and early warnings or advice on climate smart farming practices?'



#q26
surveydataset[surveydataset$q25 != 'Yes','q26'] <- '97'


surveydataset$q26 <- factor(surveydataset$q26,
                            levels = c(0,1,97,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              'Not applicable',
                              "Don't know",
                              'No answer'
                            ))

surveydataset$q26 <- factor(surveydataset$q26)

attr(surveydataset$q26, "var.labels") <- 'Did you use this information to make decisions on crops and varieties to cultivate and time of planting or other important decisions in your farming activities?'
attr(surveydataset$q26,'label') <- 'Did you use this information to make decisions on crops and varieties to cultivate and time of planting or other important decisions in your farming activities?'


#q27

surveydataset$q27 <- factor(surveydataset$q27,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'
                              
                            ))
surveydataset$q27 <- factor(surveydataset$q27)

attr(surveydataset$q27, "var.labels") <- 'If a climate disaster, such as a flood or a long dry and hot period, happened within the next 6 months, does your household have or have access to resources (for example: cash savings, seeds, stored food, etc.) to cope?'
attr(surveydataset$q27,'label') <- 'If a climate disaster, such as a flood or a long dry and hot period, happened within the next 6 months, does your household have or have access to resources (for example: cash savings, seeds, stored food, etc.) to cope?'


#q28

surveydataset$q28 <- factor(surveydataset$q28,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'
                              
                            ))
surveydataset$q28 <- factor(surveydataset$q28)

attr(surveydataset$q28, "var.labels") <- 'Have your household or community experienced that agricultural land is affected by salinity (sea/salt water intrusion)'
attr(surveydataset$q28,'label') <- 'Have your household or community experienced that agricultural land is affected by salinity (sea/salt water intrusion)'



#q29
surveydataset[surveydataset$q28 != 'Yes','q29'] <- '97'

surveydataset$q29 <- factor(surveydataset$q29,
                            levels = c(0,1,98,99,97),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer',
                              'Not Applicable'
                            ))
surveydataset$q29 <- factor(surveydataset$q29)

attr(surveydataset$q29, "var.labels") <- 'Have you been able to change to more salt tolerant crops or aquaculture to still be able to use this land?'
attr(surveydataset$q29,'label') <- 'Have you been able to change to more salt tolerant crops or aquaculture to still be able to use this land?'

#q300 removed
#q301

surveydataset <- dplyr::select(surveydataset,!q30_0) 

surveydataset$q30_1 <- factor(surveydataset$q30_1,
                              levels = c(0,1),
                              labels = c(
                                'No',
                                'Yes'
                              ))

surveydataset$q30_1 <- factor(surveydataset$q30_1)

attr(surveydataset$q30_1, "var.labels") <- 'Forest, or tree species, that is kept to protect the water source: Are there any mechanisms in place to protect the water source?'
attr(surveydataset$q30_1,'label') <- 'Forest, or tree species, that is kept to protect the water source: Are there any mechanisms in place to protect the water source?'



#q302

surveydataset$q30_2 <- factor(surveydataset$q30_2,
                              levels = c(0,1),
                              labels = c(
                                'No',
                                'Yes'
                              ))

surveydataset$q30_2 <- factor(surveydataset$q30_2)

attr(surveydataset$q30_2, "var.labels") <- 'Grazing that is kept unused and being restored or reforested: Are there any mechanisms in place to protect the water source?'
attr(surveydataset$q30_2,'label') <- 'Grazing that is kept unused and being restored or reforested: Are there any mechanisms in place to protect the water source?'


#q303

surveydataset$q30_3 <- factor(surveydataset$q30_3,
                              levels = c(0,1),
                              labels = c(
                                'No',
                                'Yes'
                              ))

surveydataset$q30_3 <- factor(surveydataset$q30_3)

attr(surveydataset$q30_3, "var.labels") <- 'Fence: Are there any mechanisms in place to protect the water source?'
attr(surveydataset$q30_3,'label') <- 'Fence: Are there any mechanisms in place to protect the water source?'

#leaving q304 and q30oth for now 

#changing the names to adjust for the /
surveydataset <- mutate(surveydataset,
                       q31_1 = `q31/1`,
                       q31_2 = `q31/2`,
                       q31_3 = `q31/3`,
                       q31_4 = `q31/4`,
                       q31_5 = `q31/5`,
                       q31_6 = `q31/6`,
                       q31_7 = `q31/7`,
                       q31_8 = `q31/8`,
                       q31_9 = `q31/9`,
                       q31_10 = `q31/10`
                       )



surveydataset <- dplyr::select(surveydataset,
                        !c(`q31/1`,
                          `q31/2`,
                          `q31/3`,
                          `q31/4`,
                          `q31/5`,
                          `q31/6`,
                          `q31/7`,
                          `q31/8`,
                          `q31/9`,
                          `q31/10`)
)

#q31/1
surveydataset$q31_1 <- factor(surveydataset$q31_1,
                                levels = c(0,1),
                                labels = c('No',
                                           'Yes'))

surveydataset$q31_1 <- factor(surveydataset$q31_1)

attr(surveydataset$q31_1, "var.labels") <- 'What are the water sources for household uses? Small stream'
attr(surveydataset$q31_1,'label') <- 'What are the water sources for household uses? Small stream'



#q31/2
surveydataset$q31_2 <- factor(surveydataset$q31_2,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_2 <- factor(surveydataset$q31_2)

attr(surveydataset$q31_2, "var.labels") <- 'What are the water sources for household uses? Private well'
attr(surveydataset$q31_2,'label') <- 'What are the water sources for household uses? Private well'


#q31/3
surveydataset$q31_3 <- factor(surveydataset$q31_3,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_3 <- factor(surveydataset$q31_3)

attr(surveydataset$q31_3, "var.labels") <- 'What are the water sources for household uses? Public well (not piped)'
attr(surveydataset$q31_3,'label') <- 'What are the water sources for household uses? Public well (not piped)'


#q31/4
surveydataset$q31_4 <- factor(surveydataset$q31_4,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_4 <- factor(surveydataset$q31_4)

attr(surveydataset$q31_4, "var.labels") <- 'What are the water sources for household uses? Public piped water system'
attr(surveydataset$q31_4,'label') <- 'What are the water sources for household uses? Public piped water system'


#q31/5
surveydataset$q31_5 <- factor(surveydataset$q31_5,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_5 <- factor(surveydataset$q31_5)

attr(surveydataset$q31_5, "var.labels") <- 'What are the water sources for household uses? Rainwater harvesting System'
attr(surveydataset$q31_5,'label') <- 'What are the water sources for household uses? Rainwater harvesting System'


#q31/6
surveydataset$q31_6 <- factor(surveydataset$q31_6,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_6 <- factor(surveydataset$q31_6)

attr(surveydataset$q31_6, "var.labels") <- 'What are the water sources for household uses? River'
attr(surveydataset$q31_6,'label') <- 'What are the water sources for household uses? River'


#q31/7
surveydataset$q31_7 <- factor(surveydataset$q31_7,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_7 <- factor(surveydataset$q31_7)

attr(surveydataset$q31_7, "var.labels") <- 'What are the water sources for household uses? Creek'
attr(surveydataset$q31_7,'label') <- 'What are the water sources for household uses? Creek'



#q31/7
surveydataset$q31_8 <- factor(surveydataset$q31_8,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_8 <- factor(surveydataset$q31_8)

attr(surveydataset$q31_8, "var.labels") <- 'What are the water sources for household uses? Lake/Pond (not well)'
attr(surveydataset$q31_8,'label') <- 'What are the water sources for household uses? Lake/Pond (not well)'


#q31/7
surveydataset$q31_9 <- factor(surveydataset$q31_9,
                              levels = c(0,1),
                              labels = c('No',
                                         'Yes'))

surveydataset$q31_9 <- factor(surveydataset$q31_9)

attr(surveydataset$q31_9, "var.labels") <- 'What are the water sources for household uses? Borehole'
attr(surveydataset$q31_9,'label') <- 'What are the water sources for household uses? Borehole'


#remove q31oth and q310
surveydataset <- dplyr::select(surveydataset,
                               !c(
                                  'q31oth',
                                  'q31_10',
                                  'q31',
                                  'noteresil')
)



#q32
surveydataset$q32 <- factor(surveydataset$q32,
                              levels = c(1:8,98,99),
                              labels = c(
                                '0 - 49,999',
                                '50,000 - 99,999',
                                '100,000 - 149,999',
                                '150,000 - 199,999',
                                '200,000 - 249,999',
                                '250,000 - 299,999',
                                '300,000 - 349,999',
                                '350,000 or more',
                                "Don’t know",
                                'Refused'
                                
                                         ))

surveydataset$q32 <- factor(surveydataset$q32)

attr(surveydataset$q32, "var.labels") <- 'What is your approximate total household monthly income, in Guyanese dollar?'
attr(surveydataset$q32,'label') <- 'What is your approximate total household monthly income, in Guyanese dollar?'


surveydataset <- dplyr::select(surveydataset,!c('q33'))
#q331 to q336
surveydataset$q33_1 <- as.numeric(surveydataset$q33_1) 
attr(surveydataset$q33_1, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: Agricultural production (own operation)'
attr(surveydataset$q33_1,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: Agricultural production (own operation)'


#q332
surveydataset$q33_2 <- as.numeric(surveydataset$q33_2) 
attr(surveydataset$q33_2, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: Off-farm agricultural employment (not own operation)'
attr(surveydataset$q33_2,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: Off-farm agricultural employment (not own operation)'


#q333
surveydataset$q33_3 <- as.numeric(surveydataset$q33_3) 
attr(surveydataset$q33_3, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: Non-agricultural employment'
attr(surveydataset$q33_3,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: Non-agricultural employment'


#q334
surveydataset$q33_4 <- as.numeric(surveydataset$q33_4) 
attr(surveydataset$q33_4, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: Non-agricultural businesses'
attr(surveydataset$q33_4,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: Non-agricultural businesses'


#q335
surveydataset$q33_5 <- as.numeric(surveydataset$q33_5) 
attr(surveydataset$q33_5, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: State subsidies'
attr(surveydataset$q33_5,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: State subsidies'


#q336
surveydataset$q33_6 <- as.numeric(surveydataset$q33_6) 
attr(surveydataset$q33_6, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: Remittances'
attr(surveydataset$q33_6,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: Remittances'


#q337
surveydataset$q33_7 <- as.numeric(surveydataset$q33_7) 
attr(surveydataset$q33_7, "var.labels") <- '**In the last month**, what percentage of your total household income came from each of the following: Other'
attr(surveydataset$q33_7,'label') <- '**In the last month**, what percentage of your total household income came from each of the following: Other'



#q341
surveydataset$q34_1 <- as.numeric(surveydataset$q34_1) 
attr(surveydataset$q34_1, "var.labels") <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Food'
attr(surveydataset$q34_1,'label') <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Food'


#q342
surveydataset$q34_2 <- as.numeric(surveydataset$q34_2) 
attr(surveydataset$q34_2, "var.labels") <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Health'
attr(surveydataset$q34_2,'label') <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Health'

#q343
surveydataset$q34_3 <- as.numeric(surveydataset$q34_3) 
attr(surveydataset$q34_3, "var.labels") <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Education'
attr(surveydataset$q34_3,'label') <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Education'

#q344
surveydataset$q34_4 <- as.numeric(surveydataset$q34_4) 
attr(surveydataset$q34_4, "var.labels") <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Housing'
attr(surveydataset$q34_4,'label') <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Housing'


#q345
surveydataset$q34_5 <- as.numeric(surveydataset$q34_5) 
attr(surveydataset$q34_5, "var.labels") <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Transportation'
attr(surveydataset$q34_5,'label') <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Transportation'


#q346
surveydataset$q34_6 <- as.numeric(surveydataset$q34_6) 
attr(surveydataset$q34_6, "var.labels") <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Others'
attr(surveydataset$q34_6,'label') <- '**In the last month**, what percentage of your total household income did you spend on each of the following:Others'


#q35
surveydataset$q35 <- factor(surveydataset$q35,
                            levels = c(0,1,98,99),
                            labels = c(
                              'No',
                              'Yes',
                              "Don't know",
                              'No answer'
                              
                            ))
surveydataset$q35 <- factor(surveydataset$q35)

attr(surveydataset$q35, "var.labels") <- 'In the last **twelve months**, did the household own or have access to any land for agricultural production (crop or livestock) or for harvesting of forest?'
attr(surveydataset$q35,'label') <- 'In the last **twelve months**, did the household own or have access to any land for agricultural production (crop or livestock) or for harvesting of forest?'



#q50

surveydataset[surveydataset$q35 != 'Yes',c('q50')] <- '97'
                                           
surveydataset[surveydataset$q35 != 'Yes',c('q36_1',
                                           'q36_1a',
                                           'q36_1aoth',
                                           'q36_2',
                                           'q36_2a',
                                           'q36_2aoth',
                                           'q36_3',
                                           'q36_3a',
                                           'q36_3aoth',
                                           'q36_4',
                                           'q36_4a',
                                           'q36_4aoth',
                                           'q36_5',
                                           'q36_5a',
                                           'q36_5aoth')] <- '-3'


surveydataset$q50 <- factor(surveydataset$q50,
                            levels = c(1:6,97,98,99),
                            labels = c(
                              'With land title',
                              'Without land title',
                              'Rented',
                              'Leased',
                              'Community-owned',
                              'Other', 
                              'Not applicable',
                              "Don’t know",
                              'No answer'
                              ))
surveydataset$q50 <- factor(surveydataset$q50)

attr(surveydataset$q50, "var.labels") <- 'What is the ownership status of the **main plot of land** used  for agricultural or forestry production?'
attr(surveydataset$q50,'label') <- 'What is the ownership status of the **main plot of land** used  for agricultural or forestry production?'

surveydataset <- dplyr::select(surveydataset,!c('note2_1',
                                                'note2_11',
                                                'note2_12',
                                                'note2_13',
                                                'note2_14',
                                                'note2_15',
                                                'note2_16',
                                                'note2_17',
                                                'note2_18',
                                                'note2_19',
                                                'notefood',
                                                'notefood1',
                                                'notwom',
                                                'noteq64',
                                                'noteq641'))

#q40
surveydataset <- mutate(surveydataset,
                        q40first = as.character(purrr::map(strsplit(surveydataset$q40,' '),1)),
                        q40second = as.character(purrr::map(strsplit(surveydataset$q40,' '),2)),
                        .keep = 'unused',
                        .after = 'q40')


surveydataset <- dplyr::select(surveydataset, !c('q40/1','q40/2','q40/3','q40/4', 'q40/5', 'q40/6','q40/7','q40/8',
'q40/9', 'q40/10','q40/11','q40/12','q40/13','q40/14','q40/15','q40/16',
'q40/17','q40/18','q40/19','q40/20', 'q40/100','q40'))

surveydataset[surveydataset$q35 != 'Yes',c('q40first','q40second')] <- '97'

#check

for(i in 1:nrow(surveydataset)){
  if(surveydataset$q40first[i] != '97'){
  surveydataset$q40first[i] <- surveydataset[i,paste(c('p',surveydataset$q40first[i]),collapse = '')]
  }
  
  if(surveydataset$q40second[i] != '97' & surveydataset$q40second[i] != 'NULL'){
    surveydataset$q40second[i] <- surveydataset[i,paste(c('p',surveydataset$q40second[i]),collapse = '')]
  }
  
}

surveydataset$q40first <- as.character(surveydataset$q40first)
surveydataset$q40second <- as.character(surveydataset$q40second)
surveydataset[surveydataset$q40second == 'NULL','q40second'] <- 'Not selected'

levelsq40first <- names(table(surveydataset$q40first))
labelsq40first <- c('Not Applicable',levelsq40first[2:32])

surveydataset$q40first <- factor(surveydataset$q40first,
                                 levels = levelsq40first,
                                 labels = unique(labelsq40first)[1:18])

levelsq40second <- names(table(surveydataset$q40second))
labelsq40second <- c('Not Applicable',levelsq40second[2:7])
surveydataset$q40second <- factor(surveydataset$q40second,
                                  levels = levelsq40second,
                                  labels = labelsq40second)



#

# surveydataset <- mutate(surveydataset,
#                         q40_1 = `q40/1`,
#                         q40_2 = `q40/2`,
#                         q40_3 = `q40/3`,
#                         q40_4 = `q40/4`,
#                         q40_5 = `q40/5`,
#                         q40_6 = `q40/6`,
#                         q40_7 = `q40/7`,
#                         q40_8 = `q40/8`,
#                         q40_9 = `q40/9`,
#                         q40_10 = `q40/10`,
#                         q40_11 = `q40/11`,
#                         q40_12 = `q40/12`,
#                         q40_13 = `q40/13`,
#                         q40_14 = `q40/14`,
#                         q40_15 = `q40/15`,
#                         q40_16 = `q40/16`,
#                         q40_17 = `q40/17`,
#                         q40_18 = `q40/18`,
#                         q40_19 = `q40/19`,
#                         q40_20 = `q40/20`,
#                         q40_100 = `q40/100`,
#                         .keep = 'unused',
#                         .after = 'q40' )
# 
# surveydataset[surveydataset$q35 != 'Yes',c('q40_1',
#                                            'q40_2',
#                                            'q40_3',
#                                            'q40_4',
#                                            'q40_5',
#                                            'q40_6',
#                                            'q40_7',
#                                            'q40_8',
#                                            'q40_9',
#                                            'q40_10',
#                                            'q40_11',
#                                            'q40_12',
#                                            'q40_13',
#                                            'q40_14',
#                                            'q40_15',
#                                            'q40_16',
#                                            'q40_17',
#                                            'q40_18',
#                                            'q40_19',
#                                            'q40_20',
#                                            'q40_100',
#                                            'q36_1',
#                                            'q36_1a',
#                                            'q36_1aoth',
#                                            'q36_2',
#                                            'q36_2a',
#                                            'q36_2aoth',
#                                            'q36_3',
#                                            'q36_3a',
#                                            'q36_3aoth',
#                                            'q36_4',
#                                            'q36_4a',
#                                            'q36_4aoth',
#                                            'q36_5',
#                                            'q36_5a',
#                                            'q36_5aoth'
#                                            )] <- '97'
# 
# 
# #finding the vars in q40 that have no reference to a person and drop
# 
# for(var in c('q40_1','q40_2','q40_3','q40_4','q40_5','q40_6','q40_7','q40_8','q40_9',
#              'q40_10','q40_11','q40_12','q40_13','q40_14','q40_15','q40_16','q40_17','q40_18',
#              'q40_19','q40_20','q40_100')) {
#   if(paste(names(table(surveydataset[,var])),collapse  = '') == '097'){
#     surveydataset <- dplyr::select(surveydataset,!c(var))
#   }
# }

#q361
surveydataset$q36_1 <- as.numeric(surveydataset$q36_1)

attr(surveydataset$q36_1, "var.labels") <- 'Area (Acre)'
attr(surveydataset$q36_1,'label') <- 'Area (Acre)'



#q362
options(scipen=999)
surveydataset$q36_1a <- factor(surveydataset$q36_1a,
                            levels = c(1:6),
                            labels = c(
                              'Square rod',
                              'Acre',
                              'Hectare',
                              'Square meter',
                              'Square feet',
                              'Other'
                              
                            ))
surveydataset$q36_1a <- factor(surveydataset$q36_1a)

attr(surveydataset$q36_1a, "var.labels") <- 'Unit for Area'
attr(surveydataset$q36_1a,'label') <- 'Unit for Area'

for(i in 1:nrow(surveydataset)){
  if(surveydataset$q36_1a[i] == 'Square rod' & is.na(surveydataset$q36_1a[i]) ==F ){
    surveydataset$q36_1[i] <- surveydataset$q36_1[i] * 0.00625
  }
  
  if(surveydataset$q36_1a[i] == 'Square feet' & is.na(surveydataset$q36_1a[i]) ==F){
    surveydataset$q36_1[i] <- surveydataset$q36_1[i] * 1/43560
  }
  
}




#skipping some stuff

##q37
names(surveydataset) <-  str_replace(colnames(surveydataset),'/','.')
surveydataset[surveydataset$q36_1 <= 0 ,paste('q37', 1:78,sep = '.')] <- '97'


#for(var in paste('q37', 1:78,sep = '_')){
  surveydataset <- mutate_at(surveydataset,
                             paste('q37', 1:78,sep = '.'),
                                      factor,
                                         levels = c(0,1,97),
                                         labels = c('No','Yes','Not Applicable')
                             
                          )
  
#q37b
  surveydataset[is.na(surveydataset$q37b) == T, 'q37b'] <- '97'
  surveydataset[surveydataset$q37b == 'cauliflower', 'q37b'] <- '1'
  surveydataset$q37b <- factor(surveydataset$q37b,
                               levels = c(1,97),
                               labels = c('Cauliflower','Not Applicable'))

  
  

  cropvarnames <- grep("q37", names(surveydataset), value = TRUE)[-c(1,80,81,82)]
  cropnames <- c("African Palm", "Avocado", "Banana", "Bean / Bora", "Beet", "Bilimbi", "Black-Eyed Pea", "Boulanger / Eggplant", "Breadfruit", "Broccoli", "Cabbage", "Callaloo", "Carambola", "Carrot", "Cashew", "Cassava (Bitter)", "Cassava (Sweet)", "Celery", "Chard", "Cherry", "Cocoa", "Coconut", "Coffee", "Corilla", "Corn", "Corn (Sweet)", "Cucumber", "Dasheen", "Eddoe", "Eschallot", "Ginger", "Grapefruit", "Guava", "Lemon", "Lettuce", "Lime", "Mamey", "Mango", "Minica", "Mustard", "Ochro", "Onion", "Orange", "Pak Choi", "Papaya / Papaw", "Passion Fruit", "Peach", "Peanut", "Pear", "Pepper", "Pepper (Hot)", "Pepper (Sweet)", "Pepper (Wiri Wiri)", "Permanent Pasture", "Pineapple", "Plantain", "Pumpkin", "Red Beans", "Rice", "Saeme", "Sapodilla", "Scallion", "Sorghum", "Sorrel", "Sour Sop", "Squash", "Sugar Cane", "Sweet Potato", "Tangerine", "Thyme (Broad leaf)", "Thyme (Fine leaf)", "Tomato", "Watermelon", "Yam", "Other 1", "Other 2", "Other 3", "None")
  
  for(i in 1:78){
   
    
    attr(surveydataset[[cropvarnames[i]]], "var.labels") <- paste('What crops were produced by the household during the last twelve month:',cropnames[i],sep = ' ')
  
    attr(surveydataset[[cropvarnames[i]]], "label") <- paste('What crops were produced by the household during the last twelve month:',cropnames[i],sep = ' ')
    
  }
  
  attr(surveydataset$q36_1, "var.labels") <- 'Area (Acre)'
  attr(surveydataset$q36_1,'label') <- 'Area (Acre)'
#numcrops 
  


#q39
surveydataset[surveydataset$q37 == 78 | is.na(surveydataset$q37) == T ,grep("q39", names(surveydataset), value = TRUE)[-8]] <- '97'  
 
inputvarnames <- grep("q39", names(surveydataset), value = TRUE)[c(-1,-8)]
inputnames <- c("Natural (organic) fertilizers", "Synthetically produced chemical fertilizers", "Natural (organic) pesticides", "Synthetically produced pesticides", "Other", "None")


for(i in 1:6){
  surveydataset[[inputvarnames[i]]] <- factor(surveydataset[[inputvarnames[i]]],
                                              levels = c(0,1,97),
                                              labels = c(
                                                'No',
                                                'Yes',
                                                'Not Applicable'
                                              ))
  
  attr(surveydataset[[inputvarnames[i]]], "var.labels") <- paste('What type of agricultural inputs do you use for crops:',inputnames[i],sep = ' ')
  
  attr(surveydataset[[inputvarnames[i]]], "label") <- paste('What type of agricultural inputs do you use for crops:',inputnames[i],sep = ' ')
  
}  

  
#q41
animalvarnames <- grep("q41.", names(surveydataset), value = TRUE)[1:8]
animalnames <- c("Cattle", "Equine (horse, mule, donkey etc.)", "Sheep", "Goat", "Pigs", "Poultry (chicken, duck, turkey etc.)", "Other animals", "None")



for(i in 1:8){
  surveydataset[[animalvarnames[i]]] <- factor(surveydataset[[animalvarnames[i]]],
                                              levels = c(0,1),
                                              labels = c(
                                                'No',
                                                'Yes'
                                              ))
  
  attr(surveydataset[[animalvarnames[i]]], "var.labels") <- paste('Does your household raise or own any of the following livestock?:',animalnames[i],sep = ' ')
  
  attr(surveydataset[[animalvarnames[i]]], "label") <- paste('Does your household raise or own any of the following livestock?:',animalnames[i],sep = ' ')
  
}  


#Q41 count animals
"q41_1", "q41_2", "q41_3", "q41_4", "q41_5", "q41_6", "q41_7"
surveydataset$q41_4 <- as.character(surveydataset$q41_4)

animalvarnames <- grep("q41.", names(surveydataset), value = TRUE)[9:15]
animalnames <- c("Cattle", "Equine (horse, mule, donkey etc.)", "Sheep", "Goat", "Pigs", "Poultry (chicken, duck, turkey etc.)", "Other animals", "None")


for(i in 1:7){
 surveydataset[surveydataset[[paste('q41.',i,sep = '')]] != 'Yes',paste('q41_',i,sep = '')] <- '-3' 

 # surveydataset[[animalvarnames[i]]] <- factor(surveydataset[[animalvarnames[i]]],
 #                                              levels = c(0,1,),
 #                                              labels = c(
 #                                                'No',
 #                                                'Yes'
 #                                              ))
 
 attr(surveydataset[[animalvarnames[i]]], "var.labels") <- paste('How many', animalnames[i], 'does your household have as of today?',sep = ' ')
 
 attr(surveydataset[[animalvarnames[i]]], "label") <- paste('How many', animalnames[i], 'does your household have as of today?',sep = ' ')
 
 
 }
 

#q42


for(i in 1:nrow(surveydataset)){
if(sum(surveydataset[i,grep("q37.", names(surveydataset), value = TRUE)[c(-78,-79,-80,-81)]] == 'Yes') == 0){
  surveydataset$q42[i] <- '97'
}
}

surveydataset$q42 <- factor(surveydataset$q42,
                            levels = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L,97),
                            labels = c("Small stream", "Private well", "Public well (not piped)", "Public piped water system", "Rainwater harvesting System", "River", "Creek", "Lake/Pond (not well)", "Borehole", "Other","Not Applicable")
)

attr(surveydataset$q42, "var.labels") <- 'What was the primary source of water used for crop production or for livestock rearing during the last twelve months?'

attr(surveydataset$q42, "label") <- 'What was the primary source of water used for crop production or for livestock rearing during the last twelve months?'





#q43
for(i in 1:nrow(surveydataset)){
  if(sum(surveydataset[i,grep("q37.", names(surveydataset), value = TRUE)[c(-78,-79,-80,-81)]] == 'Yes') == 0){
    surveydataset$q43_1[i] <- '-3'
    surveydataset$q43_2[i] <- '-3'
    surveydataset$q43_3[i] <- '-3'
    surveydataset$q43_4[i] <- '-3'
    surveydataset$q43_5[i] <- '-3'
    surveydataset$q43_6[i] <- '-3'
    }
}


labels <- c("Sale", "Household consumption", "Seed", "Barter", "Animal feed", "Other uses")
varnames <- grep("q43.", names(surveydataset), value = TRUE)[-7]

for(i in 1:6){
attr(surveydataset[[varnames[i]]], "var.labels") <- paste('Focusing on crops alone within the last 12 months, what percentage of your total production went to each of the following:',labels[i],sep = '')
attr(surveydataset[[varnames[i]]], "label") <- paste('Focusing on crops alone within the last 12 months, what percentage of your total production went to each of the following:',labels[i],sep = '')
}



#q45


#sum(surveydataset[i,grep("q37.", names(surveydataset), value = TRUE)[c(-78,-79,-80,-81)]] == 'Yes')
#sum(surveydataset[i,grep("q41.", names(surveydataset), value = TRUE)[1:7]] == 'Yes')

for(i in 1:nrow(surveydataset)){
  if(sum(surveydataset[i,grep("q37.", names(surveydataset), value = TRUE)[c(-78,-79,-80,-81)]] == 'Yes') == 0 & sum(surveydataset[i,grep("q41.", names(surveydataset), value = TRUE)[1:7]] == 'Yes') == 0){
    surveydataset$q45[i] <- '97'
  }
}

surveydataset$q45 <- factor(surveydataset$q45,
                            levels = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L,97),
                            labels = c("Private individuals/ neighbours", "Sell at a marketplace", "Traders/middlemen", "Farmer/Producer Organizations", "Agro-Industry", "Other producers", "Other", "Do not sell agrcultural production", 'Not Applicable')
)

attr(surveydataset$q45, "var.labels") <- 'To whom do you sell to most of the agricultural production?'
attr(surveydataset$q45, "label") <- 'To whom do you sell to most of the agricultural production?'


#q46

surveydataset$q46 <- factor(surveydataset$q46,
                            levels = c(0L, 1L, 97L, 98L, 99L),
                            labels = c("No", "Yes", "Not applicable", "Don't know", "No answer")

)

attr(surveydataset$q46, "var.labels") <- 'Have you experienced a loss of your cultivated plots, animals or harvest in the **last 3-6 years**?'
attr(surveydataset$q46, "label") <- 'Have you experienced a loss of your cultivated plots, animals or harvest in the **last 3-6 years**?'


#q47
surveydataset[surveydataset$q46 != 'Yes',grep("q47.", names(surveydataset), value = TRUE)] <- '97'

for(var in grep("q47.", names(surveydataset), value = TRUE)[-9]){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0,1,97),
                                 labels = c('No','Yes','Not Applicable')

)
}


labels <- c("Lack or irregularity of rainfall", "Flooding, excess of water or rain", "Well runs dry", "Plagues and pests", "Stray/ Animals", "Fire", "Theft", "Other")
varnames <- grep("q47.", names(surveydataset), value = TRUE)[-9]

for(i in 1:8){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('What were the causes of this loss',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <- paste('What were the causes of this loss',labels[i],sep = '')
}




#q48
for(var in grep("q48.", names(surveydataset), value = TRUE)[-10]){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0,1),
                                 labels = c('No','Yes')
                                 
  )
}


labels <- c("Water", "Timber", "Firewood", "Wildmeat", "Fish", "Medical plants", "Craft materials", "Other", "None")

varnames <- grep("q48.", names(surveydataset), value = TRUE)[-10]

for(i in 1:9){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('What products and/or services did the household use from the forest area in the **last twelve months**?',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <-  paste('What products and/or services did the household use from the forest area in the **last twelve months**?',labels[i],sep = '')
}



#q49

for(i in 1:nrow(surveydataset)){
  if(sum(surveydataset[i,grep("q41.", names(surveydataset), value = TRUE)[1:7]] == 'Yes') == 0 & surveydataset$q41.8[i] == 'Yes'){
    surveydataset$q49_1[i] <- '97'
    surveydataset$q49_2[i] <- '97'
    surveydataset$q49_3[i] <- '97'
    surveydataset$q49_4[i] <- '97'
    surveydataset$q49_5[i] <- '97'
  }
}


for(var in grep("q49_", names(surveydataset), value = TRUE)){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0,1,97),
                                 labels = c('No','Yes','Not Applicable')
                                 
  )
}


labels <- c("Rotational grazing", "Improved grass species for feed", "Living fences", "Trees", "Conservation of streams")

varnames <- grep("q49_", names(surveydataset), value = TRUE)

for(i in 1:5){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('In the area used as pastureland, have you introduced any of the following items items?:',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <-  paste('In the area used as pastureland, have you introduced any of the following items items?:',labels[i],sep = '')
}



#q52
surveydataset$q52 <- factor(surveydataset$q52,
                            levels = c(0L, 1L, 98L, 99L),
                            labels = c("No", "Yes", "Don't know", "No answer")

)

attr(surveydataset$q52, "label") <-  'Are there organizations that focus on women’s empowerment in your region, particularly for agriculture?'
attr(surveydataset$q52, "var.labels") <-  'Are there organizations that focus on women’s empowerment in your region, particularly for agriculture?'



#q53
surveydataset[surveydataset$q52 != 'Yes','q53'] <- '97'


surveydataset$q53 <- factor(surveydataset$q53,
                            levels = c(0L, 1L, 98L, 99L,97),
                            labels = c("No", "Yes", "Don't know", "No answer",'Not Applicable')
                            
)

attr(surveydataset$q53, "label") <-  'Does any member of your household belong to one of these organizations?'
attr(surveydataset$q53, "var.labels") <-  'Does any member of your household belong to one of these organizations?'




#q54 to q61
varnames <- paste('q',54:61,sep = '')

for(var in varnames){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0L, 1L, 98L, 99L),
                                 labels = c("No", "Yes", "Don't know", "No answer")


  )
}


labels <- c("you were worried that you would not have enough food to eat because of a lack of money or other resources?", "you were unable to eat healthy and nutritious food because of a lack of money or other resources?", "you ate only a few kinds of foods because of a lack of money or other resources?", "you had to skip a meal because there was not enough money or other resources to get food?", "you ate less than you thought you should because of a lack of money or other resources?", "there was no food to eat of any kind in your house because of lack of resources to get food?", "you went to sleep at night hungry because there was not enough food?", "you went a whole day and night without eating anything at all because there was not enough food?")


for(i in 1:8){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('During the **last twelve months** was there a time when:',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <-  paste('During the **last twelve months** was there a time when:',labels[i],sep = '')
}



#q62
varnames <- paste('q62.',1:12,sep = '')

for(var in varnames){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0L, 1L),
                                 labels = c("No", "Yes")
                                 
                                 
  )
}


labels <- c("Cereals", "Vegetables", "Tuber (roots)", "Fruits", "Meat", "Eggs", "Fish", "Legumes", "Oil and Seeds", "Milk", "Sugar", "Other")



for(i in 1:12){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('Which foods does your household normally consume on a daily basis?:',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <-  paste('Which foods does your household normally consume on a daily basis?:',labels[i],sep = '')
}



#q63
surveydataset$q63 <- factor(surveydataset$q63,
                            levels = c(0,1),
                            labels = c('No','Yes'))


attr(surveydataset$q63, "var.labels") <- 'Is there a woman age 15-49 in the household who can answer a few nutrition questions?' 
attr(surveydataset$q63, "label") <-  'Is there a woman age 15-49 in the household who can answer a few nutrition questions?' 





#q51

surveydataset <- mutate(surveydataset,
                        q51_8 = Save_or_use_savings,
                        .keep = 'unused',
                        .after = 'q51_7')

for(i in 1:nrow(surveydataset)){
  if(surveydataset$q63[i] != 'Yes'){
    surveydataset$q51_1[i] <- '97'
    surveydataset$q51_2[i] <- '97'
    surveydataset$q51_3[i] <- '97'
    surveydataset$q51_4[i] <- '97'
    surveydataset$q51_5[i] <- '97'
    surveydataset$q51_6[i] <- '97'
    surveydataset$q51_7[i] <- '97'
    surveydataset$q51_8[i] <- '97'
  }
}

varnames <- paste('q51_',1:8,sep = '')

for(var in varnames){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0,1,97),
                                 labels = c('No','Yes','Not Applicable')
                                 
  )
}


labels <- c("How to use/cultivate the land", "Participating in agricultural training", "Use/purchase of agricultural inputs", "Use/purchase of agricultural technologies", "Health care", "How to use water for irrigation", "Acquire loans", "Save or use savings")



for(i in 1:8){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('In your opinion and thinking of your own situation, do you have decision making power over each of the following?:',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <-  paste('In your opinion and thinking of your own situation, do you have decision making power over each of the following?:',labels[i],sep = '')
}





#q65-76
varnames <- paste('q',65:76,sep = '')

for(var in varnames){
for(i in 1:nrow(surveydataset)){
  if(surveydataset$q63[i] != 'Yes'){
    surveydataset[[var]][i] <- '97'
  }
}
}
  


for(var in varnames){
  surveydataset[[var]] <- factor(surveydataset[[var]],
                                 levels = c(0L, 1L, 98L, 99L,97),

                                 labels = c("No", "Yes", "Don't know", "No answer",'Not Applicable')

                                 
  )
}


labels <- c("Any food made from grains and any white roots or tuber or plantains", "Any beans or peas", "Any nuts or seeds", "Any milk or milk products", "Any meat (including wild meat), poultry and fish products", "Any eggs", "Any dark green leafy vegetables", "Any vitamin A rich fruits, vegetables and roots", "Any other fruits:", "Any fried and salty food:", "Any sweet food:", "Any sweet beverages:")




for(i in 1:12){
  attr(surveydataset[[varnames[i]]], "var.labels") <- paste('Please mention all foods for which you consumed **more than a full tablespoon (15 mg) yesterday**:',labels[i],sep = '')
  attr(surveydataset[[varnames[i]]], "label") <-  paste('Please mention all foods for which you consumed **more than a full tablespoon (15 mg) yesterday**:',labels[i],sep = '')
}


#q06001
surveydataset$q0_6_001 <- factor(surveydataset$q0_6_001,
                                 levels = c(1,2),
                                 labels = c("Acceptable", "Too difficult")
)


#q07
surveydataset$q0_7 <- factor(surveydataset$q0_7,
                                 levels = c(1,2),
                                 labels = c("Acceptable", "Too long")
)


#q08


#}14
# varlabel <- c(
#   'start',
#   'end',
#   'today',
#   'District',
#   'Community',
#   'Mode',
#   'Telephone Numbers',
#   'Household ID',
#   'Interview Mode',
#   'Outcome of interview attempt',
#   'How many members does your household have?',
#   'Name of Person One',
#   'Name of Person Two',
#   'Name of Person Three',
#   'Name of Person Four',
#   'Name of Person Five',
#   'Name of Person Six',
#   'Name of Person Seven',
#   'Name of Person Eight',
#   'Name of Person Nine',
#   'Name of Person Ten',
#   'Name of Person Eleven',
#   'Name of Person Twelve',
#   'Name of Person Thirteen',
#   'Name of Person Fourteen',
#   'Name of Person Fifteen',
#   'Name of Person Sixteen',
#   'Name of Person Seventeen',
#   'Name of Person Eighteen',
#   'Name of Person Nineteen',
#   'Which of the following best describes your household?',
#   'Which of the following best describes how your household is managed?',
#   'Have one or more household members participated in the development or updating of a community development plan, village investment plan or similar types of plans **in the last 12 months?**',
#   'Were actions to reduce the impacts from climate events (such as floods, salt water intrusion or periods with unusual high temperatures) considered in this plan, in which you participated?',
#   'Is at least one household member participating in a community or producer group that has an adopted business plan?', 
#   'Has the business plan contributed to an increase in the household incomes in the last twelve months?',
#   'Does the household use the same or an increased number of crop varieties, animal species and wild species as food or income generating source compared to 12 months ago?',
#   'Has the household used climate-smart production practices or techniques, in at least 1/4 of its cultivated land **within the last 12 months?**',
#   'When were these practices first adopted by the household?',
#   'Has the household experienced any extreme climate events the last 12 months?',
#   'What was the event about?',
#   'How severe was the loss of production of food and income due to this event? How much of the production and or income was lost?',
#   'Did the household experience water scarcity **for household needs** the last 12 months?',
#   'Has the household experienced water scarcity **for production needs** the last 12 months?',
#   'Does the household have access to a renewable energy source for household needs?',
#   'Does the household or the producer group it works with have access to a renewable energy source for production, storage and processing needs?',
#   'In the last 12 months, has the household used the internet to access information on markets (prices, buyers, demand for products etc.), weather forecast and early warnings or advice on climate smart farming practices?',
#   'Did you use this information to make decisions on crops and varieties to cultivate and time of planting or other important decisions in your farming activities?',
#   'If a climate disaster, such as a flood or a long dry and hot period, happened within the next 6 months, does your household have or have access to resources (for example: cash savings, seeds, stored food, etc.) to cope?',
#   'Have your household or community experienced that agricultural land is affected by salinity (sea/salt water intrusion)',
#   'Forest, or tree species, that is kept to protect the water source: Are there any mechanisms in place to protect the water source?',
#   'Grazing that is kept unused and being restored or reforested: Are there any mechanisms in place to protect the water source?',
#   'Fence: Are there any mechanisms in place to protect the water source?',
#   'What are the water sources for household uses? Small stream',
#   'What are the water sources for household uses? Private well',
#   'What are the water sources for household uses? Public well (not piped)',
#   'What are the water sources for household uses? Public piped water system',
#   'What are the water sources for household uses? Rainwater harvesting System',
#   'What are the water sources for household uses? River',
#   'What are the water sources for household uses? Creek',
#   'What are the water sources for household uses? Lake/Pond (not well)',
#   'What is your approximate total household monthly income, in Guyanese dollar?'
# )
# 
# attr(surveydataset, "var.labels") <- varlabel






usethis::use_data(surveydataset, overwrite = TRUE)




#str_replace(colnames(surveydataset),'/','_')
