
package com.learn.mycart.servlets;

import com.learn.mycart.entities.PStore;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class SaveServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try
            {
                int userId=Integer.parseInt(request.getParameter("Id"));
                String userEmail=request.getParameter("email");
                String userName=request.getParameter("name");
                String userAddress=request.getParameter("address");
                String userPhone=request.getParameter("phone");
                
                  if(userName.isEmpty()||userEmail.isEmpty()
                       ||userAddress.isEmpty())
               {
                   out.println("Please fill up all the boxes");
                   
                   return;
               }
                  
               PStore store=new PStore(userId,userName,userEmail,userAddress,userPhone);
             
               Session hibernateSession=FactoryProvider.getFactory().openSession();
               Transaction tx=hibernateSession.beginTransaction();
               
                 
                 hibernateSession.save(store);  
              
             
               
              tx.commit();
              hibernateSession.close();
            //  HttpSession httpSession=request.getSession();
             // httpSession.setAttribute("message","Your Order Successfully received");
              //response.sendRedirect("ProductSave.jsp");
              out.println("<h2 class='mt-5 text-center custom-bg'>Successfully Saved</h2>");
              return;
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
             
                  
               
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
