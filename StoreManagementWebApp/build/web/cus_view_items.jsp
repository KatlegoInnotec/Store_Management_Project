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
        <title>Customer Menu Page</title>
    </head>
    <body>
    <body>
        <h1>Store Menu</h1>
        <form action="SearchItem" method="post">
            <tr>
                <td><input type="text" name="searchedItem" placeholder="Enter Name/Brand of Item" required=""></td>
                <td><input type="submit" value="SEARCH"></td>
            </tr>
        </form>

        <br><br>

        <%
            String msg = (String) request.getAttribute("msg");
            String inidicator = (String) session.getAttribute("stockIndicator");
            String custName = (String) session.getAttribute("custName");
            if (msg != null) {
        %>
        <p><%=msg%></p>
        <%
            }
            if (custName != null) {
        %>
        <p>Welcome <b><%=custName%></b>, View what you want to Order.</p>
        <%
            }
            if (inidicator != null) {
        %>
        <p><%=inidicator%></p>
        <%
            }
        %>

        <form action="CreateOrder" method="Post">
            <table border='1'>
                <%
                    List<Item> stock = (List<Item>) session.getAttribute("stock");

                    if (stock != null && stock.size() > 0) {
                %>

                <th>Item Name</th>
                <th>Item Brand</th>
                <th>Item Price</th>
                <th>Amount Available</th>



                <%
                    for (Item item : stock) {

                %>
                <tr>
                    <td><%=item.getItemName()%></td>
                    <td><%=item.getItemBrand()%></td>
                    <td><%=item.getItemPrice()%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><input type="number" name="quan#<%=item.getItemId()%>" min="1" value="1" placeholder="Order Items Amount"></td>
                    <td><input type="checkbox" name="selectedItems" value="<%=item.getItemId()%>"</td>
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
            <br><br>
            <input type="submit" value="PLACE ORDER">
        </form>


        <ul>
            <li><a href="index.html">Back</a></li>
        </ul>
    </body>
</body>
</html>
