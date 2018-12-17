<?php
include 'navbar.php';

$servername = "192.168.1.214";
$username = "root";
$password = "Azeroth@2019";
$dbname = "winkel";
// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

include 'footer.php';
?>