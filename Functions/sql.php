<?php
$connectie = NULL;
$resultaat = NULL;

if (!function_exists('maakConnectiePDO')) {
        function maakConnectiePDO() {
        global $connectie;
        $dsn = "mysql:host=192.168.64.2;dbname=wideworldimporters;";
        $connectie = new PDO($dsn, 'admin', 'admin');
    }
}

if (!function_exists('SelecteerProducten')) {
    function SelecteerProducten($ID) {
        global $connectie, $resultaat;
        $resultaat = $connectie->prepare("SELECT * FROM stockitems  JOIN stockitemstockgroups ON stockitems.StockItemID = stockitemstockgroups.StockItemID JOIN stockgroups ON stockitemstockgroups.StockGroupID = stockgroups.StockGroupID WHERE  stockgroups.StockGroupID = ".$ID.";");
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

if (!function_exists('sluitConnectiePDO')) {
    function sluitConnectiePDO() {
        global $connectie, $resultaat;
        $resultaat = null; // doing this is mandatory for connection to get closed
        $connectie = null;
    }    
}
