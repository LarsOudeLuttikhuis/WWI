<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
homeproduct($home);
print($melding); 

sluitConnectiePDO();
include 'footer.php';
?>