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
        box( width = 12,
          
          title = "Query Interface",
          
          # Choose a column
          textAreaInput(
            "sql_code",
            "Wriet your SQLite3 query:",
            cols = 12
          ),
          tableOutput("sql_result"),

          # Create an eventReactive element
          actionButton(
            inputId = "submit",
            label = "Run Query"
          )
          
        ),
        # PLOT
        box( width = 12,
             title = "Available tables",
             footer = "Use PRAGMA table_info(authors); to see schema for a given table",
             collapsible = T,
             collapsed = T,
          
          tableOutput("all_tables")
          
        )
      )
    ),
    
    ########################
    # Second tab content
    ########################
    tabItem(
      tabName = "plots",
      h2("Widgets tab content")
    )
  )
)