<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("wards".equals(request.getParameter("action"))) {
            String wardName = null;
            int numberOfBeds  = -1;
            
            try {
                 wardName = request.getParameter("name");
                 numberOfBeds = Integer.parseInt(request.getParameter("number"));
            } catch (NumberFormatException e) {
                response.sendRedirect("../addward.jsp");
                return;
                
            }
            catch(NullPointerException e){
                response.sendRedirect("../addward.jsp");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Ward ward = null;
            ward = mgr.addWard(wardName, numberOfBeds);
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../addward.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>

