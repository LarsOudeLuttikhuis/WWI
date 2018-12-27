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


if (!function_exists('Productdetail')) {
    function Productendetail($Idproduct) {
        global $connectie, $resultaat;
        $idproduct = intval($_GET['id']);
        $resultaat = $connectie->prepare("SELECT * FROM wideworldimporters.stockitems where StockItemID = ".$Idproduct.";");
        $resultaat->execute();
        return $resultaat->fetchAll();
    }

}