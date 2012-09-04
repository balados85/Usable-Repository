<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

            if ("sponsor".equals(request.getParameter("action"))) {
                String sponsorName = request.getParameter("sponsorname");
                String sponsorType = request.getParameter("type");
                String sponsorAddress = request.getParameter("address");
                String sponsorContact = request.getParameter("contact");
                
                String sponsorEmail = request.getParameter("email");
                //String registrationDate = request.getParameter("dor");
               
                HMSHelper mgr = new HMSHelper();
                Sponsorship sp = null;
                sp = mgr.createSponsor(sponsorName, sponsorType, sponsorAddress, sponsorContact, sponsorEmail);
            }

            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
            HibernateUtil.getSessionFactory().close();
            response.sendRedirect("../addsponsor.jsp");
        } catch (Exception ex) {
            HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
            if (ServletException.class.isInstance(ex)) {
                throw (ServletException) ex;
            } else {
                throw new ServletException(ex);
            }
        }%>

