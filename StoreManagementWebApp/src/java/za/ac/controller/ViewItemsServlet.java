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
public class ViewItemsServlet extends HttpServlet {

    @EJB
    ItemFacadeLocal ifl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = request.getParameter("user");

        Integer numStock = 0;

        List<Item> stock = ifl.findAll();
        

        for (Item i : stock) {
            numStock += i.getQuantity();
        }

        if (numStock == 0) {
            session.setAttribute("stockIndicator", "WE ARE OUT OF STOCK!");
        }
        session.setAttribute("stock", stock);
        if ("customer".equals(user)) {
            String custName = request.getParameter("custName");
            session.setAttribute("custName", custName);

            response.sendRedirect("cus_view_items.jsp");
        } else {
            response.sendRedirect("mgr_view_items.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
