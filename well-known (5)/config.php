<?php
$host = 'localhost';
$db = 'spectrum_spectrum';  // 🔁 Replace with your actual database name
$user = 'spectrum_123';     // 🔁 Replace with your actual database user
$pass = '123@Quantum';     // 🔁 Replace with your actual password

$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
