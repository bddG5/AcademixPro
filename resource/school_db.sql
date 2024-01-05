CREATE TABLE formation (
    id_formation NUMBER PRIMARY KEY,
    desigantion VARCHAR2(50),
    type_formation VARCHAR2(20),
    niveauQualification NUMBER
);
INSERT INTO formation (id_formation, desigantion, type_formation)
VALUES  (1, 'Formation Informatique', 'TS');
INSERT INTO formation (id_formation, desigantion, type_formation)
VALUES  (2, 'Formation Comptable', 'BTS');
INSERT INTO formation (id_formation, desigantion, type_formation)
VALUES  (3, 'Formation Réseaux', 'TS');
INSERT INTO formation (id_formation, desigantion, type_formation)
VALUES  (4, 'Formation Marketing', 'BTS');
 
CREATE TABLE matiere (
    id_matiere NUMBER PRIMARY KEY,
    id_formation NUMBER,
    nom_matiere VARCHAR2(20),
    coefficent NUMBER,
    CONSTRAINT fk_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation)
);

select * from matiere where id_formation=1;
-- For the first formation
INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (1, 1, 'Mathématiques', 3);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (2, 1, 'Informatique', 4);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (3, 1, 'Physique', 3);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (4, 1, 'Langue Française', 2);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (5, 1, 'Histoire-Géographie', 2);

-- For the second formation
INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (6, 2, 'Comptabilité', 4);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (7, 2, 'Gestion Financière', 3);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (8, 2, 'Droit des Affaires', 3);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (9, 2, 'Marketing', 2);

INSERT INTO matiere (id_matiere, id_formation, nom_matiere, coefficent)
VALUES (10, 2, 'Communication', 2);

 
CREATE TABLE pv (
    id_pv NUMBER PRIMARY KEY,
    id_formation NUMBER,
    date_debut DATE,
    date_fin DATE,
    statut varchar(10) CHECK (statut IN ('open', 'closed')),
    particpants VARCHAR2(20),
    fonction VARCHAR2(20),
    grade VARCHAR2(20),
    signature BLOB,
    CONSTRAINT fk_pv FOREIGN KEY (id_formation) REFERENCES formation(id_formation)
);

 
CREATE TABLE stagiaire (
    id_stagiaire NUMBER PRIMARY KEY,
    num_inscription VARCHAR2(12) UNIQUE,
    id_pv NUMBER,
    nom VARCHAR2(20),
    prenom VARCHAR2(20),
    adresse varchar(100),
    statut varchar(10),
    ddn DATE,
    sex VARCHAR2(20) CHECK (sex IN ('male', 'femelle')),
    date_inscription DATE,
    cni NUMBER,
    photo BLOB,
    acte_de_naissance BLOB,
    formulaire BLOB,
    CONSTRAINT fk_stg_pv FOREIGN KEY (id_pv) REFERENCES pv(id_pv)
);

CREATE TABLE section (
    codeSection VARCHAR2(12) PRIMARY KEY,
    formation number,
    responsable VARCHAR2(50),
    totalStagiaire NUMBER,
    dontFille NUMBER,
    dontHandicapés NUMBER,
    dontEtrangers NUMBER, 
    CONSTRAINT fk_section_formation FOREIGN KEY (formation) REFERENCES formation(id_formation),

)
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