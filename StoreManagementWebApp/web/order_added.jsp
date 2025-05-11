<%-- 
    Document   : order_added
    Created on : 11-May-2025, 08:57:51
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>order_added</h1>
        <%
                String msgBox = (String)   request.getAttribute("msg");
         %>
         
         <p><%=msgBox%></p>
        
        <a href="index.html">Home page</a>
    </body>
</html>
