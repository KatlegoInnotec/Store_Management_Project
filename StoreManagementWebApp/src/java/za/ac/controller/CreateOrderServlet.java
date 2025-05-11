/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.model.bl.CustomerFacadeLocal;
import za.ac.model.entities.Customer;
import za.ac.model.entities.Item;

/**
 *
 * @author innoc
 */
public class CreateOrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    CustomerFacadeLocal cfl;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
            String name = request.getParameter("name");
            //Long empno = Long.parseLong(request.getParameter("empno"));

            String[] itemNames = request.getParameterValues("itemName");
            String[] itemBrands = request.getParameterValues("itemBrand");
            String[] itemPrices = request.getParameterValues("itemPrice");
            String[] quantities = request.getParameterValues("quantity");

            List<Item> items = new ArrayList<>();
            for (int i = 0; i < itemNames.length; i++) {
                Item item = new Item();
                item.setItemName(itemNames[i]);
                item.setItemBrand(itemBrands[i]);
                item.setItemPrice(Double.parseDouble(itemPrices[i]));
                item.setQuantity(Integer.parseInt(quantities[i]));
                items.add(item);
            }
            
              Customer c = new Customer(name, items);

            cfl.create(c);

             request.setAttribute("msg", "Item added Succesfuly");
            request.getRequestDispatcher("order_added.jsp").forward(request, response);
        } catch (Exception e) {
            
        }
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
