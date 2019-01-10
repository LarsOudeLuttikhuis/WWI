<?php
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
include_once 'navbar.php';

$query = $_GET['query'];
maakConnectiePDO();

if(strlen($query) <= 2){ 
    print ( 'De zoekopdracht was kleiner dan drie karakters, a.u.b. een specifiekere zoekterm gebruiken.' );
}

else if(strlen($query) >= 2){ 
    $query = htmlspecialchars($query);
    global $connectie, $resultaat;
    $sql = "SELECT StockItemID, StockItemName FROM stockitems WHERE StockItemName LIKE '%".$query."%'";
        foreach ($connectie->query($sql) as $row){
            if ($sql = true)
         print('<a href="product.php?Pid='.$row["StockItemID"].'"> '.$row['StockItemName'].' <br>');
    }
}

sluitConnectiePDO();
?>