<?php
include 'sql.php';
$melding = "";
$vraagBevestiging = true;
$gegevens = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
$producten = array();
$catagorieën = array();

function ProductenOverzichtBekijken() {
    global $producten;
    maakConnectiePDO();
    $producten = SelecteerProducten();
    sluitConnectiePDO();
}

function CatagarieOverzichtBekijken() {
    global $catagorieën;
    maakConnectiePDO();
    $catagorieën = SelecteerProducten();
    sluitConnectiePDO();
}
function ToonProducten() {
    global $producten;
    foreach ($producten as $product) {
        print("\n\t<tr>");
        print("\n\t\t<td>".$product["StockItemName"]."</td>");
        print("\n\t\t<td>".$product["RecommendedRetailPrice"]."</td>");
        print("\n\t</tr>");
    }
}
function ToonCatagorie() {
    global $catagorieën;
    foreach ($catagorieën as $catagorie) {
        print("\n\t<tr>");
        print("\n\t\t<td>".$catagorie["StockItemName"]."</td>");
        print("\n\t\t<td>".$catagorie["RecommendedRetailPrice"]."</td>");
        print("\n\t</tr>");
    }
}
