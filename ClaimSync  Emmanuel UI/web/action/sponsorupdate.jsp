<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
            Patient singleton = (Patient)session.getAttribute("patient");
            
            if ("update".equals(request.getParameter("action"))) {
                String benefitPlan = request.getParameter("benefitplan")==null ? "NA" : request.getParameter("benefitplan");
                String sponsorMembershipID = request.getParameter("membershipid")==null ? "NA" : request.getParameter("membershipid");
                Integer sponsorID = request.getParameter("sponsorid")==null ? 0 : Integer.parseInt(request.getParameter("sponsorid"));
                String sponsorType = request.getParameter("type")==null ? "NA" : request.getParameter("type");
                              
                HMSHelper mgr = new HMSHelper();
                Sponsorhipdetails sp;
                sp = (Sponsorhipdetails)mgr.updatePatientSponsorDetails(benefitPlan, sponsorType, sponsorMembershipID,singleton.getPatientid(),sponsorID);
             
            }
             
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
            HibernateUtil.getSessionFactory().close();
            response.sendRedirect("../visit.jsp");
        } catch (Exception ex) {
            HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
            if (ServletException.class.isInstance(ex)) {
                throw (ServletException) ex;
            } else {
                throw new ServletException(ex);
            }
        }%>

