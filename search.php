<?php
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
include_once 'navbar.php';

$query = $_GET['query'];
maakConnectiePDO();
print('<h2>');
# Afvangen van een te korte zoekterm
if(strlen($query) <= 2){ 
    print ( 'De zoekopdracht was kleiner dan drie karakters, a.u.b. een specifiekere zoekterm gebruiken.' );
} 
# Geval dat de zoekopdracht het minimaal aantal karakters heeft
else { 
    $query = htmlspecialchars($query);
    global $connectie, $resultaat;
    # sql query
    $sql = "SELECT StockItemID, StockItemName FROM stockitems WHERE StockItemName LIKE '%".$query."%'";
    if ($res = $connectie->query($sql)) {
        # Bepalen of de query een resultaat geeft
        if ($res->fetchColumn() > 0) {
            foreach ($connectie->query($sql) as $row){
                if ($sql = true){
                    print('<a href="product.php?Pid='.$row["StockItemID"].'"> '.$row['StockItemName'].' <br>');
                } 
            }
        # Als de zoekterm geen resultaten opgeeft
        } else {
            print('Uw zoekopdracht heeft geen resultaten opgeleverd.');
        }
    } 
}
sluitConnectiePDO();
?>
