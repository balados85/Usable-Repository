<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil,org.hibernate.Session,java.util.Date" %>
<% try {
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        HMSHelper mgr = new HMSHelper();
        if ("Forward".equals(request.getParameter("action"))) {
            String vital = request.getParameter("vitals") == null ? "":request.getParameter("vitals");
            String temperature = request.getParameter("temp") == null ? "0.0":request.getParameter("temp");
            String weight = request.getParameter("weight") == null ? "0.0":request.getParameter("weight");
            String height = request.getParameter("height") == null ? "0.0":request.getParameter("height");
            String systolic = request.getParameter("systolic") == null ? "0.0":request.getParameter("systolic");
            String diatolic = request.getParameter("diatolic") == null ? "0.0":request.getParameter("diatolic");
            String pulse = request.getParameter("pulse") == null ? "":request.getParameter("pulse");
            String forward = request.getParameter("conroom") == null ? "Room 1":request.getParameter("conroom");
            String bptype = request.getParameter("bptype");
            
            String patientid = request.getParameter("patientid") == null ? "":request.getParameter("patientid");
            String id = request.getParameter("id") == null ? "":request.getParameter("id");
            System.out.println("content "+id);
            String content  = ""+temperature+"-"+weight+"-"+height+"-"+systolic+":"+diatolic+"-"+pulse+"-"+vital+"";
            if(patientid.equalsIgnoreCase("") || id.equalsIgnoreCase("")){
                session.setAttribute("lasterror", "Vital could not be saved please try again");
                response.sendRedirect("../vital.jsp");
                return;
            }
            
            mgr.updateVisitation(patientid, Integer.parseInt(id), forward,content,mgr.getPatientFolder(patientid).getStatus());
            
            mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(),forward, patientid);
            
            session.setAttribute("lasterror", "Vital Successfully");
            response.sendRedirect("../opd.jsp");
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>