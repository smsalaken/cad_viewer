###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could potentially segment those into their own
# components as well.
###################
library(shinydashboard)


body <- dashboardBody(
  tabItems(
    
    ########################
    # First tab content
    ########################
    tabItem(
      tabName = "sql_query",
      fluidRow(
        
        # CONTROLS
        box(
          
          title = "Controls",
          
          # Choose a column
          textAreaInput(
            "sql_code",
            "Wriet your SQLite3 query:",
            cols = 8
          ),
          tableOutput("sql_result"),

          # Create an eventReactive element
          actionButton(
            inputId = "submit",
            label = "Run Query"
          )
          
        ),
        # PLOT
        box(
          
          plotOutput("histPlot")
          
        )
      )
    ),
    
    ########################
    # Second tab content
    ########################
    tabItem(
      tabName = "widgets",
      h2("Widgets tab content")
    )
  )
)