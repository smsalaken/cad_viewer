###################
# server.R
# 
# For all your server needs 
###################
library(shinydashboard)

source('functions.R', local = T)


server <- function(input, output, session) {
  
  queryDT <- eventReactive(
    input$submit,
    {
      result <- runsql(input$sql_code)
      print(result)
      result
      
    }
  )
  
  output$sql_result <- renderTable({
    queryDT()
  })
  
  output$all_tables <- renderTable({
    runsql("SELECT name FROM sqlite_master WHERE type='table'")
  })
  
} # end of server
