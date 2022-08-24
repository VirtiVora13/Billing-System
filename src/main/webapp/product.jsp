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
                                <img src="/img/vstore.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="search">
                        <form action="/searchProducts">
                            <input type="text" name="search" placeholder="Search">
                            <button><i class="fa fa-search"></i></button>
                        </form>
                       </div>

                    </div>
                    <div class="col-md-2">
                        <a href="addProducts.jsp" style="font-size:20px;">Add Product</a>
                    </div>
            </div>
        </div>
        <!-- Bottom Bar End -->
      
        
        <!-- Cart Start -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                                <table class="table table-bordered">

                                <br>
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Stock</th>
                                            <th>Total</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <form method="post" modelAttribute="checkout" action="/checkout">
                                    <center> <b>Customer Name:</b> <input type="text"  placeholder="Enter Name" required name="name"  style="background-color:white;color:black;width:400px;height:36px;border-color: #FF6F61; border-style: solid;!important"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b>Customer Mobile:</b> <input type="text"   placeholder="Enter Mobile No." required name="contact"  style="background-color:white;color:black;width:400px;height:36px;border-color: #FF6F61;border-style: solid; !important"/>
                                    </center>
                                    <br>

                                    <c:forEach var="product" items="${products}">

                                    <tbody class="align-middle">
                                        <tr>
                                            <td>
                                                <div style="background-color:white;">
                                                    <input type="hidden"  name="id" value="${product.id}">
                                                    <input type="text"  value="${product.productName}" name="productName" readonly style="background-color:white;color:black;"/>
                                                </div>
                                            </td>
                                            <td>
                                            <input type="text" id="price${product.id}" name="price" value="${product.price}" readonly  style="background-color:white;color:black"/>
                                            </td>
                                            <td>
                                                <div class="qty">
                                                  <!--  <button class="btn-minus" id="minus${product.id}" onclick="minuscalc('${product.id}');" ><i class="fa fa-minus"></i></button> --!>
                                                    <input type="number" id="quantity${product.id}" value="0" name="quantity" onchange="calc('${product.id}');" style="background-color:white;color:black;">
                                                   <!--  <button class="btn-plus" id="plus${product.id}"  onclick="pluscalc('${product.id}');" ><i class="fa fa-plus"></i></button> --!>
                                                </div>
                                            </td>
                                            <td>
                                            <input type="text" value="${product.stock}" id="stock${product.id}" name="stock" readonly style="background-color:white;color:black"/>
                                            </td>
                                            <td>
                                            <input type="text" id="total${product.id}" name="total" readonly style="background-color:white;color:black"/>
                                            </td>
                                            <td><a href="/removeProducts/${product.id}"><i class="fa fa-trash"></i><a></td>
                                        </tr>
                                    </tbody>
                                     </c:forEach>

                                </table>

                                <div class="product-price float-right">   
                                    <br>
                                    <button class="btn" style="width: 200px;color: #ffffff;background: #FF6F61;">Checkout</button>
                                 </div>
                                 </form>

                            </div>   
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
       
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

        <script>
            function pluscalc(id){


                var quantity = document.getElementById("quantity"+id).value;
                var price = document.getElementById("price"+id).value;
                var stock = document.getElementById("stock"+id).value;
                if((Number(quantity)) >= (Number(stock)))
                {
                    document.getElementById("quantity"+id).value= document.getElementById("quantity"+id).value-1;
                }
                else{
                var temp = (Number(quantity))+1;
                var temp1 =(Number(price));
                var total = temp*temp1;
                document.getElementById("total"+id).value=total;
                }
            }

            function calc(id){
               var quantity = document.getElementById("quantity"+id).value;
              var price = document.getElementById("price"+id).value;
              var stock = document.getElementById("stock"+id).value;
              if((Number(quantity)) >= (Number(stock)))
              {

                  document.getElementById("quantity"+id).value= document.getElementById("stock"+id).value;
                   var temp = (Number(stock));
                var temp1 =(Number(price));
                var total = temp*temp1;
                document.getElementById("total"+id).value=total;
              }
              else if((Number(quantity)) <= 0)
               {
                   document.getElementById("quantity"+id).value=0;
                 document.getElementById("total"+id).value=0;
               }
               else{
                  var temp = (Number(quantity));
                  var temp1 =(Number(price));
                  var total = temp*temp1;
                  document.getElementById("total"+id).value=total;
               }
            }
            function minuscalc(id){

                 var quantity = document.getElementById("quantity"+id).value;
                 var price = document.getElementById("price"+id).value;
                 if((Number(quantity)) <= 0)
                 {

                     document.getElementById("quantity"+id).value=0;
                     document.getElementById("total"+id).value=0;
                 }
                 else{
                 var temp = (Number(quantity))-1;
                 var temp1 =(Number(price));
                 var total = temp*temp1;
                 document.getElementById("total"+id).value=total;
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
