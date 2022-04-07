<%-- 
    Document   : page
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
        <div class="header">
            <div class="container">
                <jsp:include page="header.jsp"/>
                <div class="nav-top">
                    <nav class="navbar navbar-default">
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav ">
                                <li class=" active"><a href="Home" class="hyper "><span>Home</span></a></li>
                                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}">
                                <li class=" active"><a href="userUpdate.jsp" class="hyper "><span>User Update</span></a></li>
                                </c:if>
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
        <div style="background-image: url(images/backgroundSearch.png); height: 100%; width: 100;">
            <div class="container">           
                <div class="banner-info">
                    <h3>SEARCH</h3>
                    <div class="search-form" >
                        <form action="MainController">
                            <input type="text" name="searchP" value="${param.searchP}"/>  
                            <input type="submit" name="action" value="SearchP"/>
                        </form>
                    </div>		
                </div>	
            </div>
        </div>
        <div class="content-top ">
            <div class="container ">
                <div class="spec ">
                    <h3>Special Offers</h3>
                    <div class="ser-t">
                        <b></b>
                        <span><i></i></span>
                        <b class="line"></b>
                    </div>
                </div> 
                <h4>${requestScope.MESSAGE}</h4><br>
                <c:forEach var="pro" items="${LIST_PRODUCT}" >
<!--không để Scope vì muốn ban đầu lấy ở sessionCope để hiện hết list. Và sau khi search nó lấy từ resquestScope theo thứ tự là page->request->session-->
                    <div class="col-md-3 m-wthree">
                        <div class="col-m">								
                            <a href="#" data-toggle="modal" data-target="#myModal1" class="offer-img">
                                <img src="images/${pro.image}" class="img-responsive" alt="">
                                <div class="offer"><p><span>Offer</span></p></div>
                            </a>
                            <div class="mid-1">
                                <div class="women">
                                    <h6>${pro.productName} (1 kg)</h6>							
                                </div>
                                <div class="mid-2">
                                    <p>${pro.productPrice} VND</p>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="add">
                                    <form action="MainController" method="GET">
                                        <input name="quantity" type="hidden" value="1" />
                                        <input name="productName" type="hidden" value="${pro.productName}" />
                                        <input name="productPrice" type="hidden" value="${pro.productPrice}" />
                                        <input name="quantityPro" type="hidden" value="${pro.quantity}"/>
                                        <input name="categoryID" type="hidden" value="${pro.categoryID}" />
                                        <input name="status" type="hidden" value="${pro.status}" />
                                        <input name="image" type="hidden" value="${pro.image}" />
                                        <input name="productID" type="hidden" value="${pro.productID}" /> 
                                        <button class="btn btn-danger my-cart-btn my-cart-b" type="submit" name="action" value="Add to Cart">Add to Cart</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <br>
        <br>
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
