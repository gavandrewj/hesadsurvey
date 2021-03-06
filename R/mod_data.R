#' data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny.semantic::semantic_DTOutput((ns('table')))
  )
}
    
#' data Server Functions
#'
#' @noRd 
mod_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    surveydataset <- surveydataset
    
    
    
    
    output$table <- DT::renderDataTable({shiny.semantic::semantic_DT(surveydataset,
                                                                     filter = c("top")
    )
    })
  })
}
    
## To be copied in the UI
# mod_data_ui("data_ui_1")
    
## To be copied in the server
# mod_data_server("data_ui_1")
