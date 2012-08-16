<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
            HMSHelper mgr = new HMSHelper();

            if ("Generate Receipt".equals(request.getParameter("action"))) {
              
           
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String unitName = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String visit = request.getParameter("visitid");
            int visitid = - 1;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../accounts.jsp");
                return;
            }
            

                if (patientid != null ) {
               // System.out.println(patientid);
               mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(),"Pharmacy", patientid);
                mgr.updateVisitationStatus(visitid, "Pharmacy",mgr.getPatientFolder(patientid).getStatus());
               
                
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../accounts.jsp");
                return;
            }
            session.setAttribute("lasterror", "Please try again");
            response.sendRedirect("../accounts.jsp");
            return;
            }
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
            HibernateUtil.getSessionFactory().close();
            response.sendRedirect("../index.jsp");
        } catch (Exception ex) {
            HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
            if (ServletException.class.isInstance(ex)) {
                throw (ServletException) ex;
            } else {
                throw new ServletException(ex);
            }
        }%>