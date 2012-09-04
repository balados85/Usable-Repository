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

        if ("Forward".equals(request.getParameter("action"))) {
            String patientid = request.getParameter("patientid") == null ? "" : request.getParameter("patientid");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            System.out.println(id);
            HMSHelper mgr = new HMSHelper();
            if (!patientid.equalsIgnoreCase("") || id != 0) {
                String diagnosis[] = request.getParameterValues("diaglist") == null ? null : request.getParameterValues("diaglist");
                String treatment[] = request.getParameterValues("data") == null ? null : request.getParameterValues("data");
                String labtest[] = request.getParameterValues("labtest") == null ? null : request.getParameterValues("labtest");
                String qnas[] = request.getParameterValues("anss[]") == null ? null : request.getParameterValues("anss[]");
                // String newans[] = request.getParameterValues("newanswers[]") == null ? null : request.getParameterValues("newanswers[]");
                String vitals = request.getParameter("vitals") == null ? "" : request.getParameter("vitals[]");
                String unitName = request.getParameter("unitid") == null ? "" : request.getParameter("unitid");
                String prescriptionnote = request.getParameter("prescription_notes") == null ? "" : request.getParameter("prescription_notes");
                String investigationnote = request.getParameter("investigation_note") == null ? "" : request.getParameter("investigation_note");
                String admit = request.getParameter("admission") == null ? "Out Patient" : request.getParameter("admission");
                // String[] code = treatments
                Date date = new Date();
                DateFormat formatter;
                formatter = new SimpleDateFormat("yyyy-MM-dd");
                int qty = 0;
                // formatter.format(date); 
                if (treatment != null) {
                    // String[] treatments = treatment.split("<>");
                    for (int i = 0; i < treatment.length; i++) {
                        String[] treatmentcode = treatment[i].split("><");

                        try {
                            qty = Integer.parseInt(treatmentcode[3]);
                        } catch (NumberFormatException e) {
                            qty = 0;
                        }
                        //call get treatmentbyCode to retrieve item price
                        mgr.addPatientTreatment(patientid, "CODE", Integer.parseInt(treatmentcode[1]), treatmentcode[4], mgr.getTreatment(Integer.parseInt(treatmentcode[1])).getPrice(), "No", id, formatter.format(date), prescriptionnote, qty, treatmentcode[2]);
                        if (admit.equalsIgnoreCase("In Patient")) {

                            mgr.addDosageMonitor(id, Integer.parseInt(treatmentcode[1]), "", "", "", null);
                        }
                    }
                }
                if (labtest != null) {
                    // String[] investigations = investigation.split("<>");
                    for (int i = 0; i < labtest.length; i++) {
                        String[] investigationcode = labtest[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        // mgr.addPatientTreatment(patientid, investigationcode[1], investigationcode[0], "", 0.0, "", id, formatter.format(date));
                        mgr.addPatientInvestigation(patientid, "CODE", Integer.parseInt(investigationcode[1]), "", mgr.getInvestigation(Integer.parseInt(investigationcode[1])).getPrice(), id, formatter.format(date), "No", investigationnote, 0);
                        mgr.addLaborders("", id);

                    }
                }
                if (qnas != null) {
                    // String[] investigations = investigation.split("<>");
                    for (int i = 0; i < qnas.length; i++) {
                        String[] quans = qnas[i].split("-");
                        mgr.addPatientClerking(id, Integer.parseInt(quans[0]), Integer.parseInt(quans[1]));
                        mgr.updateClerkingFrequency(Integer.parseInt(quans[0]));
                        String newanss = request.getParameter("newanswers_" + quans[0] + "")==""?"":request.getParameter("newanswers_" + quans[0] + "");
                        if (newanss.equals("")) {
                            String[] anslist = newanss.split("\n");
                            for (int an = 0; an < anslist.length; an++) {
                                mgr.addClerkingAnswer(anslist[an], Integer.parseInt(quans[0]));
                            }
                        }

                    }
                }
                if (diagnosis != null) {
                    // String[] diagnoses = diagnosis.split("<>");
                    for (int i = 0; i < diagnosis.length; i++) {
                        String[] diagnosescode = diagnosis[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        // mgr.addPatientDiagnosis(patientid, diagnosescode[1], diagnosescode[0], "", 0.0, "", id, formatter.format(date));
                        mgr.addPatientDiagnosis(patientid, Integer.parseInt(diagnosescode[1]), "CODE", id, formatter.format(date));
                    }
                }
                if (admit.equalsIgnoreCase("In Patient")) {
                    mgr.admitPatience(id, admit, new Date());
                    //mgr.addDosageMonitor(id, patienttreatmentid, "", "", "", null);
                }
                mgr.updateVisitation(patientid, id, unitName, vitals, mgr.getPatientFolder(patientid).getStatus());
                //String registrationDate = request.getParameter("dor");

                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(), unitName, patientid);

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