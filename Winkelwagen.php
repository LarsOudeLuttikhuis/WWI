<?php
include_once 'Functions/global.php';
include 'navbar.php';
include_once 'Functions/sql.php';

?>
<div class="jumbotron"
<?php
if(isset($_POST["add_to_cart"]))
{
    
    echo '<h2>Winkelwagen</h2>';
    echo ' <div style="clear:both"></div>';
    echo ' <div class="col-md-12">';
  
	if(isset($_SESSION["shopping_cart"]))
	{
		$item_array_id = array_column($_SESSION["shopping_cart"], "item_id");
		if(!in_array($_GET["id"], $item_array_id))
		{
			$count = count($_SESSION["shopping_cart"]);
			$item_array = array(
				'item_id'			=>	$_GET["id"],
				'item_name'			=>	$_POST["hidden_name"],
				'item_price'		=>	$_POST["hidden_price"],
				'item_quantity'		=>	$_POST["quantity"]
			);
			$_SESSION["shopping_cart"][$count] = $item_array;
		}
		else
		{
			echo '<script>alert("Item Already Added")</script>';
		}
	}
	else
	{
		$item_array = array(
			'item_id'			=>	$_GET["id"],
			'item_name'			=>	$_POST["hidden_name"],
			'item_price'		=>	$_POST["hidden_price"],
			'item_quantity'		=>	$_POST["quantity"]
		);
		$_SESSION["shopping_cart"][0] = $item_array;
	}
}
if(isset($_GET["action"]))
{
	if($_GET["action"] == "delete")
	{
		foreach($_SESSION["shopping_cart"] as $keys => $values)
		{
			if($values["item_id"] == $_GET["id"])
			{
				unset($_SESSION["shopping_cart"][$keys]);
				echo '<script>alert("Item Removed")</script>';
				echo '<script>window.location="Winkelwagen.php"</script>';
			}
		}
	}
}           
                    if(empty($_SESSION["shopping_cart"]))
                    {
                        echo ("<h3>Uw winkelwagen is leeg.</h3>");
                    }
                    else{
                        echo"<h4>Order Details</h4>";
                    echo"<div class='table-responsive'>";
                    echo"<table class='table table-bordered'>";                    
					echo" <tr>";    
					echo"<th width='20%'>Item Image</th>";                   
                    echo"<th width='40%'>Item Name</th>";                    
                    echo"<th width='10%'>Quantity</th>";                    
                    echo"<th width='20%'>Price</th>";                    
                    echo"<th width=15%>Total</th>";                    
                    echo"<th width=5%>Action</th>";                    
                    echo"</tr>";  
					if(!empty($_SESSION["shopping_cart"]))
					{
						$total = 0;
						foreach($_SESSION["shopping_cart"] as $keys => $values)
						{
					?>
					<tr>
						<td><img class='pic-1' src='images/240x250.png'></td>
						<td><?php echo $values["item_name"]; ?></td>
						<td><?php echo $values["item_quantity"]; ?></td>
						<td>€<?php echo $values["item_price"]; ?></td>
						<td>€<?php echo number_format($values["item_quantity"] * $values["item_price"], 2);?></td>
						<td><a href="Winkelwagen.php?action=delete&id=<?php echo $values["item_id"]; ?>"><span class="text-danger">Remove</span></a></td>
					</tr>
					<?php
							$total = $total + ($values["item_quantity"] * $values["item_price"]);
						}
						$_SESSION['total_cost'] = $total;
					?>
					<tr>
						<td colspan="3" class="align-right">Total</td>
						<td class="align-right">€<?php echo number_format($total, 2); ?></td>
						<td></td>
					</tr>
					<?php
                    }
					}
					?>
						
				<table class="align-right">
				<?php
				echo "<form action='Checkoutpagina.php?'>";
				echo "<input type='submit' name='add_to_cart' style='margin-top:5px; float: right; margin-right: 15px;' class='align-right btn btn-success' value='Naar checkout pagina'/>";
				echo "</form> &nbsp;&nbsp;" ;
                echo "<form class='align-right' action='category.php?'>";
                echo "<input type='submit' name='' style='margin-top:5px; float: right; margin-right: 15px' class='btn btn-success align-right' value='Verder winkelen'/>";
				echo "</form>";
				?>  </table>
			</div>
            </div>
            <?php

sluitConnectiePDO();
include 'footer.php';
?>
