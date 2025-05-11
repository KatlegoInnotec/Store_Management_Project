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
import za.ac.model.bl.ItemFacadeLocal;
import za.ac.model.entities.Item;

/**
 *
 * @author Kgothatso Moyo
 */
public class DeleteItemServlet extends HttpServlet {

    @EJB
    ItemFacadeLocal ifl;
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
       Long id = Long.parseLong(request.getParameter("id"));

        Item item = ifl.find(id);

        if (item != null) {
            ifl.remove(item);
            List<Item> stock = ifl.findAll();
            session.setAttribute("stock", stock);
            response.sendRedirect("mgr_view_items.jsp"); 
        }
        else{
            response.sendRedirect("marg_menu.jsp");
        }

        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
}
