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
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 20px;
                background-color: #f5f5f5;
                color: #333;
            }
            
            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
            }
            
            p {
                background-color: #e8f4f8;
                padding: 10px;
                border-radius: 5px;
                border-left: 4px solid #3498db;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                box-shadow: 0 2px 3px rgba(0,0,0,0.1);
                background-color: white;
            }
            
            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            
            th {
                background-color: #3498db;
                color: white;
                font-weight: bold;
            }
            
            tr:hover {
                background-color: #f5f5f5;
            }
            
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            
            input[type="number"] {
                width: 80px;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            
            input[type="checkbox"] {
                transform: scale(1.3);
            }
            
            input[type="submit"] {
                background-color: #3498db;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            
            input[type="submit"]:hover {
                background-color: #2980b9;
            }
            
            ul {
                list-style-type: none;
                padding: 0;
            }
            
            li {
                margin: 10px 0;
            }
            
            a {
                display: inline-block;
                padding: 8px 16px;
                background-color: #7f8c8d;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            
            a:hover {
                background-color: #95a5a6;
            }
            
            .no-results {
                text-align: center;
                padding: 20px;
                background-color: #f8d7da;
                color: #721c24;
                border-left: 4px solid #f5c6cb;
                border-radius: 5px;
            }
        </style>
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
                <th>Quantity</th>
                <th>Select</th>

                <%
                    for (Item item : stock) {

                %>
                <tr>
                    <td><%=item.getItemName()%></td>
                    <td><%=item.getItemBrand()%></td>
                    <td><%=item.getItemPrice()%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><input type="number" name="quan#<%=item.getItemId()%>" min="1" value="1" placeholder="Order Items Amount"></td>
                    <td><input type="checkbox" name="selectedItems" value="<%=item.getItemId()%>"></td>
                </tr>

                <%
                    }
                } else {
                %>
                <div class="no-results">
                    <p>The searched item is not on Stock.</p>
                </div>
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