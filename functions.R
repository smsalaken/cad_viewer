###################
# functions.R
# 
# Need some functions for your ui logic?? Define em' here.
###################

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
