<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Billing System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="/lib/slick/slick.css" rel="stylesheet">
        <link href="/lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Top bar Start -->
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="index.html">
                                <img src="/img/vstore.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6"><br>
                        <center><h2 style="color: #FF6F61;">Add Products</h2></center>
                     </div>
                    </div>
                    
            </div>
        </div>
        <!-- Bottom Bar End -->

        <!-- Checkout Start -->
        <div class="checkout">
            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="checkout-inner">
                            <div class="billing-address">
                                <form action="/saveProducts" modelAttribute="product" method="post">
                                <h2>Product Details</h2>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Product Name</label>
                                        <input class="form-control" required name="productName" type="text" placeholder="e.g. Shirt">
                                    </div>
                                    <div class="col-md-12">
                                        <label>Price</label>
                                        <input class="form-control" required name= "price" type="number" placeholder="e.g. 90">
                                    </div>
                                    <div class="col-md-12">
                                        <label>Stock</label>
                                        <input class="form-control" required name="stock" type="number" placeholder="e.g. 20">
                                    </div>                       
                                </div><br>
                                <div class="cart-btn">
                                    <center><button class="btn" style="width: 350px;color: #ffffff;background: #FF6F61;">Add Product</button></center>
                                </div>
                            </form>
                            </div>                           
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <!-- Checkout End -->
               
           
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
