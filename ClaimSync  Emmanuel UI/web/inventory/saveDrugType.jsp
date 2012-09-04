<%-- 
    Document   : saveDrugType
    Created on : Jul 17, 2012, 8:57:11 AM
    Author     : lisandro
--%>

<%@page import="entities.Drugtype"%>
<%@page import="entities.Itemtype"%>
<%@page import="entities.itemHelper"%>
<%@page import="entities.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
       

        if ("Add Drug Type".equals(request.getParameter("addDrugType"))) {
            String drugType = request.getParameter("drugType");
            
            String q = request.getParameter("id");
            int id = Integer.parseInt(q);
            
        

System.out.println(drugType+"" );
        System.out.println("ere");
           

           itemHelper its = new itemHelper();
            Drugtype it = null;
            

            it = its.addDrugType(drugType);
         
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