<?php
$message = "";
function passwordCheck( $val1, $val2)
{
    if($val1 == $val2)
    {
        $message = "";
    }
    else{
        $message = "Wachtwoorden zijn niet het zelfde";
    }
}