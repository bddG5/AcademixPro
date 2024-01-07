CREATE TABLE formation (
    id_formation NUMBER PRIMARY KEY,
    codeFormation varchar(8),
    designation VARCHAR2(255),
    typeFormation VARCHAR2(30),
    niveauQualification NUMBER
);
-- Inserting data for Data Science Fundamentals
INSERT INTO formation (id_formation, codeFormation, designation, typeFormation, niveauQualification)
VALUES (1, 'TAG 1231', 'Data Science Fundamentals', 'cours du soir', 4);

-- Inserting data for Financial Accounting Basics
INSERT INTO formation (id_formation, codeFormation, designation, typeFormation, niveauQualification)
VALUES (2, 'TAG 1243', 'Financial Accounting Basics', 'présentiel', 5);

-- Inserting data for Web Development Bootcamp
INSERT INTO formation (id_formation, codeFormation, designation, typeFormation, niveauQualification)
VALUES (3, 'TAG 1256', 'Web Development Bootcamp', 'cours du soir', 4);
 

CREATE TABLE matiere (
    id_matiere NUMBER PRIMARY KEY,
    id_formation NUMBER,
    nomMatiere VARCHAR2(120),
    coefficent NUMBER,
    CONSTRAINT fk_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation)
);

-- Inserting modules for Data Science Fundamentals
INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (1, 1, 'Introduction to Statistics', 3);

INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (2, 1, 'Programming in Python', 4);

INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (3, 1, 'Data Visualization', 3);

-- Inserting modules for Financial Accounting Basics
INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (4, 2, 'Financial Reporting', 4);

INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (5, 2, 'Managerial Accounting', 3);

-- Inserting modules for Web Development Bootcamp
INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (6, 3, 'HTML and CSS Basics', 3);

INSERT INTO matiere (id_matiere, id_formation, nomMatiere, coefficent)
VALUES (7, 3, 'JavaScript Fundamentals', 4);



 CREATE TABLE section (
    codeSection VARCHAR2(12) PRIMARY KEY UNIQUE,
    formation number,
    responsable VARCHAR2(50),
    totalStagiaire NUMBER,
    dontFille NUMBER,
    dontHandicapes NUMBER,
    dontEtrangers NUMBER, 
    totalReussi NUMBER,
    totalAjourne NUMBER,
    totalExclue NUMBER,
    CONSTRAINT fk_section_formation FOREIGN KEY (formation) REFERENCES formation(id_formation)
);

CREATE TABLE particpantPv(
id NUMBER PRIMARY KEY,
nom VARCHAR2(30),
prenom VARCHAR2(30),
fonction VARCHAR2(50),
grade VARCHAR2(20)
);
DROP TABLE particpantPv  CASCADE CONSTRAINTS;

CREATE TABLE pv (
    id_pv NUMBER PRIMARY KEY,
    id_formation NUMBER,
    codeSection VARCHAR2(12),
    date_debut DATE,
    date_fin DATE,
    statut varchar(10) CHECK (statut IN ('open', 'closed')),
    particpants number,
    CONSTRAINT fk_pv FOREIGN KEY (id_formation) REFERENCES formation(id_formation),
    CONSTRAINT fk_sec2_pv FOREIGN KEY (codeSection) REFERENCES section(codeSection),
    CONSTRAINT fk_particpant_pv FOREIGN KEY (particpants) REFERENCES particpantPv(id)
);

select * from stagiaire;
delete from stagiaire where id_stagiaire =1;
CREATE TABLE stagiaire (
    id_stagiaire NUMBER PRIMARY KEY,
    num_inscription VARCHAR2(12) UNIQUE,
    codeSection VARCHAR2(12) NOT NULL,
    id_pv NUMBER NOT NULL,
    nom VARCHAR2(20) NOT NULL,
    prenom VARCHAR2(20) NOT NULL,
    adresse varchar(100) NOT NULL,
    statut varchar(10) NOT NULL,
    ddn DATE NOT NULL,
    sex VARCHAR2(20) CHECK (sex IN ('male', 'femelle')) NOT NULL,
    date_inscription DATE NOT NULL,
    cni NUMBER NOT NULL,
    photo BLOB NOT NULL,
    acte_de_naissance BLOB NOT NULL,
    formulaire BLOB NOT NULL,
    CONSTRAINT fk_stg_pv FOREIGN KEY (id_pv) REFERENCES pv(id_pv),
    CONSTRAINT fk_sec_pv FOREIGN KEY (codeSection) REFERENCES section(codeSection)
);


