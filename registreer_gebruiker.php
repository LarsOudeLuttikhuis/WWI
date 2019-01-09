<?php
include 'navbar.php';
require_once('Functions/global.php');
$connectie = NULL;
$resultaat = '';
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>kiek'n</title>
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

# insert data in table
function RegisterUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                                      $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord){
    global $connectie;#, $resultaat;
    maakConnectiePDO();
    $pass = hash("md5", $inputWachtwoord);
    $resultaat = $connectie->prepare("INSERT INTO gebruikers (Voornaam, Tussenvoegsels, Achternaam, Straat, Huisnummer, Postcode, Plaats, Telefoonnummer, Email, Wachtwoord) 
                                                      VALUES (:inputVoornaam, :inputTussenvoegsel, :inputAchternaam, :inputStraat, :inputHuisnummer, 
                                                                :inputPostcode, :inputPlaats, :inputTelefoon, :inputEmail, :pass)"); 
    $resultaat->execute([
        'inputVoornaam' => $inputVoornaam,
        'inputTussenvoegsel' => $inputTussenvoegsel,
        'inputAchternaam' => $inputAchternaam,
        'inputStraat' => $inputStraat,
        'inputHuisnummer' => $inputHuisnummer,
        'inputTelefoon' => $inputTelefoon,
        'inputPostcode' => $inputPostcode,
        'inputPlaats' => $inputPlaats,
        'inputEmail' => $inputEmail,
        'pass' => $pass
    ]);
    // return $resultaat->fetchAll();
}

$resultaat = RegisterUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                                      $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord);
sluitConnectiePDO();

print $resultaat;
?>

      

<?php 
include 'footer.php';
?>

    </body>
</html>