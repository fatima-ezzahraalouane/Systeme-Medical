<?php
require '../config/db.php';

// Prendre un rendez-vous
function addRendezvous($id_patient, $id_medecin, $date_rdv) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO rendezvous (id_patient, id_medecin, date_rdv) VALUES (?, ?, ?)");
    $stmt->bind_param('iis', $id_patient, $id_medecin, $date_rdv);
    return $stmt->execute();
}

// Annuler un rendez-vous
function cancelRendezvous($id_rdv) {
    global $conn;
    $stmt = $conn->prepare("DELETE FROM rendezvous WHERE id_rdv = ?");
    $stmt->bind_param('i', $id_rdv);
    return $stmt->execute();
}
?>
