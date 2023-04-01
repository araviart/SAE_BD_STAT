-- Nom: RAVIART, Prenom: Alexandre

-- +----------------------+--
-- * Question OBJET Volé : --
-- +----------------------+--

SELECT ENCHERIR.idut, UTILISATEUR.pseudout, OBJET.nomob, VENTE.prixbase, ENCHERIR.montant
FROM OBJET
JOIN VENTE ON 
OBJET.idob = VENTE.idob
JOIN ENCHERIR 
ON VENTE.idve = ENCHERIR.idve
JOIN UTILISATEUR ON ENCHERIR.idut = UTILISATEUR.idut
where DAY(debutve) < 15 and VENTE.prixbase < 500 and montant > prixbase * 10
GROUP BY OBJET.idob, VENTE.prixbase;


-- insertion dans la base de données
insert into UTILISATEUR(idUt,pseudoUt,emailUT,mdpUt,activeUt,idRole) values
(1002, 'IUTO', "iuto@info.univ-orleans.fr", 'IUTO', 'O', 2);
insert into OBJET(idOb,nomOb,descriptionOb,idCat,idUt) values
(502,'Clic-Clac très beau et ayant peu servi','Clic clac comme neuveLorem ipsum dolor sit amet, consectetur adipiscing elit.
Donec facilisis, ligula vel posuere cursus, sapien leo dictum nisi, interdum aliquam sem nisi ac purus', 3, 1002);
insert into VENTE(idVe,prixBase,prixMin,debutVe,finVe,idSt,idOb) values
(450, 40, 80,STR_TO_DATE('23/03/2023:10:00:00','%d/%m/%Y:%h:%i:%s'),DATE_ADD(STR_TO_DATE('30/03/2024:10:00:00','%d/%m/%Y:%h:%i:%s'), INTERVAL 7 DAY),2,502);


-- +------------------+--
-- * Question 1 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des OBJETs vendus par ght1ordi au mois de février 2023

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +----------+----------------------+
-- | pseudout | nomob                |
-- +----------+----------------------+
-- | etc...

SELECT pseudout, nomob FROM OBJET NATURAL JOIN UTILISATEUR 
NATURAL join VENTE where idst = '4' and pseudout = "ght1ordi" 
and MONTH(debutVe) = 2 and YEAR(debutVe) = 2023;

-- +------------------+--
-- * Question 2 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des utilisateurs qui ont enchérit sur un OBJET qu’ils ont eux même mis en VENTE

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +-----------+
-- | pseudout  |
-- +-----------+
-- | etc...
-- = Reponse question 2.

-- a revoir peut causer des problèmes si un utilisateur a mis en vente plusieurs objets et 
-- que certains d'entre eux ont ete vendus à d'autres utilisateurs, car la requête ne fera pas 
-- la distinction entre les objets vendus à d'autres utilisateur et ceux vendus à l'utilisateur lui-même.

SELECT DISTINCT pseudout 
FROM UTILISATEUR 
NATURAL JOIN VENTE 
NATURAL JOIN OBJET 
WHERE idut IN (
    SELECT idut 
    FROM ENCHERIR 
    NATURAL JOIN VENTE);

-- +------------------+--
-- * Question 3 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des utilisateurs qui ont mis en VENTE des OBJETs mais uniquement des meubles

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +-------------+
-- | pseudout    |
-- +-------------+
-- | etc...
-- = Reponse question 3.

SELECT pseudout FROM OBJET NATURAL JOIN UTILISATEUR 
NATURAL join VENTE where idob NOT IN(select idob FROM OBJET
NATURAL join VENTE where idcat != 3);


-- +------------------+--
-- * Question 4 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des OBJETs qui ont généré plus de 15 enchères en 2022

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+----------------------+
-- | idob | nomob                |
-- +------+----------------------+
-- | etc...
-- = Reponse question 4.

select idob, nomob, count(idob) from OBJET NATURAL join ENCHERIR WHERE 
YEAR(dateheure) = 2022 GROUP by idob having count(idob) > 15;

-- +------------------+--
-- * Question 5 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
 -- Les informations du ou des utilisateurs qui ont mis le plus d’objets en vente.
-- = Reponse question 5.
SELECT idut, pseudoUt, emailUT, mdpUt, idRole FROM UTILISATEUR NATURAL JOIN ENCHERIR GROUP BY idUT
HAVING COUNT(idUT) >= ALL(select COUNT(idUT) from ENCHERIR GROUP BY idUT); 

-- +------------------+--
-- * Question 6 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
-- Créer une vue PRIXVENTE permettant d’obtenir pour chaque vente validée, l’identifiant de la vente l’identifiant de l’acheteur et le prix de la vente.


-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+-------+-----------+
-- | mois | annee | ca        |
-- +------+-------+-----------+
-- | etc...
-- = Reponse question 6.
CREATE OR REPLACE VIEW PRIXVENTE AS SELECT idve, idut, max(montant) montant-- on s'assure avec le max que ça retourne l'acheteur ayant remporté l'enchère
FROM VENTE NATURAL JOIN ENCHERIR where idSt = 4 group by idVe;


-- +------------------+--
-- * Question 7 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  Le chiffre d’affaire par mois de la plateforme

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+----------+------+
-- | idut | pseudout | nbob |
-- +------+----------+------+
-- | etc...
-- = Reponse question 7.
SELECT MONTH(debutve) mois, YEAR(debutve) annee, SUM(montant) chiffre_affaires
FROM PRIXVENTE natural join VENTE
GROUP BY annee, mois;

-- +------------------+--
-- * Question 8 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  le camembert

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +-------+-------------------+-----------+
-- | idcat | nomcat            | nb_OBJETs |
-- +-------+-------------------+-----------+
-- | etc...
-- = Reponse question 8.

SELECT c.idcat, c.nomcat, COUNT(DISTINCT o.idob) nb_objets_vendus
FROM CATEGORIE c
JOIN OBJET o ON c.idcat = o.idcat
JOIN VENTE v ON o.idob = v.idob
JOIN PRIXVENTE p ON v.idve = p.idve
WHERE YEAR(v.debutve) = 2022
GROUP BY c.idcat, c.nomcat;

-- +------------------+--
-- * Question 9 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  Le top des vendeurs

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+-------------+----------+
-- | idut | pseudout    | total    |
-- +------+-------------+----------+
-- | etc...
-- = Reponse question 9.


SELECT u.pseudout, SUM(pv.montant) chiffre_affaires
FROM PRIXVENTE pv
JOIN VENTE v ON pv.idve = v.idve
JOIN OBJET o ON v.idob = o.idob
JOIN UTILISATEUR u ON o.idut = u.idut
WHERE MONTH(finVe) = 01 and YEAR(finVe) = 2023
GROUP BY u.idut
ORDER BY chiffre_affaires DESC
LIMIT 10;


SELECT u.pseudout, SUM(pv.montant) chiffre_affaires
FROM PRIXVENTE pv
JOIN VENTE v ON pv.idve = v.idve
JOIN OBJET o ON v.idob = o.idob
JOIN UTILISATEUR u ON o.idut = u.idut
GROUP BY u.idut
ORDER BY chiffre_affaires DESC
LIMIT 10;
