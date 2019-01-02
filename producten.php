<?php
include 'navbar.php';
include_once 'Functions/global.php';
$CiD = intval($_GET['Cid']);
ProductenOverzichtBekijken($CiD);
ToonProducten();
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>