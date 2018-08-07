#install.packages("RSQLite")

runsql <- function(sql, dbname="data/data.sqlite"){
  require(RSQLite)
  driver <- dbDriver("SQLite")
  connect <- dbConnect(driver, dbname=dbname);
  closeup <- function(){
    sqliteCloseConnection(connect)
    sqliteCloseDriver(driver)
  }
  
  dd <- tryCatch(dbGetQuery(connect, sql), finally=closeup)
  return(dd)
}

library(DBI)
# Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), dbname = "data/data.sqlite",":memory:")

dbListTables(con)

query <- "select * from Authors Limit 5"
runsql(query)
