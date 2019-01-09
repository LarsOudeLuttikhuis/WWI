<?php include_once 'Functions/global.php'; ?>
<?php include_once 'navbar.php'; ?>
<?php include_once 'Functions/login.php'?>
<?php include_once 'Functions/sql.php'?>
<div class="jumbotron"
<?php
session_start();
if(isset($_POST["add_to_cart"]))
{
    
    echo '<h3 class="display-4">Winkelwagen</h3>';
    echo ' <div style="clear:both"></div>';
    echo ' <div class="col-md-4">';
  
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
				echo '<script>window.location="winkelwagen.php"</script>';
			}
		}
	}
}

?>

<?php        
           
                    if(empty($_SESSION["shopping_cart"]))
                    {
                        echo ("<h3>Uw winkelwagen is leeg.</h3>");
                    }
                    else{
                        echo"<h3>Order Details</h3>";
                    echo"<div class='table-responsive'>";
                    echo"<table class='table table-bordered'>";                    
                    echo" <tr>";                    
                    echo"<th width='30%'>Item Name</th>";                    
                    echo"<th width='20%'>Quantity</th>";                    
                    echo"<th width='20%'>Price</th>";                    
                    echo"<th width=15%>Total</th>";                                    
                    echo"</tr>";  
					if(!empty($_SESSION["shopping_cart"]))
					{
						$total = 0;
						foreach($_SESSION["shopping_cart"] as $keys => $values)
						{
					?>
					<tr>
						<td><?php echo $values["item_name"]; ?></td>
						<td><?php echo $values["item_quantity"]; ?></td>
						<td>€<?php echo $values["item_price"]; ?></td>
						<td>€<?php echo number_format($values["item_quantity"] * $values["item_price"], 2);?></td>
					</tr>
					<?php
							$total = $total + ($values["item_quantity"] * $values["item_price"]);
						}
					?>
					<tr>
						<td colspan="3" align="right">Total</td>
						<td align="left">€<?php echo number_format($total, 2); ?></td>
					</tr>
					<?php
                    }
					}
					?>
						
				</table>
			</div>
            </div>
    <div class="container">
    <?php
    $errors = $voornaamError = $achternaamError = $straatError = $huisnummerError = $postcodeError = $plaatsError = 
    $emailError = $passError1 = $passError2 = $pass_errors = False;

# Controleren of er input is vanuit de pagina.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    # Controleren of het login formulier is gebruikt 
    if (isset($_POST['loginFormulier'])) {
        if (isset($_POST['inputEmail']) && isset($_POST['inputPassword'])){
            $email = $_POST["inputEmail"];
            $pass = hash("md5", $_POST["inputPassword"]);
            CheckLogin($email, $pass);
        } else {
            $email = $_POST["inputEmail"];
            $pass = '';
            CheckLogin($email, $pass);
        }
    # Anders het registreerformulier afhandelen
    } else {
        # preset variables with value ''
        $inputVoornaam = $inputAchternaam = $inputTussenvoegsel = $inputTelefoon = $inputStraat = $inputHuisnummer = 
            $inputPostcode = $inputPlaats = $inputEmail = $inputWachtwoord = $inputWachtwoord2 = '';
        #$errors = False;
        # if variable was set in the form, add form data to the variables
        if (isset($_POST['inputVoornaam']) && $_POST['inputVoornaam'] != ''){ 
            $inputVoornaam .= $_POST["inputVoornaam"];
        } else {$voornaamError = True; $errors = True;}
        if (isset($_POST['inputAchternaam']) && $_POST['inputAchternaam'] != ''){ 
            $inputAchternaam .= $_POST["inputAchternaam"];
        } else {$achternaamError = True; $errors = True;}
        if (isset($_POST['inputTussenvoegsel'])){ $inputTussenvoegsel .= $_POST["inputTussenvoegsel"];}
        if (isset($_POST['inputTelefoon'])){ $inputTelefoon .= $_POST["inputTelefoon"];}
        if (isset($_POST['inputStraat']) && $_POST['inputStraat'] != ''){ 
            $inputStraat .= $_POST["inputStraat"];
        } else {$straatError = True; $errors = True;}
        if (isset($_POST['inputHuisnummer']) && $_POST['inputHuisnummer'] != ''){ 
            $inputHuisnummer .= $_POST["inputHuisnummer"];
        } else {$huisnummerError = True; $errors = True;}
        if (isset($_POST['inputPostcode']) && $_POST['inputPostcode'] != ''){ 
            $inputPostcode .= $_POST["inputPostcode"];
        } else {$postcodeError = True; $errors = True;}
        if (isset($_POST['inputPlaats']) && $_POST['inputPlaats'] != ''){ 
            $inputPlaats .= $_POST["inputPlaats"];
        } else {$plaatsError = True; $errors = True;}
        if (isset($_POST['inputEmail']) && $_POST['inputEmail'] != ''){ 
            $inputEmail .= $_POST["inputEmail"];
        } else {$emailError = True; $errors = True;}
        if (isset($_POST['inputWachtwoord']) && $_POST['inputWachtwoord'] != ''){ 
            $inputWachtwoord .= $_POST["inputWachtwoord"];
        } else {$passError1 = True; $errors = True;}
        if (isset($_POST['inputWachtwoord2']) && $_POST['inputWachtwoord2'] != ''){ 
            $inputWachtwoord2 .= $_POST["inputWachtwoord2"];
        } else {$passError2 = True; $errors = True;}
        if ($inputWachtwoord2 != $inputWachtwoord) {$pass_errors = True; $errors = True;}

        #print('voornaam is '.var_export($voornaamError)."achternaam: ".var_export($achternaamError));
        # Wanneer er geen velden zijn vergeten wordt de functie RegisterUser uitgevoerd.
        if (!$errors) {
            $resultaat = RegisterUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                                            $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord);
        }

    }

