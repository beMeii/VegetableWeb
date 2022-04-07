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
        <!-- for-mobile-apps -->
        <title>Rau Củ Quả shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <c:if test="${sessionScope.LOGIN_USER== null or sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="header">
            <div class="container">
                <jsp:include page="header.jsp"/>
                <div class="nav-top">
                    <nav class="navbar navbar-default">
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav ">	
                                <li class=" active"><a href="Home" class="hyper "><span>Manage Product</span></a></li>
                                <li class=" active"><a href="searchuser.jsp" class="hyper "><span>Manage User</span></a></li>
                                <li class=" active"><a href="addProduct.jsp" class="hyper "><span>Add Product</span></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>

            </div>
        </div>
        <!---->
        <div class="banner-top">
            <div class="container">
                <h3 >Add Product</h3>
                <h4><a href="Home">Home</a><label>/</label>Add Product</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="content-top ">
            <div class="container ">
                <div class="spec ">
                    <h3>Add New Product</h3>
                    <div class="ser-t">
                        <b></b>
                        <span><i></i></span>
                        <b class="line"></b>
                    </div>
                </div> 

                <form action="MainController" method="POST" enctype="multipart/form-data">
                    <h4>Product ID</h4>
                    <div class="key">
                        <input type="text" name="productID" required=""/>                                             
                        <div class="clearfix"></div>
                    </div>
                    <h5>${requestScope.PRODUCT_ERROR.productIDError}</h5>
                    <h4>Product Name</h4>
                    <div class="key">
                        <input  type="text" name="productName" required=""></br>                                                        
                        <div class="clearfix"></div>
                    </div>
                    <h5>${requestScope.PRODUCT_ERROR.productNameError}</h5>                       
                    <h4>Product Price</h4>
                    <div class="key">                            
                        <input  type="number" name="productPrice" min="1" required=""></br>                                                       
                        <div class="clearfix"></div>
                    </div>

                    <h4>Product Quantity</h4>
                    <div class="key">
                        <input  type="number" name="quantity" min="1" required="" ></br>                                                       
                        <div class="clearfix"></div>
                    </div>

                    <h4>Product CategoryID</h4>
                    <div class="key">  
                        <select name="categoryID">
                            <c:forEach items="${sessionScope.LIST_CATE}" var="cate">
                                <option value="${cate.categoryID}">${cate.categoryName}</option>
                            </c:forEach>
                        </select>
                        <div class="clearfix"></div>
                    </div>
                    <h4>Image</h4>
                    <div class="key">
                        <input type="file" name="txtFile" value="" required=""/></br>                            
                        <div class="clearfix"></div>
                    </div>
                    <input type="submit" name="action" value="AddProduct" />
                    <h5>${requestScope.PRODUCT_ERROR.productMessage}</h5>
                </form>

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

    </body>
</html>
