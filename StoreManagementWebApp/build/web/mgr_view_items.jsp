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
            
            .message {
                background-color: #3498db;
                color: white;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                max-width: 800px;
                margin: 20px auto;
            }
            
            .no-items {
                text-align: center;
                font-size: 18px;
                color: #7f8c8d;
                margin: 30px 0;
            }
            
            .inventory-table {
                width: 90%;
                max-width: 1200px;
                margin: 30px auto;
                border-collapse: collapse;
                background-color: white;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            
            .inventory-table th {
                background-color: #3498db;
                color: white;
                padding: 15px;
                text-align: left;
            }
            
            .inventory-table td {
                padding: 12px 15px;
                border-bottom: 1px solid #ecf0f1;
            }
            
            .inventory-table tr:hover {
                background-color: #f8f9fa;
            }
            
            .action-btn {
                display: inline-block;
                padding: 8px 15px;
                border-radius: 4px;
                text-decoration: none;
                font-weight: bold;
                transition: all 0.3s;
                margin: 2px;
            }
            
            .edit-btn {
                background-color: #f39c12;
                color: white;
                border: none;
                cursor: pointer;
            }
            
            .edit-btn:hover {
                background-color: #e67e22;
            }
            
            .delete-btn {
                background-color: #e74c3c;
                color: white;
                border: none;
                cursor: pointer;
            }
            
            .delete-btn:hover {
                background-color: #c0392b;
            }
            
            .back-link {
                text-align: center;
                margin-top: 30px;
            }
            
            .back-link a {
                text-decoration: none;
                color: #3498db;
                padding: 10px 20px;
                border: 1px solid #3498db;
                border-radius: 4px;
                transition: all 0.3s;
                font-weight: bold;
            }
            
            .back-link a:hover {
                background-color: #3498db;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Manage Inventory</h1>
        
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="message"><%=msg%></div>
        <%
            }
        %>
        
        <table class="inventory-table">
            <%
                List<Item> stock = (List<Item>) session.getAttribute("stock");
                if (stock != null && stock.size() > 0) {
            %>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Item Brand</th>
                    <th>Price (R)</th>
                    <th>Quantity</th>
                    <th>Added By</th>
                    <th>Date Added</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Item item : stock) {
            %>
                <tr>
                    <td><%=item.getItemName()%></td>
                    <td><%=item.getItemBrand()%></td>
                    <td><%=String.format("%.2f", item.getItemPrice())%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><%=item.getEmpno()%></td>
                    <td><%=item.getDate()%></td>
                    <td>
                        <a href="EditItem?id=<%=item.getItemId()%>" class="action-btn edit-btn">EDIT</a>
                        <a href="DeleteItem?id=<%=item.getItemId()%>" class="action-btn delete-btn">DELETE</a>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
            <%
                } else {
            %>
            </table>
            <p class="no-items">No items currently in stock.</p>
            <%
                }
            %>
        
        <div class="back-link">
            <a href="marg_menu.jsp">Back to Menu</a>
        </div>
    </body>
</html>