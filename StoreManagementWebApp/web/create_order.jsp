<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Order</title>
        <style>
            /* Global Styles */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f5f7fa;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                color: #333;
            }
            
            /* Order Container */
            .order-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
                width: 100%;
                max-width: 500px;
            }
            
            /* Header */
            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
                font-size: 24px;
                font-weight: 600;
            }
            
            /* Message Styling */
            .message {
                padding: 12px 15px;
                border-radius: 5px;
                margin-bottom: 20px;
                text-align: center;
                font-weight: 500;
            }
            
            .success-message {
                background-color: #e8f5e9;
                color: #2e7d32;
                border-left: 4px solid #4caf50;
            }
            
            .error-message {
                background-color: #ffebee;
                color: #c62828;
                border-left: 4px solid #f44336;
            }
            
            /* Form Styles */
            .order-form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            
            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }
            
            label {
                font-weight: 500;
                color: #2c3e50;
            }
            
            input[type="text"],
            input[type="number"] {
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 14px;
                transition: border-color 0.3s;
                width: 100%;
                box-sizing: border-box;
            }
            
            input[type="text"]:focus,
            input[type="number"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            }
            
            /* Submit Button */
            .submit-btn {
                background-color: #3498db;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                transition: background-color 0.3s;
                margin-top: 10px;
                width: 100%;
            }
            
            .submit-btn:hover {
                background-color: #2980b9;
            }
            
            /* Back Link */
            .back-link {
                display: inline-block;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.3s;
                text-align: center;
                width: 100%;
            }
            
            .back-link:hover {
                color: #2980b9;
                text-decoration: underline;
            }
            
            /* Responsive Design */
            @media (max-width: 480px) {
                .order-container {
                    padding: 30px 20px;
                    margin: 20px;
                }
                
                h1 {
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="order-container">
            <h1>Add Items to Order</h1>
            
            <%-- Message Display --%>
            <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
            %>
                <div class="message <%=msg.toLowerCase().contains("success") ? "success-message" : "error-message"%>">
                    <%=msg%>
                </div>
            <%
                }
            %>
            
            <form action="CreateOrderServlet" method="POST" class="order-form">
                <div class="form-group">
                    <label for="cusname">Customer Name</label>
                    <input type="text" id="cusname" name="cusname" required>
                </div>
                
                <div class="form-group">
                    <label for="brandname">Item Brand Name</label>
                    <input type="text" id="brandname" name="brandname" required>
                </div>
                
                <div class="form-group">
                    <label for="itemprice">Item Price (R)</label>
                    <input type="number" id="itemprice" name="itemprice" step="0.01" min="0" required>
                </div>
                
                <div class="form-group">
                    <label for="quan">Quantity</label>
                    <input type="number" id="quan" name="quan" min="1" required>
                </div>
                
                <button type="submit" class="submit-btn">Add Item</button>
            </form>
            
            <a href="marg_menu.jsp" class="back-link">← Back to Menu</a>
        </div>
    </body>
</html>