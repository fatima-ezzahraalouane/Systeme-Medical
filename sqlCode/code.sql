CREATE DATABASE medical_system;

USE medical_system;

CREATE TABLE utilisateurs (
    id_utilisateur int NOT null AUTO_INCREMENT PRIMARY KEY,
    nom varchar(250),
    prenom varchar(250),
    type_utilisateur ENUM('patient', 'médecin') NOT NULL
);

CREATE TABLE rendezvous (
    id_rdv int NOT null AUTO_INCREMENT PRIMARY KEY,
    id_patient int NOT null,
    id_medecin int NOT null,
    date_rdv DATETIME,
    status ENUM('confirmé', 'non confirmé') DEFAULT 'non confirmé',
    FOREIGN KEY (id_patient) REFERENCES utilisateurs(id_utilisateur),
    FOREIGN KEY (id_medecin) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE factures (
    id_facture int NOT null AUTO_INCREMENT PRIMARY KEY,
    id_rdv int NOT null,
    montant DECIMAL(10,2),
    date_facture DATETIME,
    FOREIGN KEY (id_rdv) REFERENCES rendezvous(id_rdv)
);

INSERT INTO utilisateurs (nom, prenom, type_utilisateur)
VALUES 
('Hamza', 'Hadouchi', 'patient'),
('Fatima-Ezzahra', 'Alouane', 'médecin'),
('Youness', 'Boussfiha', 'patient'),
('Sadiq', 'Billouch', 'médecin');

INSERT INTO rendezvous (id_patient, id_medecin, date_rdv, status)
VALUES 
(1, 2, '2024-12-23 10:00:00', 'confirmé'),
(3, 4, '2024-12-24 11:00:00', 'non confirmé'),
(1, 4, '2024-12-25 09:00:00', 'confirmé'),
(3, 2, '2024-12-26 14:00:00', 'non confirmé');

INSERT INTO factures (id_rdv, montant, date_facture) VALUES 
(1, 250.00, '2024-12-23'),
(3, 300.00, '2024-12-25');

INSERT INTO factures (id_rdv, montant, date_facture) VALUES 
(1, 250.00, '2024-12-23 10:05:00'),
(3, 300.00, '2024-12-25 09:07:00');

SELECT 
    r.id_rdv AS ID_RendezVous,
    p.nom AS Patient_Nom,
    p.prenom AS Patient_Prenom,
    m.nom AS Medecin_Nom,
    m.prenom AS Medecin_Prenom,
    r.date_rdv AS Date_RendezVous,
    r.status AS Statut_RendezVous,
    f.montant AS Montant_Facture,
    f.date_facture AS Date_Facture
FROM 
    rendezvous r
JOIN 
    utilisateurs p ON r.id_patient = p.id_utilisateur AND p.type_utilisateur = 'patient'
JOIN 
    utilisateurs m ON r.id_medecin = m.id_utilisateur AND m.type_utilisateur = 'medecin'
LEFT JOIN 
    factures f ON r.id_rdv = f.id_rdv
ORDER BY 
    r.date_rdv