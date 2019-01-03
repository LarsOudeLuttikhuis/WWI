<?php
$message = "";
$resultaat = NULL;
// function passwordCheck( $val1, $val2)
// {
//     $pass = hash("md5", $val2)
//     if($val1 == $val2)
//     {
//         $message = "";
//     }
//     else{
//         $message = "Wachtwoorden zijn niet het zelfde";
//     }
// }

// $query = mysql_query("SELECT user_id, username, userlevel
// FROM users 
// WHERE username = '$gebruiker' 
// AND password = '$wachtwoord' "); 

// function RegisterUser($user, $pass){
//     global $connectie, $resultaat;
//     $pass = hash("md5", $pass);
//     inputVoornaam, inputAchternaam, inputTussenvoegsel, inputTelefoon, inputStraat, inputHuisnummer, inputPostcode, inputPlaats, inputEmail, inputWachtwoord
//     $resultaat = $connectie->prepare("INSERT INTO gebruikers (Email, Wachtwoord, )Email='$user', Wachtwoord='$pass' "); 
//     $resultaat->execute();
//     return $resultaat->fetchAll();
// }

function CheckLogin($user, $pass) {
    global $connectie, $resultaat;
    $pass = hash("md5", $pass);
    $resultaat = $connectie->prepare("SELECT Email FROM gebruikers WHERE Email = '$user' AND Wachtwoord = '$pass' "); 
    $resultaat->execute();
    return $resultaat->fetchAll();
}

function CheckLogin2($user, $pass){
    global $connectie, $resultaat;
    maakConnectiePDO();
    $sql = "SELECT COUNT(*) FROM gebruikers WHERE Email = '".$user."' AND Wachtwoord = '".$pass."'";
    if ($res = $connectie->query($sql)) {

        /* Check the number of rows that match the SELECT statement */
        if ($res->fetchColumn() > 0) {
            print('ohyeayeayea');

            /* Issue the real SELECT statement and work with the results */
            $sql = "SELECT Voornaam, Email FROM gebruikers WHERE Email = '".$user."'";

            foreach ($conn->query($sql) as $row) {
                print "Name: " .  $row['NAME'] . "\n";
            }
        }
        /* No rows matched -- do something else */
        else {
            print "Deze combinatie van gebruikersnaam en wachtwoord komen niet voor.";
        }
    }

    $res = null;
    $conn = null;
}

function checkLogin3(){
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
}

// $sql = "INSERT INTO MyGuests (firstname, lastname, email)
// VALUES ('John', 'Doe', 'john@example.com')";

// if ($conn->query($sql) === TRUE) {
//     echo "New record created successfully";
// } else {
//     echo "Error: " . $sql . "<br>" . $conn->error;
// }