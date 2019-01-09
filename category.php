<?php
include_once 'Functions/global.php';
include 'navbar.php';
CatagorieënOverzichtBekijken();
ToonCatagorieën();
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>
