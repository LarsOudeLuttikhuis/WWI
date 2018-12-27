<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
homeproduct();
?>
<?php print($melding); 

sluitConnectiePDO();
include 'footer.php';
?>