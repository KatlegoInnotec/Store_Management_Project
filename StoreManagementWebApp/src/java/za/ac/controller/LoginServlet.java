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
import za.ac.model.bl.EmployeeFacadeLocal;
import za.ac.model.entities.Employee;

/**
 *
 * @author innoc
 */
public class LoginServlet extends HttpServlet {

    @EJB
    EmployeeFacadeLocal efl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String empname = request.getParameter("empname");
        String password = request.getParameter("password");
        Boolean isValid = false;
        Long id = 0L;
        
        List<Employee> employees = efl.findAll();
        
        for(Employee emp : employees){
        
            if(emp.getEmpname().equals(empname) && emp.getPassword().equals(password)){
                isValid = true;
                id = emp.getEmpno();
                break;
            }
        }
        
        if(isValid){
            session.setAttribute("empno", id);
            request.getRequestDispatcher("marg_menu.jsp").forward(request, response);
            
        }else{
            request.setAttribute("err_msg", "Invalid Employee Name or Pasword");
            request.getRequestDispatcher("mgr_login.jsp").forward(request, response);
        }
        
    }

}
