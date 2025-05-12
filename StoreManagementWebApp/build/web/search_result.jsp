<%-- 
    Document   : search_result
    Created on : 11 May 2025, 9:26:56 PM
    Author     : Kgothatso Moyo
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.model.entities.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result Page</title>
        <link rel="stylesheet" href="search_result.css">
    </head>
    <body>
        <h1>Below are Your Search Results</h1>
         <%
            String msg = (String) request.getAttribute("msg");
            String custName = (String) session.getAttribute("custName");
            String inidicator = (String) session.getAttribute("stockIndicator");
            if (msg != null) {
        %>
        <p><%=msg%></p>
        <%
            }
            if (custName != null) {
        %>
        <p><b><%=custName%></b>, proceed as if you are on the menu page.</p>
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
                    List<Item> stock = (List<Item>) session.getAttribute("sStock");

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
                    The searched item is not on Stock.
                </p>
                <%
                    }
                %>

            </table>
            <br><br>
            <input type="hidden" name="param" value="search">
            <input type="submit" value="PLACE ORDER">
        </form>


        <ul>
            <li><a href="cus_view_items.jsp">Back</a></li>
        </ul>
    </body>
</html>
