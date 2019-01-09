<?php
include 'navbar.php';
include_once 'Functions/global.php';
HomeProductenOverzichtBekijken(1);
$teller = 0;
$firstTime = true;?>
    <div class='row'>
    <div class='col-md-2'></div>
    <?foreach ($producten as $product) {
        if ($teller % 4 == 0 && $firstTime == false) {?>
            </div>
            <br/><br/><br/>
            <div class='row'>
            <div class='col-md-2'></div>
        <?}
        $firstTime = false;?>
        <div class='col-md-2'>
        <div class='product-grid'>
        <div class='product-image'>
        <a href='product.php?Pid=<?echo $product["StockItemID"]?>'>
        <img class='pic-1' src='images/240x250.png'>
         </a>
        </div>
        <div class='product-content'>
        <h3 class='title'><a href='product.php?Pid=<?echo $product["StockItemID"]?>.php'><? echo $product["StockItemName"] ?></a></h3>
        <a class='btn btn-success' href='bevestiging.php?nummer=<? echo $product["StockItemID"]?>'>In Winkelwagen</a>
        </div>
        </div>
        </div>
        <?$teller += 1;
    }?>
    </div>
    <?
print($melding); 
include 'footer.php';
?>