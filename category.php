<?php
include 'navbar.php';
include_once 'Functions/global.php';
CatagorieënOverzichtBekijken();
print($melding); 
$teller = 0;
$firstTime = true;
?>
    <div class='row'>
    <div class='col-md-1'></div>
    <?foreach ($catagorieën as $catagorie) {
        if ($teller % 5 == 0 && $firstTime == false) {?>
            </div>
            <br/>\n<br/>\n<br/>\n
            <div class='row'>
            <div class='col-md-1'></div>
        <?}
        $firstTime = false;?>
        <div class='col-md-2'>
        <div class='product-grid'>
        <div class='product-image'>
        <a href='producten.php?Cid=<?echo $catagorie["StockGroupID"] ?>'>
        <img class='pic-1' src='images/<? echo $catagorie["StockGroupName"] ?>.jpg'>
         </a>
        </div>
        <div class='product-content'>
        <h3 class='title'><a href='producten.php?Cid=<?echo $catagorie["StockGroupID"]?>'><? echo $catagorie["StockGroupName"] ?></a></h3>
        </div>
        </div>
        </div>
        <?$teller += 1;
    }?>
    </div>
<?php
include 'footer.php';
?>