# Als het geen POST request betreft:
} else {
    $inputVoornaam = $inputAchternaam = $inputTussenvoegsel = $inputTelefoon = $inputStraat = $inputHuisnummer = $inputPostcode = $inputPlaats = $inputEmail = $inputWachtwoord = $inputWachtwoord2 = '';

    if (isset($_POST['inputVoornaam'])){ $inputVoornaam .= $_POST["inputVoornaam"];}
    if (isset($_POST['inputAchternaam'])){ $inputAchternaam .= $_POST["inputAchternaam"];}
    if (isset($_POST['inputTussenvoegsel'])){ $inputTussenvoegsel .= $_POST["inputTussenvoegsel"];}
    if (isset($_POST['inputTelefoon'])){ $inputTelefoon .= $_POST["inputTelefoon"];}
    if (isset($_POST['inputStraat'])){ $inputStraat .= $_POST["inputStraat"];}
    if (isset($_POST['inputHuisnummer'])){ $inputHuisnummer .= $_POST["inputHuisnummer"];}
    if (isset($_POST['inputPostcode'])){ $inputPostcode .= $_POST["inputPostcode"];}
    if (isset($_POST['inputPlaats'])){ $inputPlaats .= $_POST["inputPlaats"];}
    if (isset($_POST['inputEmail'])){ $inputEmail .= $_POST["inputEmail"];}
    if (isset($_POST['inputWachtwoord'])){ $inputWachtwoord .= $_POST["inputWachtwoord"];}
    
    }
?>
	<div class="row">
		<div class="col-md-12">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-6">
                        <div align="center">
		                    <h4>Leveradres</h4>
		                </div></div>
                        <div class="col-md-6">
                        <div align="center">
                        <h4>Factuuradres</h4>
                        </div></div>
		            </div>
		            <div class="row">
		                <div class="col-md-3">
		                    <form method="post" action="klantpagina.php">
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">Straatnaam*</label> 
                                <div class="col-8">
                                  <input id="Straat" name="inputStraat" placeholder="Straat" value="<?php print($Straat); ?>" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Tussenvoegsel" class="col-4 col-form-label">Plaats*</label> 
                                <div class="col-8">
                                  <input id="Tussenvoegsel" name="inputTussenvoegsel" value="<?php print($tussenvoegsels); ?>"placeholder="Tussenvoegsel" class="form-control here" type="text">
                                </div>
                              </div></div>
                              <div class="col-md-3">
                              <div class="form-group row">
                                <label for="Achternaam" class="col-4 col-form-label">Huisnummer*</label> 
                                <div class="col-8">
                                  <input id="Achternaam" name="inputAchternaam" value="<?php print($achternaam); ?>"placeholder="Achternaam" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Postcode*</label> 
                                <div class="col-8">
                                  <input id="text" name="inputTelefoon" placeholder="Telefoonnummer" value="<?php print($telefoon); ?>"class="form-control here" required="required" type="text">
                                </div>
                              </div></div>
                              <div class="col-md-3">
                              <div class="form-group row">
                                <label for="straatnaam" class="col-4 col-form-label">Straatnaam*</label> 
                                <div class="col-8">
                                  <input id="straatnaam" name="inputStraat" value="<?php print($straatnaam); ?>"placeholder="straatnaam" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="huisnummer" class="col-4 col-form-label">Plaats*</label> 
                                <div class="col-8">
                                  <input id="huisnummer" name="inputHuisnummer" value="<?php print($huisnummer); ?>"placeholder="huisnummer" class="form-control here" type="text">
                                </div>
                              </div></div>
                              <div class="col-md-3">
                              <div class="form-group row">
                                <label for="Woonplaats" class="col-4 col-form-label">Huisnummer*</label> 
                                <div class="col-8">
                                  <input id="Woonplaats" name="inputPlaats" value="<?php print($plaats); ?>"placeholder="Woonplaats" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Postcode" class="col-4 col-form-label">Postcode*</label> 
                                <div class="col-8">
                                  <input id="Postcode" name="inputPostcode" value="<?php print($postcode); ?>"placeholder="Postcode" class="form-control here" type="text">
                                </div>
                              </div></div>
                              <div class="col-md-12"style="padding-right: 0px;padding-left: 0px;">
                              <div class="col-md-9"></div>
                              <div class="col-md-3">
                              <div style="text-align:right;">
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Total Quantity</label> 
                                <div class="col-8">
                                  <input id="email" name="inputEmail" placeholder="Email" value="<?php print($email); ?>"class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                <tr>
						<td colspan="3" align="right">Total</td>
						<td align="right">€<?php echo number_format($total, 2); ?></td>
						<td></td>
					    </tr>
                                <button type="button" class="btn btn-primary" onclick="alert('Send to IDeal')">Betalen</button>
                                </div>
                              </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
<?php
sluitConnectiePDO();
include 'footer.php';
?>