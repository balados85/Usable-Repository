<%-- 
    Document   : deleteReceiver
    Created on : Jul 10, 2012, 9:42:49 AM
    Author     : Lisandro
--%>


<%@page import="entities.Receive"%>
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

        Receive itmss = itm.deleteReceivers(id);



        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("listRecipients.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    }








%>