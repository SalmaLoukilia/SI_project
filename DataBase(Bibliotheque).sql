CREATE DATABASE if not exists gestion_bibliothèque;  
USE gestion_bibliothèque;  

CREATE TABLE DOCUMENT (
        ID_DOC INT PRIMARY KEY,
        TITRE VARCHAR (50),
        ANNEEPUB INT,
        EDITEUR VARCHAR (50)
);

CREATE TABLE LIVRE (
	ISBN INT PRIMARY KEY,
        ID_DOC INT,
        AUTEUR VARCHAR (50),
        FOREIGN KEY (ID_DOC) REFERENCES DOCUMENT(ID_DOC)
);

CREATE TABLE PERIODIQUE (
	ISSN INT PRIMARY KEY,
        ID_DOC INT,
        VOLUME VARCHAR (50),
        FOREIGN KEY (ID_DOC) REFERENCES DOCUMENT(ID_DOC)
);

CREATE TABLE EXEMPLAIRE (
        ID_EXM INT PRIMARY KEY,
        ID_DOC INT,
        NUMERO_ORD INT,
        DATE_ACHAT DATE,
        STATUT VARCHAR (50),
        ETAT VARCHAR (50),
        FOREIGN KEY (ID_DOC) REFERENCES DOCUMENT(ID_DOC)
);

CREATE TABLE UTILISATEUR (
        ID_UTIL INT PRIMARY KEY,
        NOM_U VARCHAR (50),
        PRENOM_U VARCHAR (50),
        CATEGORIE VARCHAR (50)
);

CREATE TABLE BIBLIOTHECAIRE (
	ID_BIB INT PRIMARY KEY,
        NOM_B VARCHAR (50),
        PRENOM_B VARCHAR (50),
        POSITION VARCHAR (50)
);

CREATE TABLE EMPRUNT (
        ID_EMP INT PRIMARY KEY,
        ID_UTIL INT,
        ID_EXM INT,
        ID_BIB INT,
        DATE_DEBUT DATE,
        DATE_FIN DATE,
        DATE_RELANCE DATE,
        NUM_RELANCE INT CHECK (NUM_RELANCE>=0),
        FOREIGN KEY (ID_UTIL) REFERENCES UTILISATEUR(ID_UTIL),
        FOREIGN KEY (ID_EXM) REFERENCES EXEMPLAIRE(ID_EXM),
        FOREIGN KEY (ID_BIB) REFERENCES BIBLIOTHECAIRE(ID_BIB)
);