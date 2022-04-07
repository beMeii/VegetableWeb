<%-- 
    Document   : manageProduct
    Created on : Oct 18, 2021, 4:36:33 PM
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
        <div style="background-image: url(images/backgroundSearch.png); height: 100%; width: 100;">
            <div class="container">           
                <div class="banner-info">
                    <h3>SEARCH</h3>
                    <div class="search-form" >
                        <form action="MainController">
                            <input type="text" name="searchP" value="${param.searchP}"/>  
                            <input type="submit" name="action" value="SearchP"/>
                            <select name="searchStatus">
                                <option value="1" <c:if test="${param.searchStatus eq '1'}">selected</c:if> >Valid</option>
                                <option value="0" <c:if test="${param.searchStatus eq '0'}">selected</c:if> >Invalid</option>
                            </select>
                        </form> 
                    </div>		
                </div>	
            </div>
        </div>
        <div class="content-top ">
            <div class="container ">                
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product's ID</th>
                            <th>Product's Name</th>
                            <th>Product's Price</th>
                            <th>Product's quantity</th>
                            <th>Product's category</th>
                            <th>Product's status</th>
                            <th>Product's image</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${LIST_PRODUCT}" var="pro" varStatus="counter" >
                        <form action="MainController">

                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <input type="text" name="productID" value="${pro.productID}" readonly=""/>
                                </td>
                                <td>
                                    ${pro.productName}
                                </td>
                                <td>
                                    <input type="number" name="productPrice" value="${pro.productPrice}" required="" />
                                </td>
                                <td>
                                    <input type="number" name="quantity" value="${pro.quantity}" required="" />
                                </td>
                                <td>
                                    ${pro.categoryID}
                                </td>
                                <td>
                                    <input type="number" name="status" value="${pro.status}" max="1" min="0" step="1" required="" />
                                </td>
                                <td>
                                    <image src="images/${pro.image}" width="128px" height="128px" />  
                                </td>    
                                <td>
                                <c:url var="deletePro" value="MainController">
                                    <c:param name="action" value="DeleteP"></c:param>
                                    <c:param name="productID" value="${pro.productID}"></c:param>
                                    <c:param name="searchP" value="${param.searchP}"></c:param>
                                    <c:param name="searchStatus" value="${param.searchStatus}"></c:param>
                                </c:url>
                                <a href="${deletePro}">Delete</a>
                                </td>
                                <td>
                                    <input type="submit" name="action" value="UpdateP"/>
                                    <input type="hidden" name="productID" value="${pro.productID}"/>
                                    <input type="hidden" name="searchP" value="${param.searchP}"/>
                                    <input type="hidden" name="searchStatus" value="${param.searchStatus}"/>
                                </td>
                                </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>

            </div>

        </div>
        <br>
        <br>

        <!--footer-->
        <jsp:include page="footer.jsp"/>
        <!-- //footer-->
        <!---->
    </body>
</html>
