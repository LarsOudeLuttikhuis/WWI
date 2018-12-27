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

if (!function_exists('homeproduct')) {
    function SelecteerProducten($homeproduct) {
        global $connectie, $resultaat;
        $resultaat = $connectie->prepare("SELECT stockitemid, stockitemname, recommendedretailprice, photo, searchdetails, marketingcomments
FROM wideworldimporters.stockitems
where StockItemName like '%chocola%'  = ".$homeproduct.";");
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

