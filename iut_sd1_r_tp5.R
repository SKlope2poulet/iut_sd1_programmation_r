#EXERCICE 1
setwd("L:/BUT/SD/Promo 2023/bfontaine/R/CSV/nba")
getwd()

NBA = list.files(path = getwd(), pattern = ".csv$", full.names = TRUE)
Fichier1 = basename(NBA[1])
library(tools)
sansext1 = file_path_sans_ext(Fichier1)
assign(sansext1, read.csv(NBA[1], sep = ",", dec = "."))

for(i in NBA){
  objet = file_path_sans_ext(basename(i))
  heuredepart = Sys.time()
  assign(objet, read.csv(i, sep = ",", dec = "."))
  heurefinal = Sys.time()
  temps = heurefinal - heuredepart
  cat("Importation : ",objet, "=" , temps , "\n")
  }
#EXERCICE2
#1
df_x = subset(team, city == "Los Angeles", select = c("id", "city"))
df_y = subset(game, select = c("game_id", "team_id_home"))
dfJoin = merge(x = df_x, y = df_y, 
               by.x = "id", 
               by.y = "team_id_home", 
               all.x = TRUE)
nrow(dfJoin)
View(dfJoin)
#2
df_x = dfJoin
df_y = subset(game_info, select = c("game_id", "attendance"))
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.x = TRUE)
mean(dfJoin$attendance, na.rm = TRUE)
View(dfJoin)
#3
df_x = subset(game_summary, season == 2020,
              select = c("game_id", "season"))
dfJoin = merge(x = df_x, y = officials, 
               by = "game_id",
               all.x = TRUE)
length(unique(dfJoin$official_id))
View(dfJoin)
#4
df_x = subset(game_summary,
              select = c("game_id", "season"))
df_y = subset(officials, first_name == "Dick" & last_name == "Bavetta")
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.y = TRUE)
View(dfJoin)
table(dfJoin$season)
#EXERCICE 3
install.packages("DBI")
install.packages("RSQLite")
library(DBI)
library(RSQLite)
mydb <- dbConnect(SQLite(), "nbaDb.sqlite")