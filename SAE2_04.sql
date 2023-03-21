-- TP 2_04
-- Nom: RAVIART, Prenom: Alexandre

-- +----------------------+--
-- * Question OBJET Volé : --
-- +----------------------+--

-- requete a finir


SELECT OBJET.idut, OBJET.nomob, VENTE.prixbase, MAX(ENCHERIR.montant) montant_max
FROM OBJET
JOIN VENTE ON OBJET.idob = VENTE.idob
JOIN ENCHERIR ON VENTE.idve = ENCHERIR.idve where DAY(debutve) < 15 and VENTE.prixbase < 500
GROUP BY OBJET.idob, VENTE.prixbase HAVING MAX(ENCHERIR.montant) > VENTE.prixbase * 10;

SELECT ENCHERIR.idut, UTILISATEUR.pseudout, OBJET.nomob, VENTE.prixbase, ENCHERIR.montant
FROM OBJET
JOIN VENTE ON 
OBJET.idob = VENTE.idob
JOIN ENCHERIR 
ON VENTE.idve = ENCHERIR.idve
JOIN UTILISATEUR ON ENCHERIR.idut = UTILISATEUR.idut
where DAY(debutve) < 15 and VENTE.prixbase < 500 and montant > prixbase * 10
GROUP BY OBJET.idob, VENTE.prixbase;
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

SELECT pseudout; nomob FROM OBJET NATURAL JOIN UTILISATEUR 
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

-- a revoir
SELECT pseudout FROM OBJET NATURAL JOIN UTILISATEUR c1
NATURAL join VENTE where idut in (select idut from ENCHERIR NATURAL join VENTE);


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

select idob, nomob, count(idob) from OBJET NATURAL join ENCHERIR GROUP by idob having count(idob) > 9;

-- +------------------+--
-- * Question 5 :     --
-- +------------------+--
-- Ecrire une requête qui renvoie les informations suivantes:
--  Ici NE CREEZ PAS la vue PRIXVENTE mais indiquer simplement la requête qui lui est associée. C'est à dire la requête permettant d'obtenir pour chaque VENTE validée, l'identifiant de la VENTE l'identiant de l'acheteur et le prix de la VENTE.

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
--  Les informations du ou des utilisateurs qui ont mis le plus d’OBJETs en VENTE

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
-- | idcat | nomcat            | nb_OBJETs |
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



