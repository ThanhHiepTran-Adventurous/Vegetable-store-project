<%@page import="sample.users.CartShopping"%>
<%@page import="sample.users.UserDTO"%>
<%@page import="sample.users.ProductDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Site Metas -->
        <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
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
        <link rel="stylesheet" href="css/quantity.css">
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Start Main Top -->
        <div class="main-top">
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleID().equals("1")) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String search = request.getParameter("searchPro");
                if (search == null) {
                    search = "";
                }
            %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">				                    
                        <div class="our-link">
                            <ul>
                                <li><a href="#"><i class="fa fa-user s_color"></i>Welcome:<%= loginUser.getFullName()%></a></li>                            
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="login-box">

                        </div>
                        <div class="text-slid-box">
                            <div id="offer-box" class="carouselTicker">
                                <ul class="offer-box">

                                    <li>
                                        <i class="fab fa-opencart"></i> 50% - 80% off on Vegetables
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 10%! Shop Vegetables
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 10%! Shop Vegetables
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> 50% - 80% off on Vegetables
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT30
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 50%! Shop Now 
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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


                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="nav-item active"><a class="nav-link" href="user.jsp">Home</a></li>

                            <li class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">SHOP</a>
                                <ul class="dropdown-menu">
                                    <li><a href="viewCart.jsp">Cart</a></li>
                                    <li><a href="checkOut_1.jsp">Checkout</a></li>
                                </ul>
                            </li>                           
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->

                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                            <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>                 
                            <li class="fa-solid fa-arrow-right-from-bracket"><a href="MainController?action=Logout">Logout</a></li>
                        </ul>
                    </div>

                </div>                  
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->

        <!-- Start Top Search -->
        <form action="MainController">
            <div class="top-search">
                <div class="container">
                    <div class="input-group">
                        <input type="text" class="form-control" name="searchPro"value="<%= search%>" placeholder="Search">
                        <input type="submit" name="action" value="FindPro"/>
                        <i class="fa fa-search"></i>
                        <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                    </div>
                </div>
            </div>
        </form>

        <!-- End Top Search -->

        <%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }

        %>
        <p style="text-align: center;color: red;font-size: 40px;margin-top: 20px;margin-right:13%;padding-top: 30px"><%= message%></p>

        <!-------------------------------------------------------------------------------------------------------->


        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
            <div class="container">              
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">                                                
                    <div class="row">
                        <%
                            List<ProductDTO> listProductInUser = (List<ProductDTO>) session.getAttribute("LIST_PRODUCT_USER");
                            if (listProductInUser != null) {
                                if (listProductInUser.size() > 0) {
                                    for (ProductDTO product : listProductInUser) {
                        %>

                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="products-single fix">

                                <div class="box-img-hover">
                                    <div class="type-lb">
                                        <p class="sale">Sale</p>
                                    </div>
                                    <h1><img src="<%= product.getImage()%>" class="img-fluid" alt="Image"></h1>                                        
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="MainController?action=View" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                        </ul>
                                        <a class="cart" href="MainController?action=Add&productID=<%= product.getProductID()%>&productName=<%= product.getProductName()%>&price=<%= product.getPrice()%>&quantity=1&image=<%= product.getImage()%>">Add to Cart</a>
                                        <!--<a href="MainController?action=Add&productID=<%=product.getProductID()%>&productName=<%= product.getProductName()%>&price=<%= product.getPrice()%>&quantity=1&image=<%= product.getImage() %>" style="text-decoration: none"><button class="btn btn-success" name="action" value="Add">Add</button></a>-->
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4><%= product.getProductName()%></h4>
                                    <h5><%= product.getPrice()%>$</h5>
                                </div>
                            </div>
                        </div>  
                        <%
                                    }
                                }

                            }

                        %>  
                    </div>                                                                        
                </div>             
            </div>
        </div>
        <!-- End Shop Page -->






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
    <script src="js/bootsnav.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/quantity.js"></script>
</body>

</html>
