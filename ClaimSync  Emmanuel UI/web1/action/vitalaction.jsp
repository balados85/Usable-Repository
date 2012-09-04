<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : afuaantwi
--%>
<%@page import="entities.*,helper.HibernateUtil,org.hibernate.Session,java.util.Date" %>
<% try {
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        HMSHelper mgr = new HMSHelper();
        if ("vital".equals(request.getParameter("action"))) {
            String vital = request.getParameter("vitals");
            String patientid = request.getParameter("patientid");
            String forward = request.getParameter("conroom");
            String id = request.getParameter("id");
            
            mgr.updateVisitation(patientid, Integer.parseInt(id), forward,vital);
            
            mgr.updateFolderLocation(forward, patientid);

        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../consultingroom.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>