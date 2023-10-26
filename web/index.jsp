<%-- 
    Document   : index
    Created on : 24 ต.ค. 2566, 16:06:44
    Author     : Akiparn
--%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Products"%>
<%@page import="model.ProductsTable"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping</title>
            <style type="text/css">
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

    </head>
    <body>
        <jsp:useBean id="product" class="model.Products" scope="request"/>
     <%
                       
            List<Products> productList = ProductsTable.findAllProducts();
            Iterator<Products> itr = productList.iterator();
            
     %>
<form method="post" action="AddToShoppingCartController">
  <center>
    <h1>DVD Catalog</h1>
    <table border="1">
      <tr>
        <th>Select</th>
        <th>DVD Names</th>
        <th>Rate</th>
        <th>Year</th>
        <th>Price</th>
        <th>Quantity</th>
      </tr>
      <%
        while(itr.hasNext()) {
          product = itr.next();
      %>
        <tr>
            <td><input type="checkbox" name="selectedDVDs" value="<%= product.getId() %>"></td>
          <td><%= product.getMovie() %></td>
          <td><%= product.getRating() %></td>
          <td><%= product.getYearcreate() %></td>
          <td><%= product.getPrice() %></td>
          <td><input type="number" name="quantity_<%= product.getId() %>"></td>
        </tr>
      <%
        }
      %>
    </table>
    <input type="submit" value="Add To Cart">
  </center>
</form>
    </body>
</html>
