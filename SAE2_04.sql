-- TP 2_04
-- Nom: RAVIART, Prenom: Alexandre

-- +----------------------+--
-- * Question Objet Volé : --
-- +----------------------+--

-- requete a finir
SELECT idut, idob, idve, debutve, max(montant) prixmax, 
min(montant) prixmin FROM VENTE natural join UTILISATEUR natural join ENCHERIR
where DAY(debutve) < 15 group by idve having max(prixbase) >= min(prixbase)*10;

SELECT objet.nomob, vente.prixbase, MAX(encherir.montant) montant_max, COUNT(DISTINCT encherir.idut) nb_acheteurs
FROM objet
JOIN vente ON objet.idob = vente.idob
JOIN encherir ON vente.idve = encherir.idve where DAY(debutve) < 15 and vente.prixbase < 500
GROUP BY objet.idob, vente.prixbase HAVING MAX(encherir.montant) > vente.prixbase * 10 and nb_acheteurs >= 10;

SELECT nomob, prixbase, MAX(montant) montant_max, COUNT(DISTINCT idut) nb_acheteurs
FROM objet natural join vente natural join encherir where DAY(debutve) < 15 and vente.prixbase < 500
GROUP BY objet.idob, vente.prixbase HAVING MAX(encherir.montant) > vente.prixbase * 10 and nb_acheteurs >= 10;
-- +------------------+--
-- * Question 1 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des objets vendus par ght1ordi au mois de février 2023

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +----------+----------------------+
-- | pseudout | nomob                |
-- +----------+----------------------+
-- | etc...

SELECT pseudout from  UTILISATEUR natural join OBJET where idob
IN (SELECT )

-- +------------------+--
-- * Question 2 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des utilisateurs qui ont enchérit sur un objet qu’ils ont eux même mis en vente

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +-----------+
-- | pseudout  |
-- +-----------+
-- | etc...
-- = Reponse question 2.



-- +------------------+--
-- * Question 3 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des utilisateurs qui ont mis en vente des objets mais uniquement des meubles

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +-------------+
-- | pseudout    |
-- +-------------+
-- | etc...
-- = Reponse question 3.



-- +------------------+--
-- * Question 4 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  La liste des objets qui ont généré plus de 15 enchères en 2022

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+----------------------+
-- | idob | nomob                |
-- +------+----------------------+
-- | etc...
-- = Reponse question 4.



-- +------------------+--
-- * Question 5 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  Ici NE CREEZ PAS la vue PRIXVENTE mais indiquer simplement la requête qui lui est associée. C'est à dire la requête permettant d'obtenir pour chaque vente validée, l'identifiant de la vente l'identiant de l'acheteur et le prix de la vente.

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+------------+----------+
-- | idve | idacheteur | montant  |
-- +------+------------+----------+
-- | etc...
-- = Reponse question 5.



-- +------------------+--
-- * Question 6 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  Le chiffre d’affaire par mois de la plateforme (en utilisant la vue PRIXVENTE)

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+-------+-----------+
-- | mois | annee | ca        |
-- +------+-------+-----------+
-- | etc...
-- = Reponse question 6.



-- +------------------+--
-- * Question 7 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  Les informations du ou des utilisateurs qui ont mis le plus d’objets en vente

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +------+----------+------+
-- | idut | pseudout | nbob |
-- +------+----------+------+
-- | etc...
-- = Reponse question 7.



-- +------------------+--
-- * Question 8 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  le camembert

-- Voici le début de ce que vous devez obtenir.
-- ATTENTION à l'ordre des colonnes et leur nom!
-- +-------+-------------------+-----------+
-- | idcat | nomcat            | nb_objets |
-- +-------+-------------------+-----------+
-- | etc...
-- = Reponse question 8.



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



