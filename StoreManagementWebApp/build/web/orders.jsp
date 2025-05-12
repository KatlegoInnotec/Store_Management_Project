<%-- 
    Document   : orders
    Created on : 11 May 2025, 10:47:59 PM
    Author     : Kgothatso Moyo
--%>

<%@page import="za.ac.model.entities.OrderItem"%>
<%@page import="za.ac.model.entities.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Management</title>
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
                border-bottom: 2px solid #9b59b6;
                padding-bottom: 10px;
                max-width: 800px;
                margin-left: auto;
                margin-right: auto;
            }
            
            .summary-card {
                background-color: white;
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: space-between;
            }
            
            .summary-item {
                text-align: center;
                padding: 10px 20px;
            }
            
            .summary-value {
                font-size: 24px;
                font-weight: bold;
                color: #9b59b6;
            }
            
            .summary-label {
                color: #7f8c8d;
                font-size: 14px;
            }
            
            .order-card {
                background-color: white;
                max-width: 800px;
                margin: 20px auto;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            
            .order-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ecf0f1;
            }
            
            .order-number {
                font-weight: bold;
                color: #9b59b6;
                font-size: 18px;
            }
            
            .customer-info {
                margin-bottom: 15px;
            }
            
            .info-label {
                font-weight: bold;
                color: #7f8c8d;
                display: inline-block;
                width: 150px;
            }
            
            .items-header {
                color: #9b59b6;
                font-weight: bold;
                margin: 15px 0 10px 0;
                padding-bottom: 5px;
                border-bottom: 1px dashed #ecf0f1;
            }
            
            .item-row {
                padding: 8px 0;
                margin-left: 20px;
            }
            
            .no-orders {
                text-align: center;
                color: #7f8c8d;
                font-size: 18px;
                margin: 50px 0;
            }
            
            .back-link {
                text-align: center;
                margin-top: 30px;
            }
            
            .back-link a {
                text-decoration: none;
                color: #9b59b6;
                padding: 10px 20px;
                border: 1px solid #9b59b6;
                border-radius: 4px;
                transition: all 0.3s;
                font-weight: bold;
            }
            
            .back-link a:hover {
                background-color: #9b59b6;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Order Management Dashboard</h1>
        
        <%
            List<Customer> orders = (List<Customer>) session.getAttribute("orders");
            Integer totalOrders = (Integer) session.getAttribute("totalOrders");
            Double amountMade = (Double) session.getAttribute("amountMade");

            if (orders != null && totalOrders != null && amountMade != null && orders.size() > 0) {
        %>
        
        <div class="summary-card">
            <div class="summary-item">
                <div class="summary-value"><%=totalOrders%></div>
                <div class="summary-label">TOTAL ORDERS</div>
            </div>
            <div class="summary-item">
                <div class="summary-value">R<%=String.format("%.2f", amountMade)%></div>
                <div class="summary-label">TOTAL REVENUE</div>
            </div>
        </div>

        <%
            int a = 0;
            for (Customer c : orders) {
                a++;
        %>
        
        <div class="order-card">
            <div class="order-header">
                <div class="order-number">ORDER #<%=a%></div>
                <div class="order-date"><%=c.getOrderList().get(0).getOrderDate()%></div>
            </div>
            
            <div class="customer-info">
                <div><span class="info-label">Customer ID:</span> <%=c.getCustId()%></div>
                <div><span class="info-label">Customer Name:</span> <%=c.getName()%></div>
                <div><span class="info-label">Items Ordered:</span> <%=c.getOrderList().size()%></div>
            </div>
            
            <div class="items-header">ORDERED ITEMS</div>
            
            <%
                int b = 0;
                double orderTotal = 0.0;
                for (OrderItem i : c.getOrderList()) {
                    b++;
                    orderTotal += i.getQuantity() * i.getItem().getItemPrice();
            %>
            <div class="item-row">
                <%=b%>. <%=i.getItem().getItemName()%> (Qty: <%=i.getQuantity()%> × R<%=String.format("%.2f", i.getItem().getItemPrice())%>)
            </div>
            <%
                }
            %>
            
            <div style="text-align: right; margin-top: 15px; font-weight: bold;">
                Order Total: R<%=String.format("%.2f", orderTotal)%>
            </div>
        </div>
        
        <%
            }
        %>
        
        <%
            } else {
        %>
        <div class="no-orders">No orders have been placed yet.</div>
        <%
            }
        %>
        
        <div class="back-link">
            <a href="marg_menu.jsp">Back to Manager Menu</a>
        </div>
    </body>
</html>