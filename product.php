<?php
include_once 'Functions/global.php';
include 'navbar.php';
$Pid = intval($_GET['Pid']);
ProductOverzichtBekijken($Pid);
ToonProduct();
sluitConnectiePDO();
include 'footer.php';
?>
