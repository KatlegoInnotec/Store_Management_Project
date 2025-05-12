<%-- 
    Document   : create_order
    Created on : 11-May-2025, 08:16:41
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
        <link rel="stylesheet" href="create_order.css">
    </head>
      <body>
        <h1>Add Items!</h1>
        
        <%
            String msg = (String) request.getAttribute("msg");

            if (msg != null) {
        %>
        <p><%=msg%></p>
        <%
            }
        %>
        
        <form action="CreateOrderServlet" method="POST">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="cusname"></td>
                </tr>
                <tr>
                    <td>Item brand name</td>
                    <td><input type="text" name="brandname"></td>
                </tr>
                <tr>
                    <td>Item price</td>
                    <td><input type="number" step="any" name="itemprice"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number"  name="quan"></td>
                </tr>
                <tr>

                    <td><input type="submit" value="Add Item"></td>
                </tr>

            </table>
        </form>
        <ul>
            <li><a href="marg_menu.jsp">Back</a></li>
        </ul>
    </body>
</html>
