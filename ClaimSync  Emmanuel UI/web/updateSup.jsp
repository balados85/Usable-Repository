<%-- 
    Document   : updateSup
    Created on : Jul 9, 2012, 11:44:55 AM
    Author     : Lisandro
--%>



<%@page import="entities.Post"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entities.ItemsTable"%>
<%@page import="entities.itemHelper"%>
<%@page import="entities.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        DateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-mm-dd");

        if ("Update Supplier".equals(request.getParameter("update"))) {
            Date date = formatter.parse(request.getParameter("date"));


            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String tellNumber = request.getParameter("tellnumber");
            String item = request.getParameter("item");
            String q1 = request.getParameter("quantity");
            int quantity = Integer.parseInt(q1);
            String id1 = request.getParameter("id");
            int id = Integer.parseInt(id1);







            System.out.println(item + " " + quantity + " " + address + " " + date);
            System.out.println("ere");


            itemHelper its = new itemHelper();
            Post it = null;


            it = its.updateSupplier(date, firstName, lastName, address, tellNumber, item, quantity, id);

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