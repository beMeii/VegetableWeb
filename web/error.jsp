<%-- 
    Document   : error
    Created on : Oct 3, 2021, 5:35:52 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Error:<%= session.getAttribute("ERROR") %> </h1>
    </body>
</html>
