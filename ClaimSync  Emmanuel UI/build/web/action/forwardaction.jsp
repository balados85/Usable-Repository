<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
            int type = -1;
            try {
                type = Integer.parseInt(request.getParameter("contype"));
            } catch (NumberFormatException e) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (patientid.equals("")) {
                response.sendRedirect("../index.jsp");
                return;
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();

            String l = mgr.stepOverVisit(patientid, dateFormat.format(date));
            
               /* visit.setPatientid(patientid);
                visit.setPatientstatus("Out Patient");
                visit.setVisittype(type);
                session.setAttribute("visit", visit);
                sess.save(visit);*/
            if(l.equalsIgnoreCase("Yes")){
               session.setAttribute("lasterror", "Patient is already logged");
                response.sendRedirect("../index.jsp");
                return; 
            }
            mgr.createNewVisit(patientid, "", "", "Out Patient", type);
                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(), unitName, patientid);

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
            String loc = request.getParameter("from");
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
                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(), unitName, patientid);
                mgr.updateVisitationStatus(visitid, unitName, mgr.getPatientFolder(patientid).getStatus());

                if (ptid != null) {
                    for (int r = 0; r < ptid.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(ptid[r]), "Yes");
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
            String loc = request.getParameter("from");

            int visitid = - 1;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }
            List list = mgr.listLabordersByVisitid(visitid);
            for (int j = 0; j < list.size(); j++) {
                Laborders laborders = (Laborders) list.get(j);
                mgr.updateLaborders(laborders.getOrderid(), "", new Date());
            }
            //  int pid =  - 1;
            try {
                if (!unitName.equals("")) {
                    System.out.println(visitid);
                    System.out.println(unitName);
                    mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(), unitName, patientid);
                    mgr.updateVisitationStatus(visitid, unitName, mgr.getPatientFolder(patientid).getStatus());


                    for (int r = 0; r < id.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientInvestigation(Integer.parseInt(id[r]), results[r], "Yes", 0.0);
                        // mgr.updateLaborders(1, "",new Date());
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../laboratory.jsp");
                return;
            } catch (NullPointerException e) {
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