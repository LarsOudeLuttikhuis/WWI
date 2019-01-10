<?php
include_once "./Functions/global.php";
include 'navbar.php';

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
    #sleep(6);
    header('refresh:5; url=home.php');
}

$message = "<h3>Bestelling Geplaatst. U wordt over vijf seconden naar de homepagina gestuurd.</h3>";


#echo "<script type='text/javascript> alert('$message'); </script>";
print($message);

?>


    
<?php
include 'footer.php';
#header('refresh:5; Location: home.php');
doorsturen();
?>