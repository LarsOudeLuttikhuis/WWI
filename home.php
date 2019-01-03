<?php
include 'navbar.php';
include_once 'Functions/global.php';
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
                        <p class="card-text">When an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <a href="product.php?Pid=220" class="btn btn-primary rounded-0 mb-2">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" src="https://dummyimage.com/350x250/c7c7c7/000.png" alt="Card image cap">
                    <div class="card-block p-3">
                        <h4 class="card-title">White Chocolate Moon Rocks</h4>
                        <p class="card-text">When an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <a href="product.php?Pid=227" class="btn btn-primary rounded-0 mb-2">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" src="https://dummyimage.com/350x250/c7c7c7/000.png" alt="Card image cap">
                    <div class="card-block p-3">
                        <h4 class="card-title">Chocolate Sharks</h4>
                        <p class="card-text">When an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        <a href="product.php?Pid=225" class="btn btn-primary rounded-0 mb-2">Read More</a>
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
                <h3 class="display-4">Products</h3>
                <hr class="bg-dark w-25 ml-0">
                <p class="lead">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
                </p>
                <p>
                    When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                </p>
                <ul class="list-unstyled pl-4">
                    <li><i class="fa fa-check"></i> Lorem Ipsum is simply dummy text</li>
                    <li><i class="fa fa-check"></i> Lorem Ipsum is simply dummy text</li>
                    <li><i class="fa fa-check"></i> Lorem Ipsum is simply dummy text</li>
                </ul>
                <a href="choco.php" class="btn btn-primary rounded-0 mb-2"> Read More</a>
            </div>
            <div class="col-md-4 mt-5">
                <img class="card-img-top" src="images/homechoco.jpg" alt="Card image cap">
            </div>
        </div>
    </div>

   
       

    
    <?php

HomeProductenOverzichtBekijken(1);
ToonHomeProducten(); 
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>