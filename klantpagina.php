<!DOCTYPE html>
<?php
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
include_once 'navbar.php';
?>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="#" class="list-group-item list-group-item-action">Settings</a>
              
            </div> 
		</div>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>Your Profile</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form>
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">Voornaam*</label> 
                                <div class="col-8">
                                  <input id="name" name="name" placeholder="First Name" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Tussenvoegsel" class="col-4 col-form-label">Tussenvoegsel</label> 
                                <div class="col-8">
                                  <input id="Tussenvoegsel" name="Tussenvoegsel" placeholder="Tussenvoegsel" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Achternaam" class="col-4 col-form-label">Achternaam*</label> 
                                <div class="col-8">
                                  <input id="Achternaam" name="Achternaam" placeholder="Achternaam" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Telefoonummer*</label> 
                                <div class="col-8">
                                  <input id="text" name="text" placeholder="Telefoonnummer" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="straatnaam" class="col-4 col-form-label">Straatnaam*</label> 
                                <div class="col-8">
                                  <input id="straatnaam" name="straatnaam" placeholder="straatnaam" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="huisnummer" class="col-4 col-form-label">Huisnummer*</label> 
                                <div class="col-8">
                                  <input id="huisnummer" name="huisnummer" placeholder="huisnummer" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Woonplaats" class="col-4 col-form-label">Woonplaats*</label> 
                                <div class="col-8">
                                  <input id="Woonplaats" name="Woonplaats" placeholder="Woonplaats" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="Postcode" class="col-4 col-form-label">Postcode*</label> 
                                <div class="col-8">
                                  <input id="Postcode" name="Postcode" placeholder="Postcode" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Email*</label> 
                                <div class="col-8">
                                  <input id="email" name="email" placeholder="Email" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button name="submit" type="submit" class="btn btn-primary">Opslaan</button>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
</html>