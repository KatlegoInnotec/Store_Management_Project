/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.model.bl.EmployeeFacadeLocal;
import za.ac.model.bl.ItemFacadeLocal;
import za.ac.model.entities.Employee;
import za.ac.model.entities.Item;

/**
 *
 * @author innoc
 */
public class AddItemsServlet extends HttpServlet {

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

    
    @EJB
    ItemFacadeLocal ifl;
    EmployeeFacadeLocal efl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (!request.getParameter("itemname").isEmpty() && !request.getParameter("brandname").isEmpty() && !request.getParameter("itemprice").isEmpty() && !request.getParameter("quan").isEmpty()) {

            String itemname = request.getParameter("itemname"),
                    brandname = request.getParameter("brandname");
            Double itemprice = Double.parseDouble(request.getParameter("itemprice"));
            Integer quan = Integer.parseInt(request.getParameter("quan"));

            Item obj = new Item(itemname, brandname, itemprice, quan);
            Long id = (Long)session.getAttribute("empno");
            
            Employee emp = efl.find(id);
            
            obj.setEmpno(emp);

            ifl.create(obj);

            request.setAttribute("msg", "Item added Succesfuly");
            request.getRequestDispatcher("marg_menu.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Item Was not Added (make sure all fields are filled)");
            request.getRequestDispatcher("add_items.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
