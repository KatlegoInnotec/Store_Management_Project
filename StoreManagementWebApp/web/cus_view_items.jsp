<%@page import="java.util.List"%>
<%@page import="za.ac.model.entities.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Store Menu</title>
        <style>
            /* Global Styles */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 20px;
                color: #333;
                line-height: 1.6;
            }
            
            /* Container */
            .container {
                max-width: 1200px;
                margin: 0 auto;
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            
            /* Header */
            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            
            /* Search Form */
            .search-form {
                display: flex;
                gap: 10px;
                margin-bottom: 30px;
                justify-content: center;
            }
            
            .search-form input[type="text"] {
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                width: 300px;
                font-size: 16px;
            }
            
            .search-form input[type="submit"] {
                background-color: #3498db;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            
            .search-form input[type="submit"]:hover {
                background-color: #2980b9;
            }
            
            /* Messages */
            .message {
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 4px;
            }
            
            .welcome-message {
                background-color: #e8f5e9;
                color: #2e7d32;
                border-left: 4px solid #4caf50;
            }
            
            .info-message {
                background-color: #e3f2fd;
                color: #1565c0;
                border-left: 4px solid #2196f3;
            }
            
            .error-message {
                background-color: #ffebee;
                color: #c62828;
                border-left: 4px solid #f44336;
            }
            
            /* Items Table */
            .items-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
            }
            
            .items-table th {
                background-color: #3498db;
                color: white;
                padding: 12px;
                text-align: left;
            }
            
            .items-table td {
                padding: 12px;
                border-bottom: 1px solid #eee;
            }
            
            .items-table tr:hover {
                background-color: #f5f5f5;
            }
            
            .items-table input[type="number"] {
                width: 70px;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            
            .items-table input[type="checkbox"] {
                transform: scale(1.3);
            }
            
            /* Order Button */
            .order-btn {
                display: block;
                width: 200px;
                margin: 20px auto;
                background-color: #4caf50;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            
            .order-btn:hover {
                background-color: #388e3c;
            }
            
            /* Back Link */
            .back-link {
                display: inline-block;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
                transition: color 0.3s;
            }
            
            .back-link:hover {
                color: #2980b9;
                text-decoration: underline;
            }
            
            /* Empty State */
            .empty-state {
                text-align: center;
                padding: 40px;
                color: #777;
                font-size: 18px;
            }
            
            /* Responsive Design */
            @media (max-width: 768px) {
                .container {
                    padding: 15px;
                }
                
                .search-form {
                    flex-direction: column;
                    align-items: center;
                }
                
                .search-form input[type="text"] {
                    width: 100%;
                }
                
                .items-table {
                    display: block;
                    overflow-x: auto;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Store Menu</h1>
            
            <!-- Search Form -->
            <form action="SearchItem" method="post" class="search-form">
                <input type="text" name="searchedItem" placeholder="Enter Name/Brand of Item" required>
                <input type="submit" value="SEARCH">
            </form>
            
            <!-- Messages -->
            <%
                String msg = (String) request.getAttribute("msg");
                String indicator = (String) session.getAttribute("stockIndicator");
                String custName = (String) session.getAttribute("custName");
                
                if (msg != null) {
            %>
                <div class="message error-message"><%=msg%></div>
            <%
                }
                if (custName != null) {
            %>
                <div class="message welcome-message">Welcome <b><%=custName%></b>, please select items to order.</div>
            <%
                }
                if (indicator != null) {
            %>
                <div class="message info-message"><%=indicator%></div>
            <%
                }
            %>
            
            <!-- Items Table -->
            <form action="CreateOrder" method="Post">
                <table class="items-table">
                    <%
                        List<Item> stock = (List<Item>) session.getAttribute("stock");
                        
                        if (stock != null && stock.size() > 0) {
                    %>
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Brand</th>
                            <th>Price</th>
                            <th>Available</th>
                            <th>Quantity</th>
                            <th>Select</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Item item : stock) {
                        %>
                        <tr>
                            <td><%=item.getItemName()%></td>
                            <td><%=item.getItemBrand()%></td>
                            <td>R<%=String.format("%.2f", item.getItemPrice())%></td>
                            <td><%=item.getQuantity()%></td>
                            <td><input type="number" name="quan#<%=item.getItemId()%>" min="1" max="<%=item.getQuantity()%>" value="1"></td>
                            <td><input type="checkbox" name="selectedItems" value="<%=item.getItemId()%>"></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <%
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="empty-state">No items currently in stock</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                
                <%
                    if (stock != null && stock.size() > 0) {
                %>
                <input type="submit" value="PLACE ORDER" class="order-btn">
                <%
                    }
                %>
            </form>
            
            <a href="index.html" class="back-link">← Back to Home</a>
        </div>
    </body>
</html>