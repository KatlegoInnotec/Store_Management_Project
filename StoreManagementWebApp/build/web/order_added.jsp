<%-- 
    Document   : order_added
    Created on : 11-May-2025, 08:57:51
    Author     : innoc
--%>

<%@page import="za.ac.model.entities.OrderItem"%>
<%@page import="za.ac.model.entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
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
                border-bottom: 2px solid #27ae60;
                padding-bottom: 10px;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }
            
            .confirmation-box {
                background-color: white;
                max-width: 600px;
                margin: 0 auto;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            
            .message {
                background-color: #27ae60;
                color: white;
                padding: 15px;
                border-radius: 5px;
                text-align: center;
                margin-bottom: 20px;
            }
            
            .note {
                color: #e67e22;
                font-weight: bold;
                margin: 15px 0;
                text-align: center;
            }
            
            .order-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            
            .order-table td {
                padding: 10px;
                border-bottom: 1px solid #ecf0f1;
            }
            
            .order-table tr:last-child td {
                border-bottom: none;
            }
            
            .customer-info {
                font-weight: bold;
                color: #2c3e50;
            }
            
            .items-header {
                font-weight: bold;
                color: #27ae60;
                padding-top: 20px !important;
            }
            
            .total-row {
                font-weight: bold;
                font-size: 1.1em;
                color: #2c3e50;
                background-color: #f8f9fa;
            }
            
            .back-link {
                text-align: center;
                margin-top: 30px;
            }
            
            .back-link a {
                text-decoration: none;
                color: #27ae60;
                padding: 10px 20px;
                border: 1px solid #27ae60;
                border-radius: 4px;
                transition: all 0.3s;
                font-weight: bold;
            }
            
            .back-link a:hover {
                background-color: #27ae60;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="confirmation-box">
            <h1>Order Confirmation</h1>
            
            <%
                String msgBox = (String) request.getAttribute("msg");
                Customer order = (Customer) session.getAttribute("customer");
                Double totalPrice = 0.0;

                if (msgBox != null && order != null) {
            %>
            
            <div class="message"><%=msgBox%></div>
            <div class="note">Note your Customer ID as it will be different every time you place an order</div>
            
            <table class="order-table">
                <tr>
                    <td class="customer-info">Customer ID:</td>
                    <td><%=order.getCustId()%></td>
                </tr>
                <tr>
                    <td class="customer-info">Customer Name:</td>
                    <td><%=order.getName()%></td>
                </tr>
                <tr>
                    <td class="customer-info">Number Of Orders:</td>
                    <td><%=order.getOrderList().size()%></td>
                </tr>
                <tr>
                    <td colspan="2" class="items-header">Ordered Items</td>
                </tr>

                <%
                    int a = 0;
                    for (OrderItem i : order.getOrderList()) {
                        totalPrice += i.getQuantity() * i.getItem().getItemPrice();
                        a++;
                %>
                <tr>
                    <td colspan="2">
                        <%=a%>. <%=i.getItem().getItemName()%> (Qty: <%=i.getQuantity()%>)
                    </td>
                </tr>
                <%
                    }
                %>
                
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr class="total-row">
                    <td>Total Price:</td>
                    <td>R<%=String.format("%.2f", totalPrice)%></td>
                </tr>
            </table>
            <%
                }
            %>
            
            <div class="back-link">
                <a href="cus_view_items.jsp">Back to Shopping</a>
            </div>
        </div>
    </body>
</html>