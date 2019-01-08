<?php
include 'navbar.php';
include_once 'Functions/global.php';
HomeProductenOverzichtBekijken(1);
ToonHomeProducten(); 
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>