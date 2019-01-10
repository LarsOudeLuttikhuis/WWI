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



unset($_SESSION['shopping_cart']);


function doorsturen(){
    header('refresh:5; url=home.php');
}

$message = "<h3>Bestelling Geplaatst. U wordt over vijf seconden naar de homepagina gestuurd.</h3>";

print($message);
doorsturen();
?>


    
<?php
include 'footer.php';

?>
