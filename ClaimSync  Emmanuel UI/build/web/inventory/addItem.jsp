<%-- 
    Document   : addItem
    Created on : Jul 3, 2012, 8:51:15 AM
    Author     : Lisandro
--%>

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
        formatter = new SimpleDateFormat("mm/dd/yyyy");

        if ("Add Item".equals(request.getParameter("action"))) {
            String code = request.getParameter("code");
            String items = request.getParameter("items");
            String q1 = request.getParameter("quantity");
             int quantity =Integer.parseInt(q1) ;
             String unit = request.getParameter("unit");
             double price =Double.parseDouble(request.getParameter("price")) ;
             String supplier=request.getParameter("supplier");
             Date date =formatter.parse(request.getParameter("date")) ;
             Date expDate =formatter.parse(request.getParameter("expDate")) ;
             String q2 = request.getParameter("eq");
             int Equantity =Integer.parseInt(q2);
             String q3 = request.getParameter("rq");
             int Rquantity =Integer.parseInt(q3);
              String drug= request.getParameter("drug");
               String type =request.getParameter("type");
               String locationId = request.getParameter("locationId");
            //int spid = 0;
           

System.out.println(items+" "+quantity+" "+price+" "+date+" "+expDate);
        System.out.println("ere");
           

           itemHelper its = new itemHelper();
            ItemsTable it = null;
            

            it = its.addItem(code, items, quantity, unit, price, supplier, date, expDate, Equantity, Rquantity, drug, type, locationId);
         
            session.setAttribute("item", it);
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("application.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>