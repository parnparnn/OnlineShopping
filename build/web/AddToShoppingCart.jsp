<%-- 
    Document   : AddToShoppingCart
    Created on : 25 ต.ค. 2566, 02:27:53
    Author     : Akiparn
--%>

<%@page import="model.ProductsTable"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping</title>
    </head>           <style type="text/css">
        table {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="number"] {
            width: 50px;
        }

        input[type="submit"] {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
<body>
<center>
    <h1>Shopping Cart</h1>
    
    <%
    List<Products> selectedProducts = (List<Products>) session.getAttribute("selectedProducts");
    if (selectedProducts != null && !selectedProducts.isEmpty()) {
    %>
    <form method="post" action="ConfirmShoppingCartController">
        <table border="1">
            <tr>
                <th>DVD Names</th>
                <th>Rating</th>
                <th>Year</th>
                <th>Price/Unit</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <%
            int grandTotal = 0;
            for (Products product : selectedProducts) {
                int productId = product.getId();
                int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
                int totalForProduct = product.getPrice() * quantity;
                grandTotal += totalForProduct;
            %>
                <tr>
                <input type="hidden"  name="productId"  value="<%= product.getId() %>">
                <input type="hidden"  name="quantity_<%= product.getId() %>"  value="<%= quantity %>">
                    <td><%= product.getMovie() %></td>
                    <td><%= product.getRating() %></td>
                    <td><%= product.getYearcreate() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= quantity %></td>
                    <td><%= totalForProduct %></td>
                </tr>
            <%
            }
            %>
            <tr>
                <td colspan="5">Total</td> 
                 <td><%= grandTotal %></td> 
                 <input type="hidden"  name="grandTotal"  value="<%= grandTotal %>">
            </tr>
        </table>
           
            <input type="submit" value="Check out">
            </form>
    <%
    }
    %>

    </center>
</body>
</html>
