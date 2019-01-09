<?php
include_once 'Functions/global.php';
include_once 'navbar.php';

unset($_SESSION['Email']);
unset($_SESSION['Voornaam']);
session_destroy();
header('Location: home.php');
?>
