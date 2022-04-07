<%-- 
    Document   : footer
    Created on : Oct 18, 2021, 4:21:50 PM
    Author     : Mai
--%>

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
        <div class="footer">
            <div class="container">
                <div class="footer-bottom">
                    <h2 ><a href="page.jsp">RAU CỦ QUẢ ONLINE<span>The Best Supermarket</span></a></h2>
                    <div class="clearfix"></div>
                    <div class=" address">
                        <div class="col-md-4 fo-grid1">
                            <p><i class="fa fa-home" aria-hidden="true"></i>Thành phố Hồ Chí Minh</p>
                        </div>
                        <div class="col-md-4 fo-grid1">
                            <p><i class="fa fa-phone" aria-hidden="true"></i>0888023508</p>	
                        </div>
                        <div class="col-md-4 fo-grid1">
                            <p><a href="mailto:info@example.com"><i class="fa fa-envelope-o" aria-hidden="true"></i>hongmainguyen&&@example1.com</a></p>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </body>
</html>
