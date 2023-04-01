// données
X = [14;25;22;40;31;31;35;46;40;38;32;26];
Y = [109;180;158;276;225;209;230;342;293;234;244;176];

// calcul des statistiques
moyenneX = mean(X);
varX = mean((X - moyenneX).^2);
moyenneY = mean(Y);
varY = mean((Y - moyenneY).^2);
covXY = mean((X - moyenneX).*(Y - moyenneY));
pente = covXY/varX;
ordonnee = moyenneY - pente*moyenneX;

// tracé de la droite de régression
plot(X,Y,"o")
plot(X, pente*X + ordonnee)
