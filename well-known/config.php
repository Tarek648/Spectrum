<?php
$host = 'localhost';
$db = 'spectrum_spectrum';  
$user = 'root';     
$pass = '';     

$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
