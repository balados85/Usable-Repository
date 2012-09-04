<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("units".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("name");
           

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Units unit = null;
            unit = mgr.addUnit(unitName);
            out.print("Unit Successfully Added");
            return;
        }
        if ("delete".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("id");

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
           
            mgr.deleteUnit(Integer.parseInt(unitName));
            out.print("Unit Successfully Removed");
            return;
        }
        if ("edit".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("uname");
             String id = request.getParameter("uid");

             if(unitName.equalsIgnoreCase("")){
                 out.print("Unit Name is empty");
                 return;
             }
            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Units unit = null;
            unit = mgr.updateUnit(Integer.parseInt(id),unitName);
            out.print("Unit Successfully Updated");
            return;
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        out.print("There was a problem please try again");
        return;
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>