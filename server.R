###################
# server.R
# 
# For all your server needs 
###################
library(shinydashboard)

source('functions.R', local = T)


server <- function(input, output, session) {
  
  histPlot_df <- eventReactive(
    input$submit,
    {
      result <- runsql(input$sql_code)
      print(result)
      result
      
    }
  )
  
  output$sql_result <- renderTable({
    histPlot_df()
  })
  
}
