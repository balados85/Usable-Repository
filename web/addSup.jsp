<%-- 
    Document   : addSup
    Created on : Jul 5, 2012, 5:56:46 PM
    Author     : Lisandro
--%>



<%@page import="entities.Post"%>
<%@page import="entities.ItemsTable"%>
<%@page import="entities.itemHelper"%>
<%@page import="entities.HibernateUtil"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>c



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        DateFormat formatter ;
        formatter = new SimpleDateFormat("yyyy-mm-dd");

        if ("Add Supplier".equals(request.getParameter("action"))) {
              Date date =formatter.parse(request.getParameter("date")) ;
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
             String address =request.getParameter("address");
             String tellNumber = request.getParameter("tellNumber");
             String item = request.getParameter("item");
             String q1= request.getParameter("quantity");
             int quantity = Integer.parseInt(q1);
            
            int spid = 0;
           

//System.out.println(items+" "+quantity+" "+price+" "+date+" "+expDate);
      //  System.out.println("ere");
           

           itemHelper its = new itemHelper();
            Post it = null;
            

            it = its.addSupplier(date, firstName, lastName, address, tellNumber, item, quantity);
         
            session.setAttribute("item", it);
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("listSuppliers.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>