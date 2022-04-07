<%-- 
    Document   : userUpdate
    Created on : Oct 22, 2021, 11:18:00 PM
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
        <img src="images/download.png" class="img-head" alt="">
        <div class="header">
            <div class="container">
                <jsp:include page="header.jsp"/>
                <div class="nav-top">
                    <nav class="navbar navbar-default">
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav ">
                                <li class=" active"><a href="Home" class="hyper "><span>Home</span></a></li>
                                <li class=" active"><a href="userUpdate.jsp" class="hyper "><span>User Update</span></a></li>
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
        <!---->

        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >UpDate Account</h3>
                <h4><a href="Home">Home</a><label>/</label>UpDate Account</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!--login-->

        <div class="login">

            <div class="main-agileits">
                <div class="form-w3agile form1">
                    <h3>UpDate Account</h3>                        
                    <c:set value="${sessionScope.LOGIN_USER}" var="user"/>
                    <form action="MainController" method="GET">
                        <h4>UserID</h4>
                        <div class="key">
                            <input type="text" name="userID" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'userID';
                                    }" required="" value="${user.userID}" readonly=""/>                                             
                            <div class="clearfix"></div>
                        </div>                       
                        <h4>Phone Number</h4>
                        <div class="key">                            
                            <input  type="text" name="phone" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Phone';
                                    }" required="" value="${sessionScope.LOGIN_USER.phone}"></br>                                                       
                            <div class="clearfix"></div>
                        </div>
                        <h5>${requestScope.USER_ERROR.phoneError}</h5>
                        <h4>Address</h4>
                        <div class="key">
                            <input  type="text" name="address" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Address';
                                    }" required="" value="${sessionScope.LOGIN_USER.address}" ></br>                                                       
                            <div class="clearfix"></div>
                        </div>
                        <h5>${requestScope.USER_ERROR.addressError}</h5>                            
                        <input type="submit" name="action" value="UpdateUser">                            
                    </form>


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