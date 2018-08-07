###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################
library(shinydashboard)


sidebar <- dashboardSidebar(
  sidebarMenu(
    
    menuItem("SQL Query", tabName = "sql_query", icon = icon("dashboard")),
    menuItem("Plots", tabName = "plots", icon = icon("th"))
    
  )
)
