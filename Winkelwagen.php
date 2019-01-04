<?php
session_start();
if(isset($_POST["add_to_cart"]))
{
    if(isset($_SESSION["shopping_cart"]))
    {
$item_array_id = array_column($_SESSION["shopping_cart"], "item_id");
if(!in_array($_GET["id"], $item_array_id))
{
    $count = count($_SESSION["shopping_cart"]);
    $item_array = array(
        'item_id'   => $_GET["id"],
        'item_name'   => $_GET["hidden_name"],
        'item_price'   => $_GET["hidden_price"],
        'item_quantity'   => $_GET["quantity"],
   );
}
else{
    echo '<script>alert("Item Already Added")</script>';
    echo '<script>window.location="winkelwagen.php"</script>';
}
    }
    else
    {
$item_array = array(
     'item_id'   => $_GET["id"],
     'item_name'   => $_GET["hidden_name"],
     'item_price'   => $_GET["hidden_price"],
     'item_quantity'   => $_GET["quantity"],
);
$_SESSION["shopping_cart"][0] = $item_array;
    }
}
?>
<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
?>
<div class="jumbotron">
  <h1 class="display-4">Winkelwagen</h1>
    <div style="clear:both"></div>
  <br />
  <h3>Order Details</h3>
  <div class="table-responsive">
  <table class="table table-bordered">
  <tr>
  <th width="40%">Item Name</th>
  <th width="10%">Quantity</th>
  <th width="20%">Price</th>
  <th width="15%">Total</th>
  <th width="5%">Action</th>
  </tr>
  <?php 
  if(!empty($_session["shopping-cart"]))
  {
$total = 0;
foreach($_Session["shopping_cart"] as $key =>$values)
{
    ?>
    <tr>
    <td><?php echo $values["item_name"]?></td>
    <td><?php echo $values["item_quantity"]?></td>
    <td><?php echo $values["item_price"]?></td>
    <td><?php echo number_format($values["item_quantity"] * $values["item_price"], 2);?></td>
    <td><a href="winkelwagen.php?action=deleted&id=<?php echo $values["item_id"];?>"><span class="text-danger">Remove</span></a></td>

    </tr>
    <?php
    $total = $total + ($values["item_quantity"] * $values["item_price"]);
    }
  
  ?>  
  <tr>
  <td colspan="3" align="right">Total</td>
  <td align="right"><?php echo number_format($total , 2); ?></td>

  </tr>
  <?php
  }?>
  </table>
 </div>
</div>
<?php

sluitConnectiePDO();
include 'footer.php';
?>