<%-- 
    Document   : login
    Created on : Feb 20, 2022, 3:50:29 PM
    Author     : ADMIN
--%>

<%@page import="constants.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login PAGES</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="imagesV2/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendorV2/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fontsV2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fontsV2/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendorV2/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendorV2/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendorV2/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendorV2/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendorV2/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="cssV2/css/util.css">
        <link rel="stylesheet" type="text/css" href="cssV2/css/main.css">
        <!--===============================================================================================-->

    </head>
    <body>
        <h1 style="text-align: center">Input your information!!</h1>



        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <form class="login100-form validate-form" action="MainController" method="POST" id="check1">
                        <span class="login100-form-title p-b-49">
                            Login
                        </span>
                        <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is required">
                            <span class="label-input100">Username</span>
                            <input class="input100" type="text" name="userID" placeholder="Type your username">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="password" placeholder="Type your password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>


                        <%
                            String error = (String) request.getAttribute("ERROR");
                            // error có 2 trường hợp xảy ra
                            // Thứ 1: Nó null khi mình vừa load cái trang này lên thì cái error này chưa có buộc mình phải kiểm tra
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <h6 style="color: red">
                            <%= error%>
                        </h6>
                        <div class="g-recaptcha" data-sitekey="6LeUS7AeAAAAAFWI42cMB0BD0UFxPFIXOz9MRuMU"></div> 
                        <div id="error"></div>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button type="submit" class="login100-form-btn" name="action" value="Login">
                                    Login
                                </button>
                            </div>                          
                        </div>


                        <div style="text-align: center">
                            <a style="color: red"  href="createUser.jsp">Create new user</a>
                        </div>

                        <div class="txt1 text-center p-t-54 p-b-20">
                            <span>
                                Or Sign Up Using
                            </span>
                        </div>

                        <div class="flex-c-m">
                            <a href="#" class="login100-social-item bg1">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="#" class="login100-social-item bg2">
                                <i class="fa fa-twitter"></i>
                            </a>

                            <a href="#" class="login100-social-item bg3">
                                <i class="fa fa-google"></i>
                            </a>
                        </div>      
                    </form>

                </div>
            </div>
        </div>




        <div id="dropDownSelect1"></div>



        <!--===============================================================================================-->
        <script src="vendorV2/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendorV2/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendorV2/vendor/bootstrap/js/popper.js"></script>
        <script src="vendorV2/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendorV2/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendorV2/vendor/daterangepicker/moment.min.js"></script>
        <script src="vendorV2/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendorV2/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="jsV2/js/main.js"></script>

        <script src="create/js/global.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const recap = document.getElementById("check1");
                const error = document.getElementById("error");
                recap.addEventListener("submit", function (event) {

                    const response = grecaptcha.getResponse();
                    if (response) {
                        recap.submit();
                    } else {
                        event.preventDefault();
                        error.innerHTML = "Please check recaptcha!";
                    }
                });
            }
        </script>

    </body>
</html>