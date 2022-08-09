<%@page import="sample.users.UserDTO"%>
<%@page import="sample.users.ProductDTO"%>
<%@page import="sample.users.CartShopping"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Start Main Top -->
        <header class="main-header">
            <!-- Start Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
                <div class="container">
                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="user.jsp"><img src="images/logo.png" class="logo" alt=""></a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="nav-item"><a class="nav-link" href="user.jsp">Home</a></li>                       
                            <li class="dropdown active">
                                <a href="user.jsp" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">SHOP</a>
                                <ul class="dropdown-menu">                                 
                                    <li><a href="viewCart.jsp">Cart</a></li>
                                    <li><a href="checkout.jsp">Checkout</a></li>                                
                                </ul>
                            </li>                          
                        </ul>
                    </div>                
                </div>

            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Cart</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="user.jsp">Shop</a></li>
                            <li class="breadcrumb-item active">Cart</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Cart  -->
        <%

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            CartShopping cart = (CartShopping) session.getAttribute("CART");
            if (cart == null) {

        %>
        <h1 style="text-align: center;font-size: 35px;color: red">Ban chua chon san pham nao trong gio!</h1>
        <%  } else{
            if (cart.getCart().size() > 0) {
        %>
        <div class="cart-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>  
                                        <th>No</th> 
                                        <th>Product ID</th> 
                                        <th>Image</th>                                        
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Remove</th>
                                        <th>Edit Cart</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        int count = 1;
                                        double total = 0;
                                        for (ProductDTO product : cart.getCart().values()) {
                                            total += product.getPrice() * product.getQuantity();
                                    %>
                                <form action="MainController">     
                                    <tr>  
                                    <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>"/>
                                    <td><%= count++%></td>
                                    <td>
                                        <input style="color: black" type="text" readonly="" name="productID" value="<%= product.getProductID()%>"/>   
                                    </td>

                                    <td class="thumbnail-img">
                                        <a href="#">                                              
                                            <img class="img-fluid" src="<%= product.getImage()%>" alt="" />
                                        </a>
                                    </td>    
                                    <td class="name-pr" style="font-size: 25px">
                                        <%= product.getProductName()%>
                                    </td>
                                    <td class="price-pr">
                                        <p><%= product.getPrice()%>$</p>
                                    </td>
                                    <td class="quantity-box">
                                        <input type="number" name="quantity" value="<%= product.getQuantity()%>"  class="c-input-text qty text">
                                    </td>                                   
                                    <td class="total-pr">$<%= product.getPrice() * product.getQuantity()%></td>
                                    <td>
                                        <div class="col-lg-75 col-sm-9">
                                            <div class="update-box">
                                                <input  name="action" value="Remove" type="submit"/>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class=" col-lg-8 col-sm-9">
                                            <div class="update-box">
                                                <input name="action" value="Edit Cart" type="submit"/>
                                            </div>
                                        </div>
                                    </td>
                                    </tr>
                                </form>     
                                <%
                                    }
                                %>
                                <td><input type="submit" name="action" value="Check out"/></td>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <h1>Total: $<%= total%></h1>
                <%
                        }
                    }
                %>            

            </div>
        </div>

        <!--                <div class="col-11 d-flex shopping-box"><a href="checkout.jsp" class="ml-auto btn hvr-hover">Checkout</a> </div>-->






        <!-- End Cart -->

        <!-- Start Instagram Feed  -->
        <div class="instagram-box">
            <div class="main-instagram owl-carousel owl-theme">
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-01.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-02.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-03.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-04.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-06.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-07.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-08.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-09.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Instagram Feed  -->

        <!-- Start copyright  -->
        <div class="footer-copyright">
            <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
                <a href="https://html.design/">html design</a></p>
        </div>
        <!-- End copyright  -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>