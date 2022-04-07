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
        <img src="images/download.png" class="img-head" alt="">
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
        <!---->

        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Register</h3>
                <h4><a href="Home">Home</a><label>/</label>Register</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!--login-->

        <div class="login">

            <div class="main-agileits">
                <div class="form-w3agile form1">
                    <h3>Register</h3>
                        <form action="MainController" method="POST">
                            <h4>UserID</h4>
                            <div class="key">
                                <input type="text" name="userID" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'userID';
                                        }" required=""/>                                             
                                <div class="clearfix"></div>
                            </div>
                            <h5>${requestScope.USER_ERROR.userIDError}</h5>
                            <h4>Full Name</h4>
                            <div class="key">
                                <input  type="text" name="fullName" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Full Name';
                                        }" required=""></br>                                                        
                                <div class="clearfix"></div>
                            </div>
                            <h5>${requestScope.USER_ERROR.fullNameError}</h5>                       
                            <h4>Phone Number</h4>
                            <div class="key">                            
                                <input  type="text" name="phone" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Phone';
                                        }" required=""></br>                                                       
                                <div class="clearfix"></div>
                            </div>
                            <h5>${requestScope.USER_ERROR.phoneError}</h5>
                            <h4>Address</h4>
                            <div class="key">
                                <input  type="text" name="address" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Address';
                                        }" required="" ></br>                                                       
                                <div class="clearfix"></div>
                            </div>
                            <h5>${requestScope.USER_ERROR.addressError}</h5>
                            <h4>Password</h4>
                            <div class="key">                            
                                <input  type="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Password';
                                        }" required=""></br>	
                                <div class="clearfix"></div>
                            </div>
                            <h4>Confirm Password</h4>
                            <div class="key">                            
                                <input  type="password"  name="confirm" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Confirm';
                                        }" required=""></br>                            
                                <div class="clearfix"></div>
                            </div>

                            <h4>Email</h4>
                            <div class="key">
                                <input  type="text" name="email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'email';
                                        }" required=""></br>                            
                                <div class="clearfix"></div>
                            </div>
                            <h5>${requestScope.USER_ERROR.confirmError}</h5>
                            <input type="submit" name="action" value="Create">
                            <h5>${requestScope.USER_ERROR.messageError}</h5>
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
        <script type='text/javascript' src="js/jquery.mycart.js"></script>
        <script type="text/javascript">
            $(function () {

                var goToCartIcon = function ($addTocartBtn) {
                    var $cartIcon = $(".my-cart-icon");
                    var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
                    $addTocartBtn.prepend($image);
                    var position = $cartIcon.position();
                    $image.animate({
                        top: position.top,
                        left: position.left
                    }, 500, "linear", function () {
                        $image.remove();
                    });
                }

                $('.my-cart-btn').myCart({
                    classCartIcon: 'my-cart-icon',
                    classCartBadge: 'my-cart-badge',
                    affixCartIcon: true,
                    checkoutCart: function (products) {
                        $.each(products, function () {
                            console.log(this);
                        });
                    },
                    clickOnAddToCart: function ($addTocart) {
                        goToCartIcon($addTocart);
                    },
                    getDiscountPrice: function (products) {
                        var total = 0;
                        $.each(products, function () {
                            total += this.quantity * this.price;
                        });
                        return total * 1;
                    }
                });

            });
        </script>

    </body>
</html>