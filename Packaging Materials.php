<?php
include 'navbar.php';
include 'Functions/global.php';
include 'Functions/sql.php';
ProductenOverzichtBekijken(10);
ToonProducten(); 
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>