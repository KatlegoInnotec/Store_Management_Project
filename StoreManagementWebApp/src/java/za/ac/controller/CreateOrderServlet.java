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
import javax.servlet.http.HttpSession;
import za.ac.model.bl.CustomerFacadeLocal;
import za.ac.model.bl.ItemFacadeLocal;
import za.ac.model.bl.OrderItemFacadeLocal;
import za.ac.model.entities.Customer;
import za.ac.model.entities.Item;
import za.ac.model.entities.OrderItem;

/**
 *
 * @author innoc
 */
public class CreateOrderServlet extends HttpServlet {

    @EJB
    OrderItemFacadeLocal ofl;

    @EJB
    ItemFacadeLocal ifl;

    @EJB
    CustomerFacadeLocal cfl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String[] selectedItems = request.getParameterValues("selectedItems");
        String destination = request.getParameter("param");

        List<Item> items = new ArrayList<>();
        boolean allValid = true;

        if (selectedItems != null) {

            for (int i = 0; i < selectedItems.length; i++) {

                String id = selectedItems[i];
                String quantStr = request.getParameter("quan#" + id);
                Integer quantity = Integer.parseInt(quantStr);
                Item item = ifl.find(Long.parseLong(id));           //original stock item 

                if (quantity > item.getQuantity()) {     //compare quantities to make sure customer does not order more than whats available
                    allValid = false;
                    break;
                } else {
                    item.setQuantity(quantity);
                    items.add(item);
                }

            }
            if (!allValid) {
                 request.setAttribute("msg", "You ordered More than what is available");
                if ("search".equals(destination)) {
                   
                    request.getRequestDispatcher("search_result.jsp").forward(request, response);
                } else {
                    
                    request.getRequestDispatcher("cus_view_items.jsp").forward(request, response);
                }

            } else {
                //create customer details
                Customer customer = new Customer();
                String cName = (String) session.getAttribute("custName");
                customer.setName(cName);
                List<OrderItem> order = new ArrayList<>();
                cfl.create(customer);
                
                //initialize customer order
                for (Item i : items) {
                    OrderItem oi = new OrderItem(i.getQuantity(), customer, i);
                    order.add(oi);
                    ofl.create(oi);
                }
                customer.setOrderList(order);
                cfl.edit(customer);
                
                //update stock information
                for(OrderItem i : customer.getOrderList()){
                    Item item = ifl.find(i.getItem().getItemId());
                    Integer newValue = item.getQuantity() - i.getQuantity();
                    item.setQuantity(newValue);
                    ifl.edit(item);
                }

                request.setAttribute("msg", "Your Order was Added Successfully");
                customer = cfl.find(customer.getCustId());
                customer.getOrderList().size();
                
                List<Item> stock = ifl.findAll();
                session.setAttribute("stock", stock);
                session.setAttribute("customer", customer);
                request.getRequestDispatcher("order_added.jsp").forward(request, response);
                

            }

        } else {
            allValid = false;
            request.setAttribute("msg", "Select Any Items To Place an Order!!");
            if ("search".equals(destination)) {
               
                request.getRequestDispatcher("search_result.jsp").forward(request, response);
            } else {
                
                request.getRequestDispatcher("cus_view_items.jsp").forward(request, response);
            }

        }

    }

}
