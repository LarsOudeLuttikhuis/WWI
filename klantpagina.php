<!DOCTYPE html>
<?php
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
include_once 'navbar.php';
include_once 'Functions/login.php';
$resultaat = NULL;

$sessie_email = $_SESSION["Email"];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    # Controleren of het login formulier is gebruikt 
    if(isset($_POST["inputPassword"])){
        $pass = hash("md5", $inputWachtwoord);
    }
    # preset variables with value ''
    $inputVoornaam = $inputAchternaam = $inputTussenvoegsel = $inputTelefoon = $inputStraat = $inputHuisnummer = $inputPostcode = $inputPlaats = $inputEmail = $inputWachtwoord = '';

    if (isset($_POST['inputVoornaam'])){ $inputVoornaam .= $_POST["inputVoornaam"];}
    if (isset($_POST['inputAchternaam'])){ $inputAchternaam .= $_POST["inputAchternaam"];}
    if (isset($_POST['inputTussenvoegsel'])){ $inputTussenvoegsel .= $_POST["inputTussenvoegsel"];}
    if (isset($_POST['inputTelefoon'])){ $inputTelefoon .= $_POST["inputTelefoon"];}
    if (isset($_POST['inputStraat'])){ $inputStraat .= $_POST["inputStraat"];}
    if (isset($_POST['inputHuisnummer'])){ $inputHuisnummer .= $_POST["inputHuisnummer"];}
    if (isset($_POST['inputPostcode'])){ $inputPostcode .= $_POST["inputPostcode"];}
    if (isset($_POST['inputHuisnummer'])){ $inputPlaats .= $_POST["inputPlaats"];}
    if (isset($_POST['inputEmail'])){ $inputEmail .= $_POST["inputEmail"];}
    if (isset($_POST['inputWachtwoord'])){ $inputWachtwoord .= $_POST["inputWachtwoord"];}
    
    EditUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                  $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord, $sessie_email);
    
    
}


global $connectie, $resultaat;
maakConnectiePDO();
$email = $_SESSION["Email"];
$sql = "SELECT * FROM gebruikers WHERE Email = '".$email."'";
$res = $connectie->query($sql);

$result = $res->fetch(\PDO::FETCH_ASSOC);
$voornaam = $result['Voornaam'];
$tussenvoegsels = $result['Tussenvoegsels'];
$achternaam = $result['Achternaam'];
$email = $result['Email'];
$telefoon = $result['Telefoonnummer'];
$straatnaam = $result['Straat'];
$huisnummer = $result['Huisnummer'];
$postcode = $result['Postcode'];
$plaats = $result['Plaats'];
$wachtwoord = $result['Wachtwoord'];

?>


<div class="container">
	<div class="row">
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>Your Profile</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form method="post" action="klantpagina.php">
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">Voornaam*</label> 
                                <div class="col-8">
                                  <input id="Naam" name="inputVoornaam" placeholder="Voornaam" value="<?php print($voornaam); ?>" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Tussenvoegsel" class="col-4 col-form-label">Tussenvoegsel</label> 
                                <div class="col-8">
                                  <input id="Tussenvoegsel" name="inputTussenvoegsel" value="<?php print($tussenvoegsels); ?>"placeholder="Tussenvoegsel" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Achternaam" class="col-4 col-form-label">Achternaam*</label> 
                                <div class="col-8">
                                  <input id="Achternaam" name="inputAchternaam" value="<?php print($achternaam); ?>"placeholder="Achternaam" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Telefoonummer*</label> 
                                <div class="col-8">
                                  <input id="text" name="inputTelefoon" placeholder="Telefoonnummer" value="<?php print($telefoon); ?>"class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="straatnaam" class="col-4 col-form-label">Straatnaam*</label> 
                                <div class="col-8">
                                  <input id="straatnaam" name="inputStraat" value="<?php print($straatnaam); ?>"placeholder="straatnaam" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="huisnummer" class="col-4 col-form-label">Huisnummer*</label> 
                                <div class="col-8">
                                  <input id="huisnummer" name="inputHuisnummer" value="<?php print($huisnummer); ?>"placeholder="huisnummer" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Woonplaats" class="col-4 col-form-label">Woonplaats*</label> 
                                <div class="col-8">
                                  <input id="Woonplaats" name="inputPlaats" value="<?php print($plaats); ?>"placeholder="Woonplaats" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Postcode" class="col-4 col-form-label">Postcode*</label> 
                                <div class="col-8">
                                  <input id="Postcode" name="inputPostcode" value="<?php print($postcode); ?>"placeholder="Postcode" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Email*</label> 
                                <div class="col-8">
                                  <input id="email" name="inputEmail" placeholder="Email" value="<?php print($email); ?>"class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                              <label for="password" class="col-4 col-form-label">Wachtwoord*</label> 
                                <input type="password" class="form-control" name="inputWachtwoord" placeholder="Wachtwoord"> 
                            </div>
                            <div class="form-group row">
                            <label for="password2" class="col-4 col-form-label">Wachtwoord*</label> 
                                <input type="password" class="form-control" name="inputWachtwoord2" placeholder="Wachtwoord"> 
                            </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button name="submit" type="submit" class="btn btn-primary">Opslaan</button>
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

</html>