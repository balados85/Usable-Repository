<%-- 
    Document   : saveType
    Created on : Jul 17, 2012, 8:52:01 AM
    Author     : lisandro
--%>





<%@page import="entities.Itemtype"%>
<%@page import="entities.itemHelper"%>
<%@page import="entities.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
       

        if ("Add Item Type".equals(request.getParameter("addType"))) {
            String itemType = request.getParameter("itemType");
            
            String q = request.getParameter("id");
            int id = Integer.parseInt(q);
            
        

System.out.println(itemType+"" );
        System.out.println("ere");
           

           itemHelper its = new itemHelper();
            Itemtype it = null;
            

            it = its.addType(itemType);
         
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