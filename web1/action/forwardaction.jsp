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
            if(request.getParameter("patientid") != null){
                Patient p = mgr.getPatientByID(request.getParameter("patientid"));
                session.setAttribute("patient", p);
                response.sendRedirect("../visit.jsp");
            }

            if ("Forward".equals(request.getParameter("action"))) {
                String unitName = request.getParameter("unitid");
                Visitationtable visit = new Visitationtable();
                visit.setStatus(unitName);
                visit.setDate(new Date());
                Patient p = (Patient)session.getAttribute("patient");
                visit.setPatientid(p.getPatientid());
                session.setAttribute("visit", visit);
                sess.save(visit);
                
                //String registrationDate = request.getParameter("dor");
               
                /****Update folder locations***/
                
                mgr.updateFolderLocation(unitName, p.getPatientid());
                //Units unit = null;
                //unit = mgr.addUnit(unitName);
                //Folder folder = null;
                //folder = mgr.getPatientFolder(p.getPatientid());
                //folder.setStatus("OPD"); 
                response.sendRedirect("../opd.jsp");
            }

            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
            HibernateUtil.getSessionFactory().close();
          //  response.sendRedirect("../opd.jsp");
        } catch (Exception ex) {
            HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
            if (ServletException.class.isInstance(ex)) {
                throw (ServletException) ex;
            } else {
                throw new ServletException(ex);
            }
        }%>