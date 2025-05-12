<%-- 
    Document   : mgr_view_items
    Created on : 08 May 2025, 12:50:47 PM
    Author     : Kgothatso Moyo
--%>

<%@page import="za.ac.model.entities.Item"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Stock Page</title>
        <link rel="stylesheet" href="mgr_view_items.css">
    </head>
    <body>
        <h1>Manage Inventory Below</h1>
        
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
                <td><a href="EditItem?id=<%=item.getItemId()%>"><button>EDIT</button></a></td>
                <td><a href="DeleteItem?id=<%=item.getItemId()%>"><button>DELETE</button></a></td>
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
            <li><a href="marg_menu.jsp">Back</a></li>
        </ul>
    </body>
</html>
