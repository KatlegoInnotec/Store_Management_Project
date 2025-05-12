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
        <title>Order Added Page</title>
        <link rel="stylesheet" href="order_added.css">
    </head>
    <body>
        <h1>Order_Added</h1>
        <%
            String msgBox = (String) request.getAttribute("msg");
            Customer order = (Customer) session.getAttribute("customer");
            Double totalPrice = 0.0;

            if (msgBox != null && order != null) {

        %>
        <p><%=msgBox%><br>
            Note your Customer ID as it will be different every time you place an order
        </p>
        <br>

        <table>
            <tr>
                <td>Customer ID:</td>
                <td><%=order.getCustId()%></td>
            </tr>
            <tr>
                <td>Customer Name:</td>
                <td><%=order.getName()%></td>
            </tr>
            <tr>
                <td>Number Of Orders:</td>
                <td><%=order.getOrderList().size()%></td>
            </tr>
            <tr>
                <td><b>Ordered Items</b></td>
            </tr>

            <%
                int a = 0;

                for (OrderItem i : order.getOrderList()) {
                    totalPrice += i.getQuantity() * i.getItem().getItemPrice();
                    a++;
                    
            %>
            <tr>
                <td>&nbsp;<%=a%>. &nbsp; <%=i.getItem().getItemName()%>: &nbsp; <%=i.getQuantity()%> </td>
            </tr>

            <%
                    }

                }


            %>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Total Price:</b></td>
                <td>R<%=totalPrice%></td>
            </tr>
        </table>

        <ul>
            <li><a href="cus_view_items.jsp">Back</a></li>
        </ul>

    </body>
</html>
