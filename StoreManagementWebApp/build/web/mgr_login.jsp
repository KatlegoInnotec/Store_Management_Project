<%-- 
    Document   : mgr_login
    Created on : 07-May-2025, 15:24:56
    Author     : innoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Enter Your Details!</h1>

        <%
            String err_msg = (String) request.getAttribute("err_msg");

            if (err_msg != null) {
        %>
        <p><%=err_msg%></p>
        <%
            }
        %>

        <form action="LoginServlet.do" method="post">

            <table>
                <tr>
                    <td>Employee Name</td>
                    <td><input type="text" name="empname"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="LOGIN"/></td>
                </tr>
            </table>

        </form>
    </body>
</html>
