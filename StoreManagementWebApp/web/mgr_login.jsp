<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Login</title>
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
            
            /* Login Container */
            .login-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
                width: 100%;
                max-width: 400px;
                text-align: center;
            }
            
            /* Header */
            h1 {
                color: #2c3e50;
                margin-bottom: 30px;
                font-size: 24px;
                font-weight: 600;
            }
            
            /* Error Message */
            .error-message {
                color: #e74c3c;
                background-color: #fdecea;
                padding: 10px 15px;
                border-radius: 5px;
                margin-bottom: 20px;
                font-size: 14px;
                border-left: 4px solid #e74c3c;
            }
            
            /* Form Styles */
            .login-form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            
            .form-group {
                text-align: left;
            }
            
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: #2c3e50;
            }
            
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 14px;
                transition: border-color 0.3s;
                box-sizing: border-box;
            }
            
            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            }
            
            /* Submit Button */
            input[type="submit"] {
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
            }
            
            input[type="submit"]:hover {
                background-color: #2980b9;
            }
            
            /* Responsive Design */
            @media (max-width: 480px) {
                .login-container {
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
        <div class="login-container">
            <h1>Manager Login</h1>
            
            <%-- Error Message Display --%>
            <%
                String err_msg = (String) request.getAttribute("err_msg");
                if (err_msg != null) {
            %>
                <div class="error-message"><%=err_msg%></div>
            <%
                }
            %>
            
            <form action="LoginServlet.do" method="post" class="login-form">
                <div class="form-group">
                    <label for="empname">Employee Name</label>
                    <input type="text" id="empname" name="empname" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <input type="submit" value="LOGIN">
            </form>
        </div>
    </body>
</html>