<?php
$message = "";
$resultaat = NULL;

# Controleer ingevoerde gegevens
function CheckLogin($user, $pass){
    global $connectie, $resultaat;
    maakConnectiePDO();
    $sql = "SELECT COUNT(*) FROM gebruikers WHERE Email = '".$user."' AND Wachtwoord = '".$pass."'";
    if ($res = $connectie->query($sql)) {

        /* Kijken of de query een resultaat geeft */
        if ($res->fetchColumn() > 0) {

            /* Query naam en email van gebruiker */
            $sql = "SELECT Voornaam, Email FROM gebruikers WHERE Email = '".$user."'";
            $res = $connectie->query($sql);

            $result = $res->fetch(\PDO::FETCH_ASSOC);
            $_SESSION["Voornaam"] = $result['Voornaam'];
            $_SESSION["Email"] = $result['Email'];
            print($_SESSION["Email"].'<br>');
            print($_SESSION["Voornaam"]);
            header('Location: home.php');
        }
        /* Wanneer er geen match is gevonden, login is onjuist */
        else {
            # "Deze combinatie van gebruikersnaam en wachtwoord komen niet voor."
            return False;
        }
    }

    $res = null;
    $conn = null;
}

# Registreer nieuwe gebruiker
function RegisterUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                                      $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord){
    global $connectie;
    maakConnectiePDO();
    $pass = hash("md5", $inputWachtwoord);
    $sql = $connectie->prepare("INSERT INTO gebruikers (Voornaam, Tussenvoegsels, Achternaam, Straat, Huisnummer, Postcode, Plaats, Telefoonnummer, Email, Wachtwoord) 
                                                      VALUES (:inputVoornaam, :inputTussenvoegsel, :inputAchternaam, :inputStraat, :inputHuisnummer, 
                                                                :inputPostcode, :inputPlaats, :inputTelefoon, :inputEmail, :pass)"); 
    $sql->execute([
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
    sluitConnectiePDO();
}

# Pas bestaande gebruiker aan
function EditUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                  $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord, $sessie_email){
    global $connectie;
    maakConnectiePDO();
    $pass = hash("md5", $inputWachtwoord);
    $sql = $connectie->prepare("UPDATE gebruikers SET Voornaam = :inputVoornaam, Tussenvoegsels = :inputTussenvoegsel, Achternaam = :inputAchternaam,
                                                Straat = :inputStraat, Huisnummer = :inputHuisnummer, Postcode = :inputPostcode, 
                                                Plaats = :inputPlaats, Telefoonnummer = :inputTelefoon, Email = :inputEmail, Wachtwoord = :pass
                                                WHERE Email = :sessie_email"); 
    $sql->execute([
        'inputVoornaam' => $inputVoornaam,
        'inputTussenvoegsel' => $inputTussenvoegsel,
        'inputAchternaam' => $inputAchternaam,
        'inputStraat' => $inputStraat,
        'inputHuisnummer' => $inputHuisnummer,
        'inputTelefoon' => $inputTelefoon,
        'inputPostcode' => $inputPostcode,
        'inputPlaats' => $inputPlaats,
        'inputEmail' => $inputEmail,
        'pass' => $inputWachtwoord,
        'sessie_email' => $sessie_email
    ]);
    sluitConnectiePDO();
}