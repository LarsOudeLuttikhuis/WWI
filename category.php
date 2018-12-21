<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
CatagorieënOverzichtBekijken();
ToonCatagorieën();
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>