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
        <link rel="stylesheet" href="view_menu.css">
    </head>
    <body>
        <h1>Available Items Below!</h1>
        
        <form action="ViewItems">
            <table>
                <tr>
                    <td><input type="text" name="custName" placeholder="Enter Your Name" required=""></td>
                    <td><input type="hidden" name="user" value="customer"></td>
                    <td><input type="submit" value="View Menu"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
