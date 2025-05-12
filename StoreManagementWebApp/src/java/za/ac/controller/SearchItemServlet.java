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
public class SearchItemServlet extends HttpServlet {

   @EJB
   ItemFacadeLocal ifl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String input = request.getParameter("searchedItem");
        
        List<Item> sStock  = ifl.searchFunction(input);
        
        session.setAttribute("sStock", sStock);
        
        request.getRequestDispatcher("search_result.jsp").forward(request, response);
        
    }

  
}
