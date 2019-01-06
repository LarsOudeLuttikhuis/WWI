<?php
include 'navbar.php';
require_once('Functions/global.php');
require_once('Functions/login.php');
$connectie = NULL;
$resultaat = '';
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registreren afronden</title>
    </head>
    <body>

<?php 
# preset variables with value ''
$inputVoornaam = $inputAchternaam = $inputTussenvoegsel = $inputTelefoon = $inputStraat = $inputHuisnummer = $inputPostcode = $inputPlaats = $inputEmail = $inputWachtwoord = '';

# if variable was set in the form, add form data to the variables
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

if (!$errors) {
    $resultaat = RegisterUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                                      $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord);
}

print $resultaat;
?>

      

<?php 
include 'footer.php';
?>

    </body>
</html>