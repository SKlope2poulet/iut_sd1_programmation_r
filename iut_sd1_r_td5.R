par(mfrow = c(1,1))
plot(NA, xlim = c(-5,5), ylim = c(0,1),
     xlab = "X", ylab = "densité de probabilité",
     main = "loi normales")
moyennes = c(0,0,0,-2)
ecarts = c(0.45,1,2.25,0.7)
couleurs = c("red", "blue", "green", "orange")
legend_labels = c()
for (i in 1:length(moyennes)) {
  serie = rnorm( n = 100000, mean = moyennes[i], sd = ecarts[i])
  lines(density(serie), col = couleurs[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", ecarts[i]))
}
legend("topright", legend=legend_labels, col=couleurs, lwd=2, cex=0.8)

serie1 = rnorm(n = 10000, mean = 0, sd = 1)

hist(serie1, main = "distribution de la série avec sa courbe densité",
     probability = TRUE)
lines(density(serie1))
median(serie1)
quantile(serie1)
quantile(serie,probs = seq(from = 0, to = 1, by = 0.01))

quantile(serie, probs = 0.95)
qnorm(p = 0.95, mean = 0, sd = 1)
pnorm(q = 1.644854, mean = 0, sd = 1)
qnorm(p = 0.975, mean = 0, sd = 1)
1 - pnorm(q = 1.96, mean = 0, sd = 1)

indices_colones = seq(from = 0.00, to = 0.09, by = 0.01)
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#On crée un objet résultat vide.
resultat = NULL
#On parcourt les indices colonnes
for (j in indices_colones) {
  #on crée un vecteur vide pour ajouter les probas au fur et à mesure
  all_probas = c()
  #On parcourt les indices lignes
  for (i in indices_lignes){
    quantile = i + j
    proba = pnorm(q = quantile, mean = 0, sd = 1)
    #on ajoute la nouvelle proba au vecteur existant
    all_probas = c(all_probas,proba)
    all_probas = round(all_probas,digits = 4)
  }
  #On ajoute une colonne au resultat
  resultat = cbind(resultat,all_probas)
}
View(resultat)
class(resultat)
table = data.frame(resultat)
colnames(table) = indices_colones
rownames(table) = indices_lignes
View(table)

moyenne_pop<-171
sd_pop<-9
population<-rnorm(n = 1e7, 
                  mean=moyenne_pop, 
                  sd=sd_pop)

mean(population)
sd(population)
hist(population)
#observé
pop190 = population[population < 190]
length(pop190)
length(pop190) / length(population)

#en théorie
pnorm(q = 190, mean=moyenne_pop, sd=sd_pop)*1e7