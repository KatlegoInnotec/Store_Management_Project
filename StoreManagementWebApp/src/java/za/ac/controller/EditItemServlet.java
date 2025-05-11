/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
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
public class EditItemServlet extends HttpServlet {

    @EJB
    ItemFacadeLocal ifl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Long id = Long.parseLong(request.getParameter("id"));

        Item item = ifl.find(id);

        if (item != null) {
            session.setAttribute("item", item);
            response.sendRedirect("edit_item.jsp");
        }
        else{
            response.sendRedirect("marg_menu.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (!request.getParameter("itemname").isEmpty() && !request.getParameter("brandname").isEmpty() && !request.getParameter("itemprice").isEmpty() && !request.getParameter("quan").isEmpty()) {

            String itemname = request.getParameter("itemname"),
                    brandname = request.getParameter("brandname");
            Double itemprice = Double.parseDouble(request.getParameter("itemprice"));
            Integer quan = Integer.parseInt(request.getParameter("quan"));

            Long id = (Long) session.getAttribute("empno");

            Item obj = (Item) session.getAttribute("item");

            obj.setItemName(itemname);
            obj.setItemBrand(brandname);
            obj.setItemPrice(itemprice);
            obj.setQuantity(quan);
            obj.setDate(new Date());
            
            ifl.edit(obj);
            
            List<Item> stock = ifl.findAll();
            session.setAttribute("stock", stock);

            request.setAttribute("msg", "Item Edited Succesfuly");
            request.getRequestDispatcher("mgr_view_items.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Item Was not Edited (make sure all fields are filled)");
            request.getRequestDispatcher("edit_item.jsp").forward(request, response);

        }

    }

}
