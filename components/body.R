###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could potentially segment those into their own
# components as well.
###################
library(shinydashboard)
source('functions.R', local = T)



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
            cols = 12,
            height = '300px'
          ),
          # Create an eventReactive element
          actionButton(
            inputId = "submit",
            label = "Run Query"
          ),
          tableOutput("sql_result")

          
          
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
      h2("Plotting interface"),
      
      fluidRow(
        box(width = 12,
            #selectInput("tableChooser", "Select a table", choices = runsql("SELECT name FROM sqlite_master WHERE type='table'"))
            textAreaInput(
              "sql_code_plot",
              "Wriet your SQLite3 query:",
              cols = 12,
              height = '300px'
            ),
            # Create an eventReactive element
            actionButton(
              inputId = "submit_plot_q",
              label = "Run Query"
            )
            ),
        box(width = 12,
            rpivotTable::rpivotTableOutput("pivotPlots")
        )
      )
    )
  )
)