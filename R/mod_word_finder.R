#' word_finder UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#' @import plotly
#' @import delgosha
#' @importFrom shiny NS tagList 
mod_word_finder_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    
    fluidRow(
      textInput(ns('words'),
                'یک کلمه را وارد کنید:',
                value = 'ایران'),
      plotlyOutput(ns('word_count_plot'),width = "800px", height = "500px")
    )
    
  )
}
    
#' word_finder Server Function
#'
#' @noRd 
mod_word_finder_server <- function(input, output, session){
  ns <- session$ns
  
  word_count_plot <- reactive({
    word_counts %>% 
      add_count(century,name = 'cen_count') %>% 
      filter(word == input$words[1]) %>% 
      group_by(century) %>% 
      summarise(n_repeat = sum(n),
                mean_repeat    = sum(n)/mean(cen_count)) %>% 
      ungroup() 
    
  })
 
  output$word_count_plot <- renderPlotly({
    
    plt <- word_count_plot() %>% 
      ggplot(aes(century,n_repeat)) +
      geom_line()+
      geom_point() + 
      labs(title = 'شاهنامه در گذر زمان') +
      theme_farsh_fa()
    
    
    plt %>% 
      ggplotly()
  })
  
  
  
}
    
## To be copied in the UI
# mod_word_finder_ui("word_finder_ui_1")
    
## To be copied in the server
# callModule(mod_word_finder_server, "word_finder_ui_1")
 
