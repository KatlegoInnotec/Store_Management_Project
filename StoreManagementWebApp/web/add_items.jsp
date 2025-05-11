<%-- 
    Document   : add_items
    Created on : 07-May-2025, 16:14:01
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Items Page</title>
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

        <form action="AddItemsServlet" method="POST">
            <table>
                <tr>
                    <td>Item Name</td>
                    <td><input type="text" name="itemname"></td>
                </tr>
                <tr>
                    <td>Item brand name</td>
                    <td><input type="text" name="brandname"></td>
                </tr>
                <tr>
                    <td>Item price</td>
                    <td><input type="number" name="itemprice"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quan"></td>
                </tr>
                <tr>

                    <td><input type="submit" value="Add Item"></td>
                </tr>

            </table>
        </form>
    </body>

    <ul>
        <li><a href="marg_menu.jsp">Back</a></li>
    </ul>
</html>
