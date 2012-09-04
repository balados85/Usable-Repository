<%-- 
    Document   : update
    Created on : Jul 9, 2012, 9:19:43 AM
    Author     : Lisandro
--%>

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

        if ("Update Item".equals(request.getParameter("update"))) {
            String id1 = request.getParameter("id");
            int id = Integer.parseInt(id1);
            String code = request.getParameter("code");
            String items = request.getParameter("item");
            String q1 = request.getParameter("quantity");
            int quantity = Integer.parseInt(q1);
            //String unit = request.getParameter("unit");
            double price = Double.parseDouble(request.getParameter("price"));
            //String supplier=request.getParameter("supplier");
            Date date = formatter.parse(request.getParameter("date"));
            // Date expDate =formatter.parse(request.getParameter("expDate")) ;
            String q2 = request.getParameter("Equantity");
            int Equantity = Integer.parseInt(q2);
            String q3 = request.getParameter("Rquantity");
            int Rquantity = Integer.parseInt(q3);
            String drug = request.getParameter("drug");
            String type = request.getParameter("type");
            String locationId = request.getParameter("locationId");
            // int spid = 0;


            System.out.println(items + " " + quantity + " " + price + " " + date);
            System.out.println("ere");


            itemHelper its = new itemHelper();
            ItemsTable it = null;


            it = its.updateItem(code, items, quantity, price, date, Equantity, Rquantity, drug, type, locationId, id);

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