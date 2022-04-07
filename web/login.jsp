<%-- 
    Document   : login
    Created on : Sep 28, 2021, 2:09:24 PM
    Author     : Mai
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rau Củ Quả shop</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta property="og:title" content="Vide" />
        <meta name="keywords" content="Big store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>
        
    </head>
    <body>
        <!--header-->
        <div class="header">
            <div class="container">
                <jsp:include page="header.jsp"/>
                    </nav>
                    <div class="cart" >
                        <a href="invoice.jsp"><image src="images/cart.png" width="40px" hight="40px"></a>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>			
        </div>
        <!---->
        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Login</h3>
                <h4><a href="Home">Home</a><label>/</label>Login</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--login-->

        <div class="login">

            <div class="main-agileits">
                <div class="form-w3agile">
                    <h3>Login</h3>
                    <form action="MainController" method="POST">
                        <div class="key">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input  type="text" value="text" name="userID" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'userID';
                                    }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" value="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'password';
                                    }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <input type="submit" name="action" value="Login">
                    </form>
                    ${requestScope.ERROR}
                </div>
                <script>
                    function statusChangeCallback(response) {
                        if (response.status === 'connected') {
                            const formEle = document.createElement("form");
                            formEle.setAttribute("method", "GET");
                            formEle.setAttribute("action", "MainController");
                            const inputTokenEle = document.createElement('input')
                            inputTokenEle.setAttribute("type", 'text')
                            inputTokenEle.setAttribute("name", 'token')
                            inputTokenEle.setAttribute("value", response.authResponse.accessToken)
                            const submitBtnEle = document.createElement("input");
                            submitBtnEle.setAttribute("id", "submit_btn")
                            submitBtnEle.setAttribute("type", "submit");
                            submitBtnEle.setAttribute("name", "action")
                            submitBtnEle.setAttribute("value", "FB");
                            formEle.appendChild(inputTokenEle)
                            formEle.appendChild(submitBtnEle);
                            document.body.appendChild(formEle)
                            const submitBtn = document.querySelector('#submit_btn');
                            submitBtn.click()
                            document.body.removeChild(formEle);
                        }
                    }
                    // This function is called when someone finishes with the Login
                    // Button. See the onlogin handler attached to it in the sample
                    // code below.
                    function checkLoginState() {
                        FB.getLoginStatus(function (response) {
                            statusChangeCallback(response);
                        });
                    }
                    window.fbAsyncInit = function () {
                        FB.init({
                            appId: '380201807142266',
                            cookie: true, // enable cookies to allow the server to access 
                            // the session
                            xfbml: true, // parse social plugins on this page
                            version: 'v2.2' // use version 2.2
                        });
                        // Now that we've initialized the JavaScript SDK, we call 
                        // FB.getLoginStatus(). This function gets the state of the
                        // person visiting this page and can return one of three states to
                        // the callback you provide. They can be:
                        //
                        // 1. Logged into your app ('connected')
                        // 2. Logged into Facebook, but not your app ('not_authorized')
                        // 3. Not logged into Facebook and can't tell if they are logged into
                        // your app or not.
                        //
                        // These three cases are handled in the callback function.

                        FB.getLoginStatus(function (response) {
                            statusChangeCallback(response);
                        });
                    };
                    // Load the SDK asynchronously
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id))
                            return;
                        js = d.createElement(s);
                        js.id = id;
                        js.src = "//connect.facebook.net/en_US/sdk.js";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                </script>
                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                </fb:login-button>

                <div class="forg">
                    <a href="register.jsp" class="forg-right">Register</a>
                    <div class="clearfix"></div>
                </div>

            </div>
        </div>

    </div>                                
    <!--footer-->
    <jsp:include page="footer.jsp"/>
        <!-- //footer-->
        <!-- smooth scrolling -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */
                $().UItoTop({easingType: 'easeOutQuart'});
            });
        </script>
        <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
        <!-- //smooth scrolling -->
        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->

</body>
</html>