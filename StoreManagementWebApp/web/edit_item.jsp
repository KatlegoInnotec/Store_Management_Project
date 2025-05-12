<%-- 
    Document   : edit_item
    Created on : 08 May 2025, 3:41:55 PM
    Author     : Kgothatso Moyo
--%>

<%@page import="za.ac.model.entities.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Item Page</title>
        <link rel="stylesheet" href="edit_item.css">
    </head>
    <body>
        <h1>Edit Item Details Below</h1>
        
        <%
            String msg = (String) request.getAttribute("msg");

            if (msg != null) {
        %>
        
        <p><%=msg%></p>
        
        <%
            }
        
        
            Item item = (Item) session.getAttribute("item");

        %>
        <form action="EditItem" method="POST">
            <table>
                <tr>
                    <td>Item Name</td>
                    <td><input type="text" value="<%=item.getItemName()%>" name="itemname"></td>
                </tr>
                <tr>
                    <td>Item brand name</td>
                    <td><input type="text" value="<%=item.getItemBrand()%>" name="brandname"></td>
                </tr>
                <tr>
                    <td>Item price</td>
                    <td><input type="number" step="any" value="<%=item.getItemPrice()%>" name="itemprice"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" value="<%=item.getQuantity()%>" name="quan"></td>
                </tr>
                <tr>

                    <td><input type="submit" value="EDIT ITEM"></td>
                </tr>

            </table>
        </form>
        <ul>
            <li><a href="mgr_view_items.jsp">Back</a></li>
        </ul>
    </body>
</html>
