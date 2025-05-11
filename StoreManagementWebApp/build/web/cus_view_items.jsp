<%-- 
    Document   : cus_view_items
    Created on : 11-May-2025, 08:30:26
    Author     : innoc
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.model.entities.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <body>
        <h1>Store Menu</h1>
        
        <%
            String msg = (String) request.getAttribute("msg");

            if (msg != null) {
        %>
        <p><%=msg%></p>
        <%
            }
        %>
        
        <table border='1'>
            <%
                List<Item> stock = (List<Item>) session.getAttribute("stock");

                if (stock != null && stock.size() > 0) {
            %>

            <th>Item Name</th>
            <th>Item Brand</th>
            <th>Item Price</th>
            <th>Item Quantity</th>
            <th>Was Added By</th>
            <th>Was Added On</th>


            <%
                for (Item item : stock) {

            %>
            <tr>
                <td><%=item.getItemName()%></td>
                <td><%=item.getItemBrand()%></td>
                <td><%=item.getItemPrice()%></td>
                <td><%=item.getQuantity()%></td>
                <td><%=item.getEmpno()%></td>
                <td><%=item.getDate()%></td>
            </tr>

            <%
                }
            } else {
            %>
            <p>
                No Items In Stock.
            </p>
            <%
                }
            %>
        </table>
        <ul>
            <li><a href="index.html">Back</a></li>
        </ul>
    </body>
    </body>
</html>
