salaire_net_cadre = function(salaire_brut = 2500,temps_travail = 1) {
  if (!is.numeric(salaire_brut)) {return("Erreur")}
  if (!is.numeric(temps_travail)) {return("Erreur")}
  if ((temps_travail > 1) | (temps_travail < 0)) {return("Erreur")}
  salaire_net_avant_impot = salaire_brut * 0.75 * temps_travail
  return (salaire_net_avant_impot)}
salaire_net_cadre(salaire_brut = 500,temps_travail = 1.1)

salaire_net = function(salaire_brut = 2500,temps_travail = 1,cadre = "non") {
  if (!is.numeric(salaire_brut)) {return("Erreur")}
  if (!is.numeric(temps_travail)) {return("Erreur")}
  if ((temps_travail > 1) | (temps_travail < 0)) {return("Erreur")}
  if (cadre == "oui") {salaire_net_avant_impot = salaire_brut * 0.75 * temps_travail}
  else {salaire_net_avant_impot = salaire_brut * 0.78 * temps_travail}
  if (salaire_net_avant_impot <= 1591) {salaire_net_apres_impot <- salaire_net_avant_impot} 
  else if (salaire_net_avant_impot <= 2006) {salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.029)} 
  else if (salaire_net_avant_impot <= 3476) {salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.099)} 
  else if (salaire_net_avant_impot <= 8557) {salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.20)} 
  else {salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.43)}
  return (salaire_net_apres_impot)}
salaire_net(cadre = "oui",salaire_brut = 20000)

shifumi <- function() {
  choix_utilisateur <- readline(prompt = "Choisissez entre pierre, papier ou ciseaux : ")
  
  if (choix_utilisateur %in% c("pierre", "papier", "ciseaux")) {
    choix_ordi <- sample(c("pierre", "papier", "ciseaux"), 1)
    
    cat("Votre choix :", choix_utilisateur, "\n")
    cat("Choix de l'ordinateur :", choix_ordi, "\n")
    
    if (choix_utilisateur == choix_ordi) {
      return("Égalité !")
    } else if ((choix_utilisateur == "pierre" & choix_ordi == "ciseaux") |
               (choix_utilisateur == "papier" & choix_ordi == "pierre") |
               (choix_utilisateur == "ciseaux" & choix_ordi == "papier")) {
      return("Vous avez gagné !")
    } else {
      return("L'ordinateur a gagné !")
    }
  } else {
    return("Valeur invalide. Veuillez choisir entre pierre, papier ou ciseaux.")
  }
}

shifumi()

resultat = 0
for (element in c(1,2,3,4,5)) {
  resultat = resultat +  element
  print(paste("le resultat est : ",resultat))}

element = 1
resultat = 0
while (resultat <= 50) {
  resultat = resultat +  element
  print(paste("le resultat est : ",resultat))
  print(paste("le programme s'est arrêté à la valeur : ", element))
  element = element + 1
  }