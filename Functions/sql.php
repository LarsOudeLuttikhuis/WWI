<?php
$connectie = NULL;
$resultaat = NULL;

if (!function_exists('maakConnectiePDO')) {
        function maakConnectiePDO() {
        global $connectie;
        $dsn = "mysql:host=localhost:3306;dbname=wideworldimporters;";
        $connectie = new PDO($dsn, 'root', '');
        if ($connectie->connect_error) {
        die("Connection failed: " . $conn->connect_error);
        } 
    }
}

if (!function_exists('SelecteerProducten')) {
    function SelecteerProducten($CiD) {
        global $connectie, $resultaat;
        $resultaat = $connectie->prepare("SELECT * FROM stockitems  JOIN stockitemstockgroups ON stockitems.StockItemID = stockitemstockgroups.StockItemID JOIN stockgroups ON stockitemstockgroups.StockGroupID = stockgroups.StockGroupID WHERE  stockgroups.StockGroupID = ".$CiD.";");
        $resultaat->execute();
        return $resultaat->fetchAll();
    }
}

if (!function_exists('SelecteerCategorieën')) {
    function SelecteerCategorieën() {
        global $connectie, $resultaat;
        $resultaat = $connectie->prepare("SELECT * FROM stockgroups;");
        $resultaat->execute();
        return $resultaat->fetchAll();
    }
}

if (!function_exists('SelecteerProduct')) {
    function SelecteerProduct($ProductID) {
        global $connectie, $resultaat;
        $resultaat = $connectie->prepare("SELECT * FROM stockitems WHERE StockItemID = ".$ProductID.";");
        $resultaat->execute();
        return $resultaat->fetch();
    }
}

if (!function_exists('HomeProduct')) {
    function HomeProduct() {
        global $connectie, $resultaat;
        $resultaat = $connectie->prepare("SELECT * FROM wideworldimporters.stockitems where StockItemName like '%chocola%' And SupplierID = 1;");
        $resultaat->execute();
        return $resultaat->fetchAll();
    }
}





if (!function_exists('sluitConnectiePDO')) {
    function sluitConnectiePDO() {
        global $connectie, $resultaat;
        $resultaat = null; // doing this is mandatory for connection to get closed
        $connectie = null;
    }    
}
