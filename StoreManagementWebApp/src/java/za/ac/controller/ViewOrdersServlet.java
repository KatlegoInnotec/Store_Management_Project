/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.model.bl.CustomerFacadeLocal;
import za.ac.model.entities.Customer;
import za.ac.model.entities.OrderItem;

/**
 *
 * @author Kgothatso Moyo
 */
public class ViewOrdersServlet extends HttpServlet {

   @EJB
   CustomerFacadeLocal cfl;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        List<Customer> orders = cfl.findAll();
        Integer totalOrders = cfl.count();
        Double amountMade = 0.0;
        for(Customer customer : orders){
            for(OrderItem order : customer.getOrderList()){
                amountMade += order.getQuantity() * order.getItem().getItemPrice();
            }
        }
        
        session.setAttribute("amountMade", amountMade);
        session.setAttribute("orders", orders);
        session.setAttribute("totalOrders", totalOrders);
        
        response.sendRedirect("orders.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

 
}
