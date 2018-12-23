<?php
include_once 'sql.php';
$melding = "";
$vraagBevestiging = true;
$gegevens = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
$producten = array();
$catagorieën = array(); 
$klanten = array(); 
$product = array();

function ProductenOverzichtBekijken($CatogarieID) {
    global $producten;
    maakConnectiePDO();
    $producten = SelecteerProducten($CatogarieID);
    sluitConnectiePDO();
}

function ToonProducten() {
    global $producten;
    $teller = 0;
    $firstTime = true;
    echo "<div class='row'>";
    print("<div class='col-md-1'></div>");
    foreach ($producten as $product) {
        if($teller % 5 == 0 && $firstTime == false){
            echo "</div>";
            echo "<br/>\n<br/>\n<br/>\n";
            echo "<div class='row'>";
            print("<div class='col-md-1'></div>");
        }
            $firstTime = false;
            print("<div class='col-md-2'>");
            print("<div class='product-grid'>");
            print("<div class='product-image'>");
            print("<a href='#.php'>");
            print("<img class='pic-1' src='images/240x250.png'>");
            print(" </a>");
            print("</div>");
            print("<div class='product-content'>");
            print("<h3 class='title'><a href='product.php?id=".$product["StockItemID"]."'>".$product["StockItemName"]."</a></h3>");
            print("</div>");
            print("</div>");
            print("</div>");
            $teller += 1;
    }
    echo "</div>";
}

function CatagorieënOverzichtBekijken() {
    global $catagorieën;
    maakConnectiePDO();
    $catagorieën = SelecteerCategorieën();
    sluitConnectiePDO();
}

function ToonCatagorieën() {
    global $catagorieën;
    $teller = 0;
    $firstTime = true;
    echo "<div class='row'>";
    print("<div class='col-md-1'></div>");
    foreach ($catagorieën as $catagorie) {
        if($teller % 5 == 0 && $firstTime == false){
            echo "</div>";
            echo "<br/>\n<br/>\n<br/>\n";
            echo "<div class='row'>";
            print("<div class='col-md-1'></div>");
        }
            $firstTime = false;
            print("<div class='col-md-2'>");
            print("<div class='product-grid'>");
            print("<div class='product-image'>");
            print("<a href='".$catagorie["StockGroupName"].".php'>");
            print("<img class='pic-1' src='images/".$catagorie["StockGroupName"].".jpg'>");
            print(" </a>");
            print("</div>");
            print("<div class='product-content'>");
            print("<h3 class='title'><a href='".$catagorie["StockGroupName"].".php'>".$catagorie["StockGroupName"]."</a></h3>");
            print("</div>");
            print("</div>");
            print("</div>");
            $teller += 1;
    }
    echo "</div>";
}

function ProductOverzichtBekijken($ProductID) {
    global $product;
    maakConnectiePDO();
    $product = SelecteerProduct($ProductID);
    sluitConnectiePDO();
}

function ToonProduct() {
    global $product;
    echo "<div class='row'>";
    echo "<div class='col-md-1'></div>";
    echo "</div>";
    echo "<br/>\n<br/>\n<br/>\n";
    echo "<div class='row'>";
    echo "<div class='col-md-1'></div>";
    echo "<div class='col-md-2'>";
    echo "<div class='product-grid'>";
    echo "<div class='product-image'>";
    echo "<a href='#.php'>";
    echo "<img class='pic-1' src='images/240x250.png'>";
    echo " </a>";
    echo "</div>";
    echo "<div class='product-content'>";
    echo "<h3 class='title'><a href='#'>".$product["StockItemName"]."</a></h3>";
    echo "</div>";
    echo "</div>";
    echo "</div>";
    echo "</div>";
}