<?php
$host = 'localhost';
$dbname = 'medical_system';
$user = 'root';
$password = '';

$conn = mysqli_connect($host, $user, $password, $dbname);

if (!$conn) {
    die("Erreur de connexion : " . mysqli_connect_error());
}
?>