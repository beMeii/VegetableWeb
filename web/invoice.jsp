<%-- 
    Document   : invoice
    Created on : Oct 5, 2021, 7:26:11 PM
    Author     : Mai
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link href="css/style.css" rel='stylesheet' type="text/css"/>
        <link href="css/style2.css" rel='stylesheet' type="text/css"/>
        <style>
            input[type=submit] {                                        
                background-color: Transparent;
                border: none;
                color: black;
                padding: 16px 32px;
                text-decoration: none;
                margin: 4px 2px; 
            }
        </style>
    </head>
    <body>
        <!--header-->
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
        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Invoice</h3>
                <h4><a href="Home">Home</a><label>/</label>Invoice</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--login-->
        <div class="content-top ">
            <div class="container">
                <c:if test="${sessionScope.CART == null}">
                    <h2>Empty!</h2> 
                    <h2>click here to add new product: <a href="Home">Home</a></h2>
                </c:if>
                <c:if test="${sessionScope.CART != null}">   
                    <table class="body-wrap">
                        <tbody><tr>
                                <td></td>
                                <td class="container" width="600">
                                    <div class="content">
                                        <table class="main" width="100%" cellpadding="0" cellspacing="0">
                                            <tbody><tr>
                                                    <td class="content-wrap aligncenter">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tbody><tr>
                                                                    <td class="content-block">
                                                                        <h2>Thanks for using our app</h2>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="content-block">
                                                                        <table class="invoice">
                                                                            <tbody><tr>
                                                                            <h4>${requestScope.MESSAGE}</h4>
                                                                            <c:set var="Date" value="<%=new java.util.Date()%>" />
                                                                            <td>${sessionScope.LOGIN_USER.fullName}<br>Invoice<br><fmt:formatDate type="date" value="${Date}" />  </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table class="invoice-items" >
                                                                            <tbody>

                                                                                <c:set var="total" value="${0}"/>
                                                                                <c:forEach items="${sessionScope.CART.cart}" var="pro" >
                                                                                <form action="MainController">

                                                                                    <tr>
                                                                                        <td>                                
                                                                                            <image src="images/${pro.value.image}" width="128px" height="128px" >
                                                                                        </td>
                                                                                        <td>${pro.value.productName}</td>
                                                                                        <td>${pro.value.productPrice}(VND)</td>
                                                                                        <td >
                                                                                            <input type="hidden" value="${pro.value.productID}" name="productID">
                                                                                            <input style="width: 40px" type="number" value="${pro.value.quantity}" min="1" step="1" name="quantity">
                                                                                            <input type="submit" name="action" value="UpdateCart"
                                                                                        </td>
                                                                                        <td>${pro.value.productPrice * pro.value.quantity}(VND)</td>
                                                                                        <c:set var="total" value="${total + pro.value.productPrice * pro.value.quantity}" />
                                                                                        <td class="alignright">
                                                                                            <c:url var="Remove" value="MainController">
                                                                                                <c:param name="action" value="Remove"></c:param>
                                                                                                <c:param name="productID" value="${pro.value.productID}"></c:param>
                                                                                            </c:url>
                                                                                            <a href="${Remove}">Delete</a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </form>    
                                                                            </c:forEach>
                                                                            <tr class="total">
                                                                                <td></td>
                                                                                <td></td>
                                                                                <td></td>
                                                                                <td></td>
                                                                                <td></td>
                                                                                <td class="alignright" width="80%">Total</td>
                                                                                <td class="alignright">${total}(VND)</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <c:url var="CheckOut" value="MainController">
                                                                                        <c:param name="action" value="CheckOut"></c:param>
                                                                                        <c:param name="total" value="${total}"></c:param>
                                                                                    </c:url>
                                                                                    <a href="${CheckOut}">CheckOut</a>
                                                                                </td>
                                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>          
                                            </tbody></table>
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                    </tr>
                    </tbody></table>
                </div>
            </td>
            <td></td>
        </tr>
    </tbody>
</table>

</c:if> 
</div>
</div>
</br>
</br>

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
<script src="js/bootstrap.js"></script>        
</body>
</html>

