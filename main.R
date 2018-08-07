#install.packages("RSQLite")

library(DBI)
# Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), dbname = "data/data.sqlite",":memory:")

dbListTables(con)

query <- "select * from Authors Limit 5"
runsql(query)
