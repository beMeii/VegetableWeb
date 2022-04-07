<%-- 
    Document   : checkOut
    Created on : Oct 20, 2021, 11:19:43 PM
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
    <c:if test="${sessionScope.LOGIN_USER== null or sessionScope.LOGIN_USER.roleID ne 'US'}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <div class="header">
        <div class="container">

            <jsp:include page="header.jsp"/>
            <div class="nav-top">
                <nav class="navbar navbar-default">		 
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav ">
                            <li class=" active"><a href="Home" class="hyper "><span>Home</span></a></li>						
                        </ul>
                    </div>
                </nav>
                <div class="cart" >
                    <a href="invoice.jsp"><image src="images/cart.png" width="40px" hight="40px"></a>
                </div>
                <div class="clearfix"></div>
            </div>

        </div>			
    </div>
    <div class="banner-top">
        <div class="container">
            <h3>Check Out</h3>
            <h4><a href="Home">Home</a><label>/</label>Check Out</h4>
            <div class="clearfix"> </div>
        </div>
    </div>

    <h1>${CHECKOUT}</h1>
    <h2>click here to return: <a href="Home">Home</a></h2>
    <jsp:include page="footer.jsp"/>
</body>
</html>
