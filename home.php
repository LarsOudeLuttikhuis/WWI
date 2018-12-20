<?php
include 'navbar.php';

$servername = "192.168.64.2";
$username = "admin";
$password = "admin";
$dbname = "";
// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

$sql = "SELECT * FROM wideworldimporters.stockitems WHERE StockItemID = 22";
$sth = $conn->query($sql);
$result = mysqli_fetch_array($sth);
echo $result['Photo'];
include 'footer.php';
?>