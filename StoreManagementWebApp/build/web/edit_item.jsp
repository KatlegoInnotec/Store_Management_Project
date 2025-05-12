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
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 20px;
                color: #333;
            }
            
            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
                border-bottom: 2px solid #e67e22;
                padding-bottom: 10px;
            }
            
            p {
                background-color: #e74c3c;
                color: white;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                max-width: 500px;
                margin: 20px auto;
            }
            
            form {
                background-color: white;
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
            }
            
            td {
                padding: 10px;
            }
            
            tr:not(:last-child) td {
                border-bottom: 1px solid #eee;
            }
            
            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            
            input[type="submit"] {
                background-color: #e67e22;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                font-weight: bold;
            }
            
            input[type="submit"]:hover {
                background-color: #d35400;
            }
            
            ul {
                list-style-type: none;
                padding: 0;
                text-align: center;
                margin-top: 20px;
            }
            
            li {
                display: inline-block;
                margin: 0 10px;
            }
            
            a {
                text-decoration: none;
                color: #e67e22;
                padding: 5px 10px;
                border: 1px solid #e67e22;
                border-radius: 4px;
                transition: all 0.3s;
            }
            
            a:hover {
                background-color: #e67e22;
                color: white;
            }
        </style>
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
                    <td><input type="text" value="<%=item.getItemName()%>" name="itemname" required></td>
                </tr>
                <tr>
                    <td>Item brand name</td>
                    <td><input type="text" value="<%=item.getItemBrand()%>" name="brandname" required></td>
                </tr>
                <tr>
                    <td>Item price</td>
                    <td><input type="number" step="0.01" min="0" value="<%=item.getItemPrice()%>" name="itemprice" required></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" min="1" value="<%=item.getQuantity()%>" name="quan" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="UPDATE ITEM">
                    </td>
                </tr>
            </table>
        </form>
        
        <ul>
            <li><a href="mgr_view_items.jsp">Back to Items List</a></li>
        </ul>
    </body>
</html>