<?php
$connectie = NULL;
$resultaat = NULL;
function maakConnectiePDO() {
    global $connectie;
    $dsn = "mysql:host=192.168.64.2;dbname=wideworldimporters;";
    $connectie = new PDO($dsn, 'admin', 'admin');
}

function SelecteerProducten() {
    global $connectie, $resultaat;
    $resultaat = $connectie->prepare("SELECT * FROM stockitems");
    $resultaat->execute();
    return $resultaat->fetchAll();
}

function SelecteerCategorieën() {
    global $connectie, $resultaat;
    $resultaat = $connectie->prepare("SELECT * FROM SELECT * FROM stockgroups;");
    $resultaat->execute();
    return $resultaat->fetchAll();
}
function sluitConnectiePDO() {
    global $connectie, $resultaat;
    $resultaat->closeCursor(); // this is not even required
    $resultaat = null; // doing this is mandatory for connection to get closed
    $connectie = null;
}    
?>