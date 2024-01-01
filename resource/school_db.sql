CREATE TABLE formation (
    id_formation NUMBER PRIMARY KEY,
    desigantion VARCHAR2(50),
    type_formation VARCHAR2(20),
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE matiere (
    id_matiere NUMBER PRIMARY KEY,
    nom_matiere VARCHAR2(20),
    note NUMBER,
    coefficent NUMBER
);

CREATE TABLE pv (
    id_pv NUMBER PRIMARY KEY,
    id_formation NUMBER REFERENCES formation(id_formation),
    date_debut DATE,
    date_fin DATE,
    type_pv VARCHAR2(20),
    particpants VARCHAR2(20),
    fonction VARCHAR2(20),
    grade VARCHAR2(20),
    signature BLOB,
    CONSTRAINT fk_pv FOREIGN KEY (id_formation) REFERENCES formation(id_formation)
);

CREATE TABLE stagiaire (
    id_stagiaire NUMBER PRIMARY KEY, 
    nom VARCHAR2(20),
    prenom VARCHAR2(20),
    ddn DATE,
    sex VARCHAR2(20) CHECK (sex IN ('male', 'femelle')),
    cdi NUMBER,
    photo BLOB,
    acte_de_naissance BLOB,
    formulaire BLOB
);

CREATE TABLE resultats (
    id_resultats NUMBER PRIMARY KEY,
    id_matiere NUMBER REFERENCES matiere(id_matiere),
    id_stagiaire NUMBER REFERENCES stagiaire(id_stagiaire),
    CONSTRAINT fk_resultats FOREIGN KEY (id_matiere) REFERENCES matiere(id_matiere),
    CONSTRAINT fk1_resultats FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire)
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
