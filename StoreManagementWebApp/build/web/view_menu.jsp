<%-- 
    Document   : view_menu
    Created on : 11-May-2025, 08:26:11
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
                color: #333;
            }
            
            h1 {
                color: #2c3e50;
                margin: 30px 0;
                text-align: center;
                font-size: 2.2em;
                text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
            }
            
            form {
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                width: 90%;
                max-width: 500px;
                margin: 20px auto;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
            }
            
            td {
                padding: 10px;
            }
            
            input[type="text"] {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                box-sizing: border-box;
                transition: border-color 0.3s;
            }
            
            input[type="text"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
            }
            
            input[type="submit"] {
                background-color: #3498db;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s, transform 0.2s;
                width: 100%;
            }
            
            input[type="submit"]:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
            }
            
            input[type="submit"]:active {
                transform: translateY(0);
            }
            
            @media (max-width: 600px) {
                form {
                    padding: 20px;
                    width: 95%;
                }
                
                h1 {
                    font-size: 1.8em;
                }
            }
        </style>
    </head>
    <body>
        <h1>Available Items Below!</h1>
        
        <form action="ViewItems">
            <table>
                <tr>
                    <td><input type="text" name="custName" placeholder="Enter Your Name" required=""></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="user" value="customer"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="View Menu"></td>
                </tr>
            </table>
        </form>
    </body>
</html>