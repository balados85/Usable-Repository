<%-- 
    Document   : addItem
    Created on : Jul 3, 2012, 8:51:15 AM
    Author     : Lisandro
--%>






<%@page import="entities.ItemsTable"%>
<%@page import="entities.*"%>
<%@page import="helper.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    try {

        //HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        String id1 = request.getParameter("id");
        int id = Integer.parseInt(id1);
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        HMSHelper itm = new HMSHelper();

        ItemsTable itmss = itm.deleteItem(id);





        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("application.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    }








%>