<%-- 
    Document   : ShowConfirmation
    Created on : 25 ต.ค. 2566, 03:51:10
    Author     : Akiparn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping</title>
    </head>
    <body>
                    <%
                int grandTotal = Integer.parseInt(request.getParameter("grandTotal"));
            %>
            <h1>
        Your Order is confirmed!<br>
        The total amount is $<%= grandTotal %>
    </h1>
    </body>
</html>
