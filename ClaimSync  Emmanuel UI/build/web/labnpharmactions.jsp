<%-- 
    Document   : labnpharmactions
    Created on : Jun 21, 2012, 8:23:35 PM
    Author     : Arnold Isaac McSey
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        Date dt = new Date();
        DateFormat ft;
        ft = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("" + dt);

        if ("Forward".equals(request.getParameter("action"))) {
            String patientid = request.getParameter("patientid") == null ? "" : request.getParameter("patientid");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            HMSHelper mgr = new HMSHelper();
            if (!patientid.equalsIgnoreCase("") || id != 0) {
                String diagnosis = request.getParameter("diagnosis") == null ? "" : request.getParameter("diagnosis");
                String treatment = request.getParameter("treatment") == null ? "" : request.getParameter("treatment");
                String investigation = request.getParameter("investigation") == null ? "" : request.getParameter("investigation");
                String vitals = request.getParameter("vitals") == null ? "" : request.getParameter("vitals");
                String unitName = request.getParameter("unitid") == null ? "" : request.getParameter("unitid");
                String prescriptionnote = request.getParameter("precription_notes") == null ? "" : request.getParameter("precription_notes");
                String investigationnote = request.getParameter("investigation_note") == null ? "" : request.getParameter("investigation_note");

                // String[] code = treatments
                Date date = new Date();
                DateFormat formatter;
                formatter = new SimpleDateFormat("yyyy-MM-dd");
                // formatter.format(date); 
                if (treatment != null) {
                    String[] treatments = treatment.split("<>");
                    for (int i = 1; i < treatments.length; i++) {
                        String[] treatmentcode = treatments[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        mgr.addPatientTreatment(patientid, treatmentcode[1], treatmentcode[0], treatmentcode[4], 0.0, "", id, formatter.format(date), prescriptionnote, Integer.parseInt(treatmentcode[3]), treatmentcode[2]);
                       
                    }
                }
                if (investigation != null) {
                    String[] investigations = investigation.split("<>");
                    for (int i = 1; i < investigations.length; i++) {
                        String[] investigationcode = investigations[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        // mgr.addPatientTreatment(patientid, investigationcode[1], investigationcode[0], "", 0.0, "", id, formatter.format(date));
                        mgr.addPatientInvestigation(patientid, investigationcode[1], investigationcode[0], "", 0.0, id, formatter.format(date), "", investigationnote, 0);

                    }
                }
                if (diagnosis != null) {
                    String[] diagnoses = diagnosis.split("<>");
                    for (int i = 1; i < diagnoses.length; i++) {
                        String[] diagnosescode = diagnoses[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        // mgr.addPatientDiagnosis(patientid, diagnosescode[1], diagnosescode[0], "", 0.0, "", id, formatter.format(date));
                        mgr.addPatientDiagnosis(patientid, diagnosescode[1], diagnosescode[0], id, formatter.format(date));
                    }
                }
                mgr.updateVisitation(patientid, id, unitName, vitals);
                //String registrationDate = request.getParameter("dor");
                mgr.updateFolderLocation(unitName, patientid);
            }
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        // System.out.println("here" + id);
        response.sendRedirect("../consultingroom.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>