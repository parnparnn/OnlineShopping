/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Products;
import model.ProductsTable;
import model.Shoppingcart;
import model.ShoppingcartPK;
import model.ShoppingcartTable;

/**
 *
 * @author Akiparn
 */
public class ConfirmShoppingCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        int grandTotal = Integer.parseInt(request.getParameter("grandTotal"));
        String[] productIds = request.getParameterValues("productId");
        List<Shoppingcart> shoppingcartList = ShoppingcartTable.findAllShoppingcart();
        int cartId;
        if (shoppingcartList.isEmpty()) {
            cartId = 1;
        }else {
                Shoppingcart lastProduct = shoppingcartList.get(shoppingcartList.size() - 1);
                cartId = lastProduct.getShoppingcartPK().getCartId()+1;
        }
        for (int i = 0; i < productIds.length; i++) {
        for (String productId : productIds) {
                int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
                int Id =Integer.parseInt(productId);
                Products prod = ProductsTable.findProductsById(Id);
                Shoppingcart cart = new Shoppingcart();
                ShoppingcartPK cartPK = new ShoppingcartPK(cartId, Id);
                cart.setShoppingcartPK(cartPK);
                cart.setQuantity(quantity);
                cart.setProducts(prod);
                ShoppingcartTable.insertShoppingcart(cart);
        }        
        }
        request.getRequestDispatcher("ShowConfirmation.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
