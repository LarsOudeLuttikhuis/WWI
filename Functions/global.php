<?php
include_once 'sql.php';
session_start();
$melding = "";
$vraagBevestiging = true;
$gegevens = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
$producten = array();
$catagorieën = array();
$klanten = array();
$product = array();
$gegevens = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);


function ProductenOverzichtBekijken($CiD)
{
    global $producten;
    maakConnectiePDO();
    $producten = SelecteerProducten($CiD);
    sluitConnectiePDO();
    return $producten;
}

function CatagorieënOverzichtBekijken()
{
    global $catagorieën;
    maakConnectiePDO();
    $catagorieën = SelecteerCategorieën();
    sluitConnectiePDO();
    return $catagorieën;
}

function ProductOverzichtBekijken($PiD)
{
    global $product;
    maakConnectiePDO();
    $product = SelecteerProduct($PiD);
    sluitConnectiePDO();
    return $product;
}

function HomeProductenOverzichtBekijken()
{
    global $producten;
    maakConnectiePDO();
    $producten = HomeProduct();
    sluitConnectiePDO();
    return $producten;
}

function ToonWinkelWagen() 
{
    global $gegevens, $melding;
    if (!empty($gegevens["nummer"])) {
        maakConnectiePDO(); 
        $gegevens = SelecteerProduct($gegevens["nummer"]);
        sluitConnectiePDO();
    } else {
        $melding = "Het nummer ontbreekt";
    }
}

function CheckFormControl($naam) 
{
    return filter_has_var(INPUT_GET, $naam);
}
