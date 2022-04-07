<%-- 
    Document   : searchuser.jsp
    Created on : Sep 28, 2021, 7:57:43 PM
    Author     : Mai
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!--header-->
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
        <!--banner-->
        <div class="banner-top">
            <div class="container">
                <h3 >Manage User</h3>
                <h4><a href="Home">Home</a><label>/</label>Manage User</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--search user-->
        <div class="login">
            <div class="main-agileits">
                <div class="form-w3agile">
                    <h3>Hello Admin: ${sessionScope.LOGIN_USER.fullName}</h3>
                    <form action="MainController">
                        <div class="key">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input  type="text" name="search" value="${param.search}">
                            <div class="clearfix"></div>
                        </div>
                        <input type="submit" name="action" value="Search">
                    </form>
                    <c:if test="${requestScope.LIST_USER == null}">Search Users bên trên</c:if>
                    </div>
                </div>

            <c:if test="${requestScope.LIST_USER != null}">
                <c:if test="${not empty requestScope.LIST_USER}">
                    <div class="tableuser">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>User ID</th>
                                    <th>Full name</th>
                                    <th>Role ID</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Password</th>
                                    <th>Email</th>
                                    <th>Delete</th>
                                    <th>Update</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.LIST_USER}" var="user" varStatus="counter" >
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>
                                            <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="roleID" value="${user.roleID}"/>
                                        </td>
                                        <td>${user.phone}</td>
                                        <td>${user.address}</td>
                                        <td>${user.password}</td>
                                        <td>${user.email}</td>
                                        <td>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"></c:param>
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                                <c:param name="search" value="${param.search}"></c:param>
                                            </c:url>
                                            <a href="${deleteLink}">Delete</a>                                
                                        </td>
                                        <td>
                                            <input type="submit" name="action" value="Update"/>
                                            <input type="hidden" name="userID" value="${user.userID}"/>
                                            <input type="hidden" name="search" value="${param.search}"/>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>       
                        </c:if>
                </c:if>
                        <h1>${requestScope.ERROR}</h1>
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
