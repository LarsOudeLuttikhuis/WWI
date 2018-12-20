<?php
include 'navbar.php';
include 'Functions/global.php';
ProductenOverzichtBekijken();
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Klantenoverzicht</title>
    </head>
    <body>
        <form method="get" action="overzicht.php">
            <table>
                <tr><th>Nr</th><th>Naam</th><th>Woonplaats</th></tr>
                <?php ToonProducten(); ?>
                <tr>
                    <td><input type="text" name="nummer" size="4" value=""></td>
                    <td><input type="text" name="naam" value=""></td>
                    <td><input type="text" name="woonplaats" value=""></td>
                    <td><input type="submit" name="toevoegen" value="Toevoegen"></td>
                </tr>
            </table>
        </form>
        <?php print($melding); 
include 'footer.php';
?>