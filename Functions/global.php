<?php
include_once 'sql.php';
$melding = "";
$vraagBevestiging = true;
$gegevens = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
$producten = array();
$catagorieën = array(); 
$klanten = array(); 
$product = array();



function ProductenOverzichtBekijken($CiD) {
    global $producten;
    maakConnectiePDO();
    $producten = SelecteerProducten($CiD);
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
            print("<a href='product.php?Pid=".$product["StockItemID"]."'>");
            print("<img class='pic-1' src='images/240x250.png'>");
            print(" </a>");
            print("</div>");
            print("<div class='product-content'>");
            print("<h3 class='title'><a href='product.php?Pid=".$product["StockItemID"]."'>".$product["StockItemName"]."</a></h3>");
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
            print("<a href='producten.php?Cid=".$catagorie["StockGroupID"]."'>");
            print("<img class='pic-1' src='images/".$catagorie["StockGroupName"].".jpg'>");
            print(" </a>");
            print("</div>");
            print("<div class='product-content'>");
            print("<h3 class='title'><a href='producten.php?Cid=".$catagorie["StockGroupID"]."'>".$catagorie["StockGroupName"]."</a></h3>");
            print("</div>");
            print("</div>");
            print("</div>");
            $teller += 1;
    }
    echo "</div>";
}

function ProductOverzichtBekijken($PiD) {
    global $product;
    maakConnectiePDO();
    $product = SelecteerProduct($PiD);
    sluitConnectiePDO();
}

function ToonProduct() {
    global $product;
    echo "<div class='container'>";
        echo "<div class='row'>";
            echo "<h3 class='title'>".$product["StockItemName"]."</h3>";
        echo "</div>";
        echo "<div class='row'>";
            echo "<div class='col-md-3'>";
                echo "<img class='img-rounded' src='images/100x150.png' width='200' heigth='300'>";
                echo "<br/>";
                echo "<br/>";
                echo "<img class='img-rounded' src='images/100x150.png'>"; 
                echo " ";
                echo "<img class='img-rounded' src='images/100x150.png'>";
                echo "<br/>";
                echo "<br/>";
                echo "<img class='img-rounded' src='images/100x150.png'>";
                echo " ";
                echo "<img class='img-rounded' src='images/100x150.png'>";
            echo "</div>";
            echo "<div class='col-md-4'>";
                echo "<h3 class='title'>".$product["StockItemName"]."</h3>";
            echo "</div>";
            echo "<div class='col-md-5'>";
                echo "<div class='row'>";
                    echo "<iframe  width='100%' height='300' src='https://www.youtube.com/embed/MrYbBcvdzIY' align=right valing=right' frameborder='0' allowfullscreen></iframe>";
                echo "</div>";
                echo "<div class='row'>";
                echo "<div class='col-md-4>";
                    echo "<h3 class='title'>€".$product["UnitPrice"]."</h3>"; 
                echo "</div>";   
                echo "<div class='col-md-4>";
#aantal code

                echo "</div>";
                echo "<div class='col-md-4>";
#totaal prijs code 
                echo "</div>";
            echo "</div>";
        echo "</div>";
    echo "</div>";
}

function HomeProductenOverzichtBekijken() {
    global $producten;
    maakConnectiePDO();
    $producten = HomeProduct();
    sluitConnectiePDO();
}

function ToonHomeProducten() {
    global $producten;
    $teller = 0;
    $firstTime = true;
    echo "<div class='row'>";
    print("<div class='col-md-2'></div>");
    foreach ($producten as $product) {
        if($teller % 4 == 0 && $firstTime == false){
            echo "</div>";
            echo "<br/>\n<br/>\n<br/>\n";
            echo "<div class='row'>";
            print("<div class='col-md-2'></div>");
        }
            $firstTime = false;
            print("<div class='col-md-2'>");
            print("<div class='product-grid'>");
            print("<div class='product-image'>");
            print("<a href='product.php?Pid=".$product["StockItemID"]."'>");
            print("<img class='pic-1' src='images/240x250.png'>");
            print(" </a>");
            print("</div>");
            print("<div class='product-content'>");
            print("<h3 class='title'><a href='product.php?Pid=".$product["StockItemID"].".php'>".$product["StockItemName"]."</a></h3>");
            print("</div>");
            print("</div>");
            print("</div>");
            $teller += 1;
    }
    echo "</div>";
}