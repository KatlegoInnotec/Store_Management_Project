<%-- 
    Document   : marg_menu
    Created on : 07-May-2025, 16:10:05
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Menu Page</title>
        <link rel="stylesheet" href="marg_menu.css">
    </head>
    <body>
        <h1>Menu!</h1>
        <%
            String msg = (String) request.getAttribute("msg");

            if (msg != null) {
        %>
        <p><%=msg%></p>
        <%
            }
        %>
        <p>
            Perform CRUD operations:
        </p>
        <ul>
            <li><a href="add_items.jsp">Add Items</a></li>
            <li><a href="ViewItems">View Items</a></li>
            <li><a href="ViewOrders">View Orders</a></li>
            
        </ul>
        
        
        <p>Log out <a href="LoginServlet.do?logout=true"> here </a></p>
    </body>
</html>
