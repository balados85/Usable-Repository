<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

            if ("consulting".equals(request.getParameter("action"))) {
                String unitName = request.getParameter("name");
                
                //String registrationDate = request.getParameter("dor");
               
                HMSHelper mgr = new HMSHelper();
                Consultingrooms conroom = null;
                conroom = mgr.addConRoom(unitName);
            }
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
            HibernateUtil.getSessionFactory().close();
            response.sendRedirect("../addconsultingroom.jsp");
        } catch (Exception ex) {
            HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
            if (ServletException.class.isInstance(ex)) {
                throw (ServletException) ex;
            } else {
                throw new ServletException(ex);
            }
        }%>

