#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    
    # Your application UI logic 
    semantic.dashboard::dashboardPage(
      title = 'This is my Page title',
      
      
      header = semantic.dashboard::dashboardHeader(),
      
      
      sidebar = semantic.dashboard::dashboardSidebar(size = "wide",
                                                     semantic.dashboard::sidebarMenu(
                                                       semantic.dashboard::menuItem(text = "Data", tabName = "datafile", icon = icon("table")),
                                                       semantic.dashboard::menuItem(text = 'Variable Comparison',tabName = 'varcom',icon = icon('table'))
                                                       
                                                     )
      ),                                                             
      
      
      
      body = semantic.dashboard::dashboardBody(title = "Basic Dashboard",
                                               semantic.dashboard::tab_items(
                                                 
                                                 semantic.dashboard::tab_item(tabName = 'datafile',
                                                                              mod_data_ui("data_ui_1")
                                                 ),
                                                 
                                                 semantic.dashboard::tab_item(tabName = 'varcom',
                                                                              mod_variablecompare_ui("variablecompare_ui_1")
                                                 )
                                               )
      ))
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'hesadsurvey'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

