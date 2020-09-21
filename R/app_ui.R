#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#' @import bs4Dash
#' @import bootstraplib
app_ui <- function(request) {
  bs_theme_new(version = "4+3", bootswatch = NULL)
  bs_theme_base_colors(bg = "salmon", fg = "white")
  
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
     # fluidPage(
     #   bootstrap(),
     #   h1("naghme",style = "direction:rtl")
     # )
    
    body <- bs4DashBody(
      bs4TabItems(
        bs4TabItem(
          tabName = "item1",
          fluidRow(
            mod_word_finder_ui("word_finder_ui_1")
          )
        )

    )
      ),
     bs4DashPage(
      old_school = FALSE,
      sidebar_min = TRUE,
      sidebar_collapsed = TRUE,
      controlbar_collapsed = TRUE,
      controlbar_overlay = TRUE,
      title = "Basic Dashboard",
      navbar = bs4DashNavbar(),
      sidebar = bs4DashSidebar(),
      controlbar = bs4DashControlbar(),
      footer = bs4DashFooter(),
      body =  bs4DashBody()
    )

    
    
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
      app_title = 'naghme'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

