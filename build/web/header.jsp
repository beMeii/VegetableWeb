<%-- 
    Document   : header
    Created on : Oct 18, 2021, 4:15:51 PM
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
        <div class="logo">
            <h1>RAU CỦ QỦA ONLINE<span>The Best Supermarket</span></h1>
        </div>
        <div class="head-t">
            <ul class="card">
                <c:if test="${sessionScope.LOGIN_USER == null}" >
                    <li><a href="login.jsp" ><i class="fa fa-user" aria-hidden="true"></i>Login</a></li>
                    <li><a href="register.jsp" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Register</a></li>					

                </c:if>
                <c:if test="${sessionScope.LOGIN_USER != null}" >
                    <li><i class="fa fa-user" aria-hidden="true"></i> ${sessionScope.LOGIN_USER.fullName} </li>
                    <li><a href="MainController?action=Logout" ><i class="fa fa-user" aria-hidden="true"></i>Logout</a></li>
                </c:if>
            </ul>	
        </div>

    </body>
</html>
