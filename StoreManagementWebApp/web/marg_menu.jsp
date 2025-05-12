<%-- 
    Document   : marg_menu
    Created on : 07-May-2025, 16:10:05
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Menu Page</title>
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
            
            p {
                text-align: center;
                margin: 20px auto;
                max-width: 600px;
            }
            
            .message {
                background-color: #27ae60;
                color: white;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                max-width: 500px;
                margin: 20px auto;
            }
            
            .menu-container {
                background-color: white;
                max-width: 600px;
                margin: 0 auto;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            
            .menu-options {
                list-style-type: none;
                padding: 0;
                text-align: center;
            }
            
            .menu-options li {
                margin: 15px 0;
            }
            
            .menu-options a {
                display: block;
                text-decoration: none;
                color: white;
                background-color: #27ae60;
                padding: 12px 20px;
                border-radius: 4px;
                font-weight: bold;
                transition: all 0.3s;
            }
            
            .menu-options a:hover {
                background-color: #2ecc71;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            
            .logout {
                text-align: center;
                margin-top: 30px;
            }
            
            .logout a {
                color: #e74c3c;
                text-decoration: none;
                font-weight: bold;
                padding: 5px 10px;
                border: 1px solid #e74c3c;
                border-radius: 4px;
                transition: all 0.3s;
            }
            
            .logout a:hover {
                background-color: #e74c3c;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="menu-container">
            <h1>Manager Dashboard</h1>
            
            <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
            %>
            <div class="message"><%=msg%></div>
            <%
                }
            %>
            
            <p>Perform CRUD operations:</p>
            
            <ul class="menu-options">
                <li><a href="add_items.jsp">Add New Items</a></li>
                <li><a href="ViewItems">View/Edit Items</a></li>
                <li><a href="ViewOrders">Manage Orders</a></li>
            </ul>
        </div>
        
        <div class="logout">
            <p>Logout <a href="LoginServlet.do?logout=true">here</a></p>
        </div>
    </body>
</html>