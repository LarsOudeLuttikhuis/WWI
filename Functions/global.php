<?php
print("hallo");

function maakVerbinding()
{
    $servername = "localhost:3306";
    $username = "admin";
    $password = "admin";
    $dbname = "sakila";
// Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname, 3307);
// Check connection
    if (!$conn) {
        print("Connection failed: " . mysqli_connect_error());
    } else {
        print("connenction succesfull.");
    }
    
}
print("klaar");
maakVerbinding();
?> 