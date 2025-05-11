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
        <title>View All Orders Page</title>
    </head>
    <body>
        <h1>Below is All the orders!</h1>
        <%
            List<Customer> orders = (List<Customer>) session.getAttribute("orders");
            Integer totalOrders = (Integer) session.getAttribute("totalOrders");
            Double amountMade = (Double) session.getAttribute("amountMade");

            if (orders != null && totalOrders != null && amountMade != null && orders.size() > 0) {

        %>
        <table>
            <tr>
                <td>TOTAL ORDERS: </td>
                <td><%=totalOrders%></td>
            </tr>
            <tr>
                <td>Amount Made: </td>
                <td>R<%=amountMade%></td>
            </tr>
        </table>
        <br>
        <br>


        <%
            int a = 0;
            for (Customer c : orders) {

                a++;
        %>
        <table>
            <tr>
                <td>No</td>
                <td><%=a%></td>
            </tr>
            <tr>
                <td>Customer ID:</td>
                <td><%=c.getCustId()%></td>
            </tr>
            <tr>
                <td>Customer Name:</td>
                <td><%=c.getName()%></td>
            </tr>
            <tr>
                <td>Number Of Orders:</td>
                <td><%=c.getOrderList().size()%></td>
            </tr>
            <tr>
                <td><b>Ordered Items</b></td>
            </tr>

            <%
                
                Integer b = 0;
                for (OrderItem i : c.getOrderList()) {
                    
                    b++;
            %>
            <tr>
                <td>&nbsp;<%=b%>. &nbsp; <%=i.getItem().getItemName()%>: &nbsp; <%=i.getQuantity()%> </td>
            </tr>
            <tr>

            </tr>
            <br>

            <%
                    }

                }


            %>


            <% } else {
            %>
            <p>No Order Have been Placed Yet.</p>
            <%
                }

            %>
        </table>
        <br>
        
        <ul>
            <li><a href="marg_menu.jsp">Back</a></li>
        </ul>
    </body>
</html>