CREATE TABLE resultat_matiere (
    id_resultats NUMBER PRIMARY KEY,
    id_matiere NUMBER REFERENCES matiere(id_matiere),
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    note1 NUMBER,
    note2 NUMBER,
    moy NUMBER,
    CONSTRAINT fk_resultats FOREIGN KEY (id_matiere) REFERENCES matiere(id_matiere),
    CONSTRAINT fk1_resultats FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire)
);
CREATE TABLE resultats_semestre (
    id_resultats_semestre NUMBER PRIMARY KEY,
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    semestre number , ---> 1  2  3  4  5  6
    moy NUMBER,
    CONSTRAINT fk1_stg FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire)
);


CREATE TABLE diplome (
    id_serie NUMBER PRIMARY KEY,
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    id_pv NUMBER REFERENCES pv(id_pv),
    id_formation NUMBER REFERENCES formation(id_formation),
    type_diplome VARCHAR2(20),
    etat_diplome VARCHAR2(20),
    promotion VARCHAR2(20),
    info_etabissement VARCHAR2(30),
    duplicatat VARCHAR2(30),
    signature BLOB,
    CONSTRAINT fk1_diplome FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire),
    CONSTRAINT fk2_diplome FOREIGN KEY (id_pv) REFERENCES pv(id_pv),
    CONSTRAINT fk3_diplome FOREIGN KEY (id_formation) REFERENCES formation(id_formation)
);

CREATE TABLE registre (
    id_registre NUMBER PRIMARY KEY,
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    id_formation NUMBER REFERENCES formation(id_formation),
    id_pv NUMBER REFERENCES pv(id_pv),
    id_serie NUMBER REFERENCES diplome(id_serie), 
    mention VARCHAR2(20),
    observation VARCHAR2(20),
    signature BLOB,
    CONSTRAINT fk1_registre FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire),
    CONSTRAINT fk2_registre FOREIGN KEY (id_formation) REFERENCES formation(id_formation),
    CONSTRAINT fk3_registre FOREIGN KEY (id_pv) REFERENCES pv(id_pv),
    CONSTRAINT fk4_registre FOREIGN KEY (id_serie) REFERENCES diplome(id_serie)
);


CREATE TABLE recuperation (
    id_recu NUMBER PRIMARY KEY,
    id_serie NUMBER REFERENCES diplome(id_serie),
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    date_recup DATE,
    procuration BLOB,
    piece_identite BLOB,
    declaration BLOB,
    CONSTRAINT fk1_recuperation FOREIGN KEY (id_serie) REFERENCES diplome(id_serie),
    CONSTRAINT fk2_recuperation FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire)
);

CREATE TABLE rectification (
    id_rectification NUMBER PRIMARY KEY,
    id_serie NUMBER REFERENCES diplome(id_serie),
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    date_rectif DATE,
    heure VARCHAR2(20),
    defaut VARCHAR2(38),
    methode_rectif VARCHAR2(20),
    resultat VARCHAR2(20),
    CONSTRAINT fk1_rectification FOREIGN KEY (id_serie) REFERENCES diplome(id_serie),
    CONSTRAINT fk2_rectification FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire)
);

CREATE TABLE users (
    id_users NUMBER PRIMARY KEY,
    nom_utilisateur VARCHAR2(30),
    mdp VARCHAR2(100),
    role VARCHAR2(20)
);


DROP TABLE resultat_matiere CASCADE CONSTRAINTS;
DROP TABLE resultats_semestre CASCADE CONSTRAINTS;
DROP TABLE rectification CASCADE CONSTRAINTS;
DROP TABLE recuperation CASCADE CONSTRAINTS;
DROP TABLE registre CASCADE CONSTRAINTS;
DROP TABLE diplome CASCADE CONSTRAINTS;
DROP TABLE resultats CASCADE CONSTRAINTS;
DROP TABLE stagiaire CASCADE CONSTRAINTS;
DROP TABLE pv CASCADE CONSTRAINTS;
DROP TABLE matiere CASCADE CONSTRAINTS;
DROP TABLE formation CASCADE CONSTRAINTS;


-- Insert three users with different roles
INSERT INTO users (id_users, nom_utilisateur, mdp, role) VALUES 
(1, 'user1', '0000', 'admin');

INSERT INTO users (id_users, nom_utilisateur, mdp, role) VALUES 
(2, 'user2', '0000', 'scolarite');

INSERT INTO users (id_users, nom_utilisateur, mdp, role) VALUES 
(3, 'user3', '0000', 'diplome');

select * from users;