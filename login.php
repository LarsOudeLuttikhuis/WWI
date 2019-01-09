<?php include_once 'Functions/global.php'; ?>
<?php include_once 'navbar.php'; ?>
<?php include_once 'Functions/login.php'?>
<?php include_once 'Functions/sql.php'?>
<?php
$errors = $voornaamError = $achternaamError = $straatError = $huisnummerError = $postcodeError = $plaatsError = 
    $emailError = $passError1 = $passError2 = $pass_errors = False;

# Controleren of er input is vanuit de pagina.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    # Controleren of het login formulier is gebruikt 
    if (isset($_POST['loginFormulier'])) {
        if (isset($_POST['inputEmail']) && isset($_POST['inputPassword'])){
            $email = $_POST["inputEmail"];
            $pass = hash("md5", $_POST["inputPassword"]);
            CheckLogin($email, $pass);
        } else {
            $email = $_POST["inputEmail"];
            $pass = '';
            CheckLogin($email, $pass);
        }
    # Anders het registreerformulier afhandelen
    } else {
        # preset variables with value ''
        $inputVoornaam = $inputAchternaam = $inputTussenvoegsel = $inputTelefoon = $inputStraat = $inputHuisnummer = 
            $inputPostcode = $inputPlaats = $inputEmail = $inputWachtwoord = $inputWachtwoord2 = '';
        #$errors = False;
        # if variable was set in the form, add form data to the variables
        if (isset($_POST['inputVoornaam']) && $_POST['inputVoornaam'] != ''){ 
            $inputVoornaam .= $_POST["inputVoornaam"];
        } else {$voornaamError = True; $errors = True;}
        if (isset($_POST['inputAchternaam']) && $_POST['inputAchternaam'] != ''){ 
            $inputAchternaam .= $_POST["inputAchternaam"];
        } else {$achternaamError = True; $errors = True;}
        if (isset($_POST['inputTussenvoegsel'])){ $inputTussenvoegsel .= $_POST["inputTussenvoegsel"];}
        if (isset($_POST['inputTelefoon'])){ $inputTelefoon .= $_POST["inputTelefoon"];}
        if (isset($_POST['inputStraat']) && $_POST['inputStraat'] != ''){ 
            $inputStraat .= $_POST["inputStraat"];
        } else {$straatError = True; $errors = True;}
        if (isset($_POST['inputHuisnummer']) && $_POST['inputHuisnummer'] != ''){ 
            $inputHuisnummer .= $_POST["inputHuisnummer"];
        } else {$huisnummerError = True; $errors = True;}
        if (isset($_POST['inputPostcode']) && $_POST['inputPostcode'] != ''){ 
            $inputPostcode .= $_POST["inputPostcode"];
        } else {$postcodeError = True; $errors = True;}
        if (isset($_POST['inputPlaats']) && $_POST['inputPlaats'] != ''){ 
            $inputPlaats .= $_POST["inputPlaats"];
        } else {$plaatsError = True; $errors = True;}
        if (isset($_POST['inputEmail']) && $_POST['inputEmail'] != ''){ 
            $inputEmail .= $_POST["inputEmail"];
        } else {$emailError = True; $errors = True;}
        if (isset($_POST['inputWachtwoord']) && $_POST['inputWachtwoord'] != ''){ 
            $inputWachtwoord .= $_POST["inputWachtwoord"];
        } else {$passError1 = True; $errors = True;}
        if (isset($_POST['inputWachtwoord2']) && $_POST['inputWachtwoord2'] != ''){ 
            $inputWachtwoord2 .= $_POST["inputWachtwoord2"];
        } else {$passError2 = True; $errors = True;}
        if ($inputWachtwoord2 != $inputWachtwoord) {$pass_errors = True; $errors = True;}

        #print('voornaam is '.var_export($voornaamError)."achternaam: ".var_export($achternaamError));
        # Wanneer er geen velden zijn vergeten wordt de functie RegisterUser uitgevoerd.
        if (!$errors) {
            $resultaat = RegisterUser($inputVoornaam, $inputAchternaam, $inputTussenvoegsel, $inputTelefoon, $inputStraat, $inputHuisnummer, 
                                            $inputPostcode, $inputPlaats, $inputEmail, $inputWachtwoord);
        }

    }

# Als het geen POST request betreft:
} else {
    $inputVoornaam = $inputAchternaam = $inputTussenvoegsel = $inputTelefoon = $inputStraat = $inputHuisnummer = $inputPostcode = $inputPlaats = $inputEmail = $inputWachtwoord = $inputWachtwoord2 = '';

    if (isset($_POST['inputVoornaam'])){ $inputVoornaam .= $_POST["inputVoornaam"];}
    if (isset($_POST['inputAchternaam'])){ $inputAchternaam .= $_POST["inputAchternaam"];}
    if (isset($_POST['inputTussenvoegsel'])){ $inputTussenvoegsel .= $_POST["inputTussenvoegsel"];}
    if (isset($_POST['inputTelefoon'])){ $inputTelefoon .= $_POST["inputTelefoon"];}
    if (isset($_POST['inputStraat'])){ $inputStraat .= $_POST["inputStraat"];}
    if (isset($_POST['inputHuisnummer'])){ $inputHuisnummer .= $_POST["inputHuisnummer"];}
    if (isset($_POST['inputPostcode'])){ $inputPostcode .= $_POST["inputPostcode"];}
    if (isset($_POST['inputPlaats'])){ $inputPlaats .= $_POST["inputPlaats"];}
    if (isset($_POST['inputEmail'])){ $inputEmail .= $_POST["inputEmail"];}
    if (isset($_POST['inputWachtwoord'])){ $inputWachtwoord .= $_POST["inputWachtwoord"];}
    
    }
?>


<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="form-heading">login Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <p>Please enter your email and password</p>
                    </div>
                    <form id="Login" method="post" action="login.php">
                        <div class="form-group">
                            <input type="email" class="form-control" name="inputEmail" placeholder="Email Address">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="inputPassword" placeholder="Password">   
                        </div>
                        <div class="forgot">
                            <a href="reset.html">Forgot password?</a>
                        </div>
                        <button type="submit" name="loginFormulier" class="btn btn-primary">Login</button>
                    </form>
                    </div>
                </div>
        </div> 
        <div class="col-lg-6">
            <h1 class="form-heading">Registreer Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <p>Please enter your email and password</p>
                    </div>
                    <form id="Login" method="post" action="login.php">
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputVoornaam" value="<?php print($inputVoornaam);?>" placeholder="Voornaam">
                            </div>
                            <div class="col-lg-4">
                                <?php if ($voornaamError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-3">
                                <input type="text" class="form-control" name="inputTussenvoegsel" value="<?php print($inputTussenvoegsel);?>" placeholder="Tussenvoegsel">
                            </div>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="inputAchternaam" value="<?php print($inputAchternaam);?>" placeholder="Achternaam">
                            </div>
                            <div class="col-lg-4">
                                <?php if ($achternaamError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div> 
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputTelefoon" value="<?php print($inputTelefoon);?>" placeholder="Telefoon"> 
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputStraat" value="<?php print($inputStraat);?>" placeholder="Straat">
                            </div>    
                            <div class="col-lg-4">
                                <?php if ($straatError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputHuisnummer" value="<?php print($inputHuisnummer);?>" placeholder="Huisnummer"> 
                            </div>
                            <div class="col-lg-4">
                                <?php if ($huisnummerError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputPostcode" value="<?php print($inputPostcode);?>" placeholder="Postcode">  
                            </div>
                            <div class="col-lg-4">
                                <?php if ($postcodeError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputPlaats" value="<?php print($inputPlaats);?>" placeholder="Plaats"> 
                            </div>
                            <div class="col-lg-4">
                                <?php if ($plaatsError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="inputEmail" value="<?php print($inputEmail);?>" placeholder="Email"> 
                            </div>
                            <div class="col-lg-4">
                                <?php if ($emailError){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div>
                        <div class="row form-group">
                            <label><?php $message ?></label>
                            <div class="col-lg-8">
                                <input type="password" class="form-control" name="inputWachtwoord" value="<?php print($inputWachtwoord);?>" placeholder="Wachtwoord"> 
                            </div>
                            <div class="col-lg-4">
                                <?php if ($passError1){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div> 
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-8">
                                <input type="password" class="form-control" name="inputWachtwoord2" value="<?php print($inputWachtwoord2);?>" placeholder="Wachtwoord"> 
                            </div>
                            <div class="col-lg-4">
                                <?php if ($passError2){ print(" <font color='red'>Dit veld is verplicht.</font> ");} ?>
                            </div>
                            
                            <?php if ($pass_errors){ print("<br><br> &nbsp;&nbsp;&nbsp; <font color='red'>Wachtwoorden komen niet overeen.</font> ");} ?>
                            </div>
                        
                     <br>
                        <button name="submit" type="submit" class="btn btn-primary">Registreer</button>
                    </form>
                    </div>
                </div>
    </div>
</div>


<?php include 'footer.php'; ?>