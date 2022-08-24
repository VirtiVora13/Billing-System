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

        <!-- Top bar End -->


        <!-- Bottom Bar Start -->
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="index.html">
                                <img src="img/vstore.png" alt="Logo">
                            </a>
                        </div>
                    </div>

            </div>
        </div>
        <!-- Bottom Bar End -->


       <div class="cart-page">
                   <div class="container-fluid">
                       <div class="row">
                       <div class="col-lg-2">
                       </div>
                           <div class="col-lg-8">
                               <div class="cart-page-inner">
                                   <div class="row">
                                       <div class="col-md-12">
                                           <div class="coupon">
                                               <input type="text" id="coupon" placeholder="Coupon Code">
                                               <button onclick="discount();">Apply Code</button>
                                           </div>
                                       </div>
                                       <div class="col-md-12">
                                           <div class="cart-summary">
                                           <form action="/generateBill">
                                               <div class="cart-content">
                                                   <h1>Cart Summary</h1>
                                                   <c:set var="total" value="${0}"/>
                                                   <c:forEach var="checkout" items="${checkout}">

                                                   <p>${checkout.productName} X ${checkout.quantity}<span>Rs.${checkout.price * checkout.quantity} </span></p>
                                                   <c:set var="total" value="${total + (checkout.price * checkout.quantity)}" />
                                                   </c:forEach>
                                                   <input type=hidden id="discount" name="discount" value="">

                                                   <input type=hidden id="subtotal" value="<c:out value="${total}"/>">
                                                   <h2>Grand Total<span id="total"><c:out value='${total}'/></span></h2>

                                               </div>
                                               <div class="cart-btn">
                                                   <center><button>Generate Bill</button></center>
                                               </div>
                                               </form>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
               <!-- Cart End -->

        <!-- Footer Bottom Start -->

        <!-- Footer Bottom End -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script>
           function discount(){
                var coupon1 = document.getElementById("coupon").value;
                if(coupon1 == "first"){
                   var total = document.getElementById("subtotal").value;
                   console.log(total);
                   var discount1 = total*0.8;
                   document.getElementById("total").innerText = discount1;
                   document.getElementById("discount").value = document.getElementById("coupon").value;
                }
                else if(coupon1 == "second"){
                   var total = document.getElementById("subtotal").value;
                   var discount1 = total*0.9;
                   document.getElementById("total").innerText = discount1;
                   document.getElementById("discount").value = document.getElementById("coupon").value;
                }
                else{
                 var total = document.getElementById("subtotal").value;
                 document.getElementById("total").innerText = total;
                 document.getElementById("discount").value = document.getElementById("coupon").value;
                }

           }

        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/lib/easing/easing.min.js"></script>
        <script src="/lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="/js/main.js"></script>
    </body>
</html>
