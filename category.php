<?php
include 'navbar.php';
include_once 'Functions/global.php';
CatagorieënOverzichtBekijken();
ToonCatagorieën();
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>