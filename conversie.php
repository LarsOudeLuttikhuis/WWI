<?php
include_once 'Functions/global.php';
include_once 'navbar.php';
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Klantenoverzicht</title>
    </head>
    <body>
    
    <?php
    
    global $connectie, $resultaat;
    maakConnectiePDO();
    # sql select voor het aantal bezoekers
    $sql = "SELECT COUNT(*) aantal FROM bezoeken";
    if ($res = $connectie->query($sql)) {
        $result = $res->fetch(\PDO::FETCH_ASSOC);
        $totaal_bezoeken = $result['aantal'];
    }
    # sql select voor het de verkopen
    $sql = "SELECT COUNT(*) aantal, SUM(bedrag) totaal FROM conversie";
    if ($res = $connectie->query($sql)) {
        $result = $res->fetch(\PDO::FETCH_ASSOC);
        $aantal_bestellingen = $result['aantal'];
        $totaal_besteed = $result['totaal'];
        if (!is_numeric($totaal_bezoeken) && !is_numeric($aantal_bestellingen)){
            $conversie = 'n.v.t.';
        } else {
            $conversie = 100 / $totaal_bezoeken * $aantal_bestellingen;
        }
        if ($aantal_bestellingen > 0){
            $gemiddelde_besteding = $totaal_besteed / $aantal_bestellingen;
            $gemiddelde_besteding = '&euro;'.$gemiddelde_besteding;
        } else {
            $gemiddelde_besteding = 'n.v.t.';
        }
        if (!is_numeric($totaal_besteed)){
            $totaal_besteed = 'n.v.t.';
        } else {
            $totaal_besteed = '&euro;'.$totaal_besteed;
        }       
    }
    
        
    print('<h2>Aantal bezoeken: '.$totaal_bezoeken.'</h2>');
    print('<h2>Aantal bestellingen: '.$aantal_bestellingen.'</h2>');
    print('<h2>Totaal besteed: '.$totaal_besteed.'</h2>');
    print('<h2>Gemiddelde besteding: '.$gemiddelde_besteding.'</h2>');
    print('<h2>Conversieratio: '.number_format($conversie, 2).'%</h2>');

        
include 'footer.php';
?>

    </body>
</html>
