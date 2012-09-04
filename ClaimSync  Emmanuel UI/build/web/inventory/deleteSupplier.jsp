<%-- 
    Document   : deleteSupplier
    Created on : Jul 9, 2012, 12:44:52 PM
    Author     : Lisandro
--%>


<%@page import="entities.Post"%>
<%@page import="entities.ItemsTable"%>
<%@page import="entities.itemHelper"%>
<%@page import="entities.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    try {

        //HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        String id1 = request.getParameter("id");
        int id = Integer.parseInt(id1);
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        itemHelper itm = new itemHelper();

        Post itmss = itm.deleteSupplier(id);



        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("listSuppliers.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    }








%>