<?php
$host = 'localhost';
$db = 'spectrum_spectrum';  // 🔁 Replace with your actual database name
$user = 'root';     // 🔁 Replace with your actual database user
$pass = '';     // 🔁 Replace with your actual password

$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
