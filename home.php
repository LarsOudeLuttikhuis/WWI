<?php
include 'navbar.php';
include_once "./Functions/global.php");
?>


    <div class="container container mt-4 mb-5">
        <h3 class="display-4 text-center">Chocolate Specialties </h3>
        <hr class="bg-dark mb-4 w-25">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" src="https://dummyimage.com/350x250/c7c7c7/000.png" alt="Card image cap">
                    <div class="card-block p-3">
                        <h4 class="card-title">Novelty Chilli Chocolates</h4>
                        <p class="card-text"></p>
                        <a href="product.php?Pid=220" class="btn btn-primary rounded-0 mb-2">Go To</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" src="https://dummyimage.com/350x250/c7c7c7/000.png" alt="Card image cap">
                    <div class="card-block p-3">
                        <h4 class="card-title">White Chocolate Moon Rocks</h4>
                        <p class="card-text"></p>
                        <a href="product.php?Pid=227" class="btn btn-primary rounded-0 mb-2">Go To</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" src="https://dummyimage.com/350x250/c7c7c7/000.png" alt="Card image cap">
                    <div class="card-block p-3">
                        <h4 class="card-title">Chocolate Sharks</h4>
                        <p class="card-text"></p>
                        <a href="product.php?Pid=225" class="btn btn-primary rounded-0 mb-2">Go To</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<br/><br/><br/>
    <!-- Card -->

    <div class="container mb-5">
        <div class="row">
            <div class="col-md-8">
                <h3 class="display-4">New  Tasty Products</h3>
                <hr class="bg-dark w-25 ml-0">
            
                
                <ul class="list-unstyled pl-4">
                    <li><i class="fa fa-check"></i> We have added new delicious chocolate products that will blow youre mind.</li>
                    <li><i class="fa fa-check"></i> Click on the button below and check them out.</li>

                </ul>
                <a href="choco.php" class="btn btn-primary rounded-0 mb-2"> Let's see them</a>
            </div>
            <div class="col-md-4 mt-5">
                <img class="card-img-top" src="images/homechoco.jpg" alt="Card image cap">
            </div>
        </div>
    </div>

   
       

    
<?php
include 'footer.php';
?>