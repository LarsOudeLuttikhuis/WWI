

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




function homeproduct($homeproduct) {
    global $homeproduct;
    $teller = 0;
    $firstTime = true;
    echo "<div class='row'>";
    print("<div class='col-md-1'></div>");
    foreach ($producten as $homeproduct) {
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
            print("<h3 class='title'><a href='product.php?id=".$homeproduct["StockItemID"]."'>".$homeproduct["StockItemName"]."</a></h3>");
            print("</div>");
            print("</div>");
            print("</div>");
            $teller += 1;
    }
    echo "</div>";
}