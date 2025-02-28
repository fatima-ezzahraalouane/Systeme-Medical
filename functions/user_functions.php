<?php
require '../conn/db.php';

// Modifier les informations du profil
function updateUser($id, $nom, $prenom) {
    global $conn;
    $stmt = $conn->prepare("UPDATE utilisateurs SET nom = ?, prenom = ? WHERE id_utilisateur = ?");
    $stmt->bind_param('ssi', $nom, $prenom, $id);
    return $stmt->execute();
}

// Obtenir les informations d'un utilisateur
function getUser($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM utilisateurs WHERE id_utilisateur = ?");
    $stmt->bind_param('i', $id);
    $stmt->execute();
    return $stmt->get_result()->fetch_assoc();
}
?>
