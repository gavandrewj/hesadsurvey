#' variablecompare UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom shiny.semantic flow_layout segment
#' @importFrom semantic.dashboard box
#' @importFrom plotly renderPlotly plotlyOutput plot_ly layout
#' @importFrom shinycssloaders withSpinner
mod_variablecompare_ui <- function(id){
  ns <- NS(id)
  tagList(
  semantic.dashboard::column(width = 16,
    segment(
  shiny.semantic::dropdown_input(ns('selectdataset'),
                                   c('SurveyDataset',
                                     'HouseholdMembers',
                                     'HouseholdDemographics',
                                     'Crops'),
                                   value = 'SurveyDataset'),     

 uiOutput(ns("pickdatasetnames"))
        )
 ),

  semantic.dashboard::column(width = 8,
 
            semantic.dashboard::box(tableOutput(ns('rawdatasummary')),
                         title = 'Raw Data Variable',
                         color = 'blue',
                         ribbon = TRUE,
                         width = 8)),
 
 semantic.dashboard::column(width = 8,
            semantic.dashboard::box(tableOutput(ns('cleandatasummary')),
                         title = 'Clean Data Variable',
                         color = 'red',
                         ribbon = TRUE,
                         width = 8)),
 
  
  
# 
#  segment(
# 
# 
  semantic.dashboard::column(width = 8,
            semantic.dashboard::box(plotlyOutput(ns('rawdatachart')),
                         title = 'Raw Var Chart',
                         color = 'blue',
                         ribbon = TRUE,
                         width = 8)),

  semantic.dashboard::column(width = 8,
            semantic.dashboard::box(plotlyOutput(ns('cleandatachart')),
                         title = 'Clean Var Chart',
                         color = 'red',
                         ribbon = TRUE,
                         width = 8)),


 semantic.dashboard::box(htmlOutput(ns('changes')),
                         title = 'Changes made to variable',
                         color = 'yellow',
                         ribbon = TRUE,
                         width = 16)


    
  
  
 
  ) 
}
    
#' variablecompare Server Functions
#'
#' @noRd 
mod_variablecompare_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    datachoice <- reactive({
      if(input[['selectdataset']] == 'SurveyDataset'){
        c('surveydataset','rawsurveydata')
      }
    })
    
    
    output$pickdatasetnames <- renderUI({
      #req(input[['selectdataset']])
      value <- isolate(input[['selectvar']])
      
      tagList(
      shiny.semantic::dropdown_input(ns('selectvar'),
                                     names(get(datachoice()[1])),
                                     value = 'q0_0')
      )
    })
    
    
    
    
    
    output$cleandatasummary <- renderTable({
      table_one <- arsenal::tableby( arsenal::formulize(x = input[['selectvar']]),
                                     data = get(datachoice()[1]),
                                     control = arsenal::tableby.control(
                                       test = FALSE)
      )
      
      
      as.data.frame(summary(table_one,text = TRUE), text = "html")  
    }, sanitize.text.function = function(x) x)
    
    
    
    output$rawdatasummary <- renderTable({
      table_one <- arsenal::tableby( arsenal::formulize(x = input[['selectvar']]),
                                     data = get(datachoice()[2]),
                                     control = arsenal::tableby.control(
                                       test = FALSE)
      )
      
      
      as.data.frame(summary(table_one,text = TRUE), text = "html") 
    }, sanitize.text.function = function(x) x)
    
    
    output$cleandatachart <- renderPlotly({
      plot_ly(get(datachoice()[1]),
              x = ~get(input[['selectvar']]),
              color = 'red'
              ) %>% 
        layout(xaxis = list(
          title = input[['selectvar']]
          )
              )
    })
    
    
    output$rawdatachart <- renderPlotly({
      plot_ly(get(datachoice()[2]),x = ~get(input[['selectvar']])) %>% 
        layout(xaxis = list(
          title = input[['selectvar']]
        )
        )
    })
    
    
    output$changes <- renderPrint({
      HTML(changesinfo[changesinfo$varname == input[['selectvar']],]$changes)
    })
    
    
    
    
  })
}
    
## To be copied in the UI
# mod_variablecompare_ui("variablecompare_ui_1")
    
## To be copied in the server
# mod_variablecompare_server("variablecompare_ui_1")
