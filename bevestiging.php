<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
ToonWinkelWagen();
?>
<div class="jumbotron">
  <h3 class="display-4">Deze product opslaan in uw winkelwagen?</h3>
    <div style="clear:both"></div>
    <div class="col-md-4">
    <?php
    if ($gegevens["StockItemID"] > 0) { ?>
				<form method="post" action="winkelwagen.php?action=add&id=<?php echo $gegevens["StockItemID"]; ?>">
						<h4 class="text-info"><?php echo $gegevens["StockItemName"]; ?></h4>
						<h4 class="text-danger">$ <?php echo $gegevens["UnitPrice"]; ?></h4>
						<input type="text" name="quantity" value="1" class="form-control" />
						<input type="hidden" name="hidden_name" value="<?php echo $gegevens["StockItemName"]; ?>" />
						<input type="hidden" name="hidden_price" value="<?php echo $gegevens["UnitPrice"]; ?>" />
						<input type="submit" name="add_to_cart" style="margin-top:5px;" class="btn btn-success" value="Opslaan" />
				</form>
                <?php 
            } ?>
			</div>
  <br /> 			
<?php
sluitConnectiePDO();
include 'footer.php';

?>