
#install.packages('RSQLite')

library("RSQLite")

dbAviones <- dbCanConnect(SQLite(),dbname="ontime-2017-2018.db")

dbListTables(dbAviones)
