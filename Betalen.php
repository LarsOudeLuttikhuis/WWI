<?php
include_once "./Functions/global.php";
include 'navbar.php';

if (isset($_SESSION["total_cost"])){
    global $connectie;
    maakConnectiePDO();
    $sql = $connectie->prepare("INSERT INTO conversie (bedrag) VALUES (:bedrag)"); 
    $sql->execute([
        'bedrag' => $_SESSION["total_cost"]
    ]);
    sluitConnectiePDO();
}

if (isset($inputEmail)) {
    $inputVoornaam = $_SESSION["Voornaam"];
    $inputEmail = $_SESSION["Email"];
} else {
    $inputVoornaam = '';
    $inputEmail = '';
}

session_unset();

$_SESSION["Voornaam"] = $inputVoornaam;
$_SESSION["Email"] = $inputEmail;


function doorsturen(){
    header('refresh:5; url=home.php');
}

print("<h3>Bestelling Geplaatst. U wordt over vijf seconden naar de homepagina gestuurd.</h3>");

?>


    
<?php
include 'footer.php';
doorsturen();
?>
