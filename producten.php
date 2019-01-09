<?php
include 'navbar.php';
include_once 'Functions/global.php';
$CiD = intval($_GET['Cid']);
ProductenOverzichtBekijken($CiD);
print($melding); 
$teller = 0;
$firstTime = true;
?>
    <div class='row'>";
    <div class='col-md-1'></div>
    <?foreach ($producten as $product) {
        if ($teller % 5 == 0 && $firstTime == false) {
            ?>
            </div>
            <br/><br/><br/>
            <div class='row'>
            <div class='col-md-1'></div>
            <?
        }?>
        <?$firstTime = false;?>
        <div class='col-md-2'>
        <div class='product-grid'>
        <div class='product-image'>
        <a href='product.php?Pid=<? echo $product["StockItemID"]?>'>
        <img class='pic-1' src='images/240x250.png'>
         </a>
        </div>
        <div class='product-content'>
        <h3 class='title'><a href='product.php?Pid=<? echo $product["StockItemID"] ?>'><? echo $product["StockItemName"] ?></a></h3>
        <a class='btn btn-success' href='bevestiging.php?nummer=<? echo $product["StockItemID"]?>'>In Winkelwagen</a>
        </div>
        </div>
        </div>
        <?$teller += 1;?>
    <?}?>
    </div>";
<?php
include 'footer.php';
?>