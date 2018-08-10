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
  
  
  queryDT_plot <- eventReactive(
    #input$tableChooser,
    input$submit_plot_q,
    {
      #result <- runsql(paste0("SELECT * FROM ",input$tableChooser))
      result <- runsql(input$sql_code_plot)
      print(head(result))
      result
      
    }
  )
  output$pivotPlots <- rpivotTable::renderRpivotTable({
    rpivotTable::rpivotTable(queryDT_plot())
  })
  
} # end of server
