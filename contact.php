<?php include 'navbar.php';
include 'Functions/contact_back.php'; ?>

<div class="container-fluid">
	<div class="col-lg-6">
        <iframe src="https://maps.google.com/maps?hl=nl&amp;q=Zwolle%20campus2+(Windesheim)&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=B&amp;output=embed" width="100%" height="650px" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
	<div class="col-lg-6">
		<h1 class="title">Contact Us</h1>
		<h2 class="subtitle">Neem cotact op met Wide World Importers</h2>
		<form id="contact-form" method="post" action="contact.php" role="form">
            <div class="messages"></div>
            <div class="controls">
                <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_name">Voornaam *</label>
                    <input id="form_name" type="text" name="name" class="form-control" placeholder="Vul hier uw voornaam in *" required="required" data-error="Firstname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_lastname">Achternaam *</label>
                    <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Vul hier uw achternaam in *" required="required" data-error="Lastname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_email">Email *</label>
                    <input id="form_email" type="email" name="email" class="form-control" placeholder="Vul hier uw E-mail in *" required="required" data-error="Valid email is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="form_need">Please specify your need *</label>
                    <select id="form_need" name="need" class="form-control" required="required" data-error="Please specify your need.">
                        <option value=""></option>
                        <option value="Request quotation">Request quotation</option>
                        <option value="Request order status">Request order status</option>
                        <option value="Request copy of an invoice">Request copy of an invoice</option>
                        <option value="Other">Other</option>
                    </select>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_message">Message *</label>
                    <textarea id="form_message" name="message" class="form-control" placeholder="Vul hier uw bericht in *" rows="4" required="required" data-error="Please, leave us a message."></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-12">
                <input type="submit" class="btn btn-success btn-send" value="Verstuur">
            </div>
        </div>
    </div>

</form>
    </div>
</div>

<?php include 'footer.php'?>