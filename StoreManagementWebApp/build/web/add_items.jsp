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
                border-bottom: 2px solid #3498db;
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
                background-color: #3498db;
                color: white;
                border: none;
                padding: 10px 20px;
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
                text-align: center;
                margin-top: 20px;
            }
            
            li {
                display: inline-block;
                margin: 0 10px;
            }
            
            a {
                text-decoration: none;
                color: #3498db;
                padding: 5px 10px;
                border: 1px solid #3498db;
                border-radius: 4px;
                transition: all 0.3s;
            }
            
            a:hover {
                background-color: #3498db;
                color: white;
            }
        </style>
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
                    <td><input type="text" name="itemname" required></td>
                </tr>
                <tr>
                    <td>Item brand name</td>
                    <td><input type="text" name="brandname" required></td>
                </tr>
                <tr>
                    <td>Item price</td>
                    <td><input type="number" name="itemprice" min="0" step="0.01" required></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quan" min="1" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Add Item">
                    </td>
                </tr>
            </table>
        </form>

        <ul>
            <li><a href="marg_menu.jsp">Back</a></li>
        </ul>
    </body>
</html>