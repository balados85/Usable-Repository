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
        if (request.getParameter("patientid") != null) {
            Patient p = mgr.getPatientByID(request.getParameter("patientid"));
            session.setAttribute("patient", p);
            response.sendRedirect("../index.jsp");
            return;
        }

        if ("forward".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("unitid");

            Visitationtable visit = new Visitationtable();
            visit.setStatus(unitName);
            visit.setDate(new Date());
            Patient p = (Patient) session.getAttribute("patient");
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            if (patientid.equals("")) {
                response.sendRedirect("../index.jsp");
                return;
            }
            visit.setPatientid(patientid);
            visit.setPatientstatus("Out Patient");
            session.setAttribute("visit", visit);
            sess.save(visit);
           
            mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(),unitName, patientid);

            response.sendRedirect("../index.jsp");
            return;
        }
        if ("Forward to Accounts".equals(request.getParameter("action"))) {
            //System.out.println("here");
            String unitName = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String[] ptid = request.getParameterValues("dispensed[]") == null ? null : request.getParameterValues("dispensed[]");
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            //String unit = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String visit = request.getParameter("visitid");
            int visitid = - 1;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../pharmacy.jsp");
                return;
            }
            

            if (patientid != null && !unitName.equals("")) {
               // System.out.println(patientid);
                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(),unitName, patientid);
                mgr.updateVisitationStatus(visitid, unitName,mgr.getPatientFolder(patientid).getStatus());
               
                if (ptid != null) {
                    for (int r = 0; r < ptid.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(ptid[r]));
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../pharmacy.jsp");
                return;
            }
            session.setAttribute("lasterror", "Please try again");
            response.sendRedirect("../pharmacy.jsp");
            return;
            //String registrationDate = request.getParameter("dor");
        }

        if ("Forward".equals(request.getParameter("laboratory"))) {

            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String id[] = request.getParameterValues("ids[]") == null ? null : request.getParameterValues("ids[]");
            String unitName = request.getParameter("unitid") == null ? "Laboratory" : request.getParameter("unitid");
            String[] results = request.getParameterValues("results[]") == null ? null : request.getParameterValues("results[]");
            // String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String visit = request.getParameter("visitid");
           
            int visitid = - 1;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }
            //  int pid =  - 1;
            try {
               if(!unitName.equals("")) {
               System.out.println(visitid);
               System.out.println(unitName);
                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(),unitName, patientid);
                mgr.updateVisitationStatus(visitid, unitName, mgr.getPatientFolder(patientid).getStatus());
              
              
                    for (int r = 0; r < id.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientInvestigation(Integer.parseInt(id[r]),results[r]);
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../laboratory.jsp");
                return;
            }
            catch (NullPointerException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }  
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