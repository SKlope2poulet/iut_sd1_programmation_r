#EXERCICE 1
#Importer le jeu de données fao.csv avec la fonction read.csv() uniquement dans un objet appelé df
df = read.csv(file = "L:/BUT/SD/Promo 2023/bfontaine/R/CSV/fao.csv", sep = ";", dec = ",", header = TRUE)
#Combien de pays sont présents dans ce dataset
nrow(df)
#Affichez un résumé des données avec la fonction adaptée
summary(df)
#EXERCICE 2
#Quelle est la disponibilité alimentaire moyenne mondiale en Kcal/personne/jour
mean(df$Dispo_alim)
#Quelle est le nombre d’habitant dans le monde
sum(df$Population, na.rm = TRUE)
#Quelle est l’écart-type du volume des exportations et importations de viande
sd(df$Import_viande)
sd(df$Export_viande, na.rm = TRUE)
#Quelle est la médiane du volume de production de viande
median(df$Prod_viande, na.rm = TRUE)
#Calculez les quartiles du nombre de Kcal de disponibilité alimentaire
quantile(df$Dispo_alim, probs = c(0.25, 0.5, 0.75))
#Calculez les centiles du volume d’importation de viande
quantile(df$Import_viande, probs = seq(0,1, by = 0.01))
#EXERCICE 3
#Construire une requête pour extraire les lignes du dataset avec les 5 pays les moins peuplés
ordre1 = head(order(x = df$Population, decreasing = FALSE),5)
resultat1=df[ordre1,]
View(resultat1)
#Construire une requête pour extraire les lignes du dataset avec les 5 pays les plus peuplés.
ordre2 = head(order(x = df$Population, decreasing = TRUE),5)
resultat2=df[ordre2,]
View(resultat2)
#Construire une requête pour extraire les lignes du dataset avec les 5 pays qui produisent le plus de viande
ordre3 = head(order(x = df$Prod_viande, decreasing = TRUE),5)
resultat3=df[ordre3,]
View(resultat3)
#Construire une requête pour extraire les lignes du dataset avec les 5 pays qui importent le plus de viande
ordre4 = head(order(x = df$Import_viande, decreasing = TRUE),5)
resultat4=df[ordre4,]
View(resultat4)
#En moyenne, le besoin énergétique moyen d’une adulte est de 2300 kcal par jour.
#Construire une requête pour extraire les lignes du dataset avec les pays qui ont une
#disponibilité alimentaire supérieure ou égale à 2300 kcal. Combien de pays sont concernés
resultat5=subset(df, Dispo_alim>=2300)
View(resultat5)
#Construire une requête pour extraire les lignes du dataset avec les pays qui ont une disponibilité alimentaire strictement supérieure
#à 3500 kcal et qui importe un volume de viande supérieure ou égale à 1 000 000 tonnes par an. Combien de pays sont concernés ?
resultat6=subset(df, Dispo_alim>3500& Import_viande >= 1000)
View(resultat6)
#Construire une requête pour extraire les lignes du dataset avec la France et la Belgique
resultat7=subset(df, Nom=="France" | Nom=="Belgique")
View(resultat7)
#EXERCICE 4
#Ajouter une colonne nommée part_export qui correspond à la part des exportations de viande par rapport à la production de viande
part_export= df$Export_viande/df$Prod_viande
carre=cbind(df, part_export)
View(carre)
#La colonne Dispo_alim présente la disponibilité alimentaire par personne. Ajouter une colonne nommée dispo_alim_pays qui correspond 
#à la disponibilité total du pays en Kcal/jour
Dispo_alim_pays = df$Dispo_alim*df$Population
Kiri = cbind(carre, Dispo_alim_pays)
View(Kiri)
#Exporter le nouveau dataframe dans un fichier csv nommé ExportTp2.csv avec la fonction write.table()
write.table(Kiri, file = "L:/BUT/SD/Promo 2023/bfontaine/R/CSV/ExportTp2", sep =";", dec=",")

