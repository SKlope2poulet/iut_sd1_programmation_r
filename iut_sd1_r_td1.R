#exercice 1
#on defini a et b puis on les multiplie
a <- 10
b <- 5
resultat <- a*b
print(resultat)
#on créé 2 autres objets A et B et on remarque que R différencit les majuscules car cela n'a pas remplacé a et b
A <- 7.2
B <- 10.1
#on les multiplie sous resultat ce qui remplace le resultat précedent
resultat <- A*B
#on supprime tous les objets précedents
rm(a,b,A,B,resultat)

#exercice 2
#on créé le vecteur on regarde sa classe et la 3 eme valeur puis on crée plusieurs vecteurs
vecteur <- c(1:5)
class(vecteur)
vecteur[3]
v1 <- c(1:5)
v2 <- v1 +3
v3 <- c(1:6)
v4 <- v3**2
v5 <- v4/2
#on créé un vecteur caractere auquel on ajoute les jours de la semaine puis on regarde sa classe et 2 de ses valeurs
caractere <- c("lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche")
class(caractere)
caractere[c(2,7)]
#on créé un vecteur auquel on ajoute des valeurs booleennes puis on regarde sa classe
booleenne <- c(TRUE,FALSE)
class(booleenne)
#on créé un vecteur auquel on ajoute des valeurs decimales puis on regarde sa classe et on affiche toutes sauf la 3 eme valeur
decimal <- c(0.4,0.9,2.6,4.5,9.6)
class(decimal)
decimal[-3]
#on crée un vecteur avec tout les mois puis on affiche sa classe et le premier trimestre
mois <- c("Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre")
class(mois)
vecteur[c(1,2,3)]
#on crée un vecteur avec des valeurs négatives puis on affiche sa classe, sa 1ere et derniere valeur
negative <- c(-1:-5)
class(negative)
negative[c(1,5)]
#on crée un vecteur avec des fruits puis on affiche sa classe, tout les éléments sauf le premier et deuxième
fruits <- c("fraise","tomate","lichi","mangue")
class(fruits)
fruits[c(-1,-2)]
#on créé un vecteur avec une valeur manquante, on regarde sa classe
manquante <- c(1,2,NA,4)
class(vecteur)
#sequence
sequence = seq(from = 1,to =10)
length(sequence)
sequence1 = seq(from = 2,to =20, by = 2)
length(sequence1)
sequence2 = seq(from = 0,to =-5)
length(sequence2)
sequence3 = seq(from = 5,to =50, by = 5)
length(sequence3)
sequence4 = seq(from = 10,to =1)
length(sequence4)
#rep
repet = rep(3, times = 5)
#exercice 3
run = runif(n=5, min=0, max=1)
