<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("dosagemeter".equals(request.getParameter("value"))) {
            String id = request.getParameter("id") == null ? "" : request.getParameter("id");
            String morning = request.getParameter("morning") == null ? "" : request.getParameter("morning");
            String afternoon = request.getParameter("afternoon") == null ? "" : request.getParameter("afternoon");
            String evening = request.getParameter("evening") == null ? "" : request.getParameter("evening");
            int visitid = request.getParameter("visitid") == null ? 0 : Integer.parseInt(request.getParameter("visitid"));
            int ptmentid = request.getParameter("treamentid") == null ? 0 : Integer.parseInt(request.getParameter("treamentid"));
            HMSHelper mgr = new HMSHelper();

            out.print(id + "" + morning + "" + afternoon + "" + evening + "" + visitid + "" + ptmentid);
            int did = -1;

            try {
                did = Integer.parseInt(id);
                // wardName = request.getParameter("name");
                Dosagemonitor dmonitor = mgr.updateDosage(did, morning, afternoon, evening, ptmentid, visitid, new Date());

            } catch (NumberFormatException e) {
                // out.print(e.getMessage());
                out.print("Error, Please Again");
                return;

            } catch (NullPointerException e) {
                out.print("Error, Please Again");
                // out.print(e.getMessage());
                return;
            }

            out.print("Successfully Updated");
            return;
        }

        if ("treatments".equals(request.getParameter("value"))) {

            //String[] id = request.getParameterValues("select[]") == null ? new String[0] : request.getParameterValues("select[]");
            String prescription = request.getParameter("prescription") == null ? "" : request.getParameter("prescription");
            int visitid = request.getParameter("visitid") == null ? 0 : Integer.parseInt(request.getParameter("visitid"));
            String patientid = request.getParameter("patientid") == null ? "" : request.getParameter("patientid");
            String[] treatments = request.getParameterValues("select[]") == null ? null : request.getParameterValues("select[]");

            HMSHelper mgr = new HMSHelper();
            int qty = -1;
            Date date = new Date();
            DateFormat formatter;
            formatter = new SimpleDateFormat("yyyy-MM-dd");
            if (visitid == 0) {
                out.print("Error, Please Again");
                return;
            }
            //visitid  = -1;

            try {
                //visitid = Integer.parseInt(request.getParameter(id));
                // out.print(treatments.length);
                for (int i = 0; i < treatments.length; i++) {
                    String[] treatmentcode = treatments[i].split("><");

                    try {
                        qty = Integer.parseInt(treatmentcode[3]);
                    } catch (NumberFormatException e) {
                        qty = 0;
                    }
                    //call get treatmentbyCode to retrieve item price
                    mgr.addPatientTreatment(patientid, "CODE", Integer.parseInt(treatmentcode[1]), treatmentcode[4], mgr.getTreatment(Integer.parseInt(treatmentcode[1])).getPrice(), "", visitid, formatter.format(date), prescription, qty, treatmentcode[2]);


                    mgr.addDosageMonitor(visitid, Integer.parseInt(treatmentcode[1]), "", "", "", null);

                }
                out.print("Successfully Added");
                return;

            } catch (NumberFormatException e) {
                out.print("Error, Please Again");
                return;

            } catch (NullPointerException e) {
                out.print("Error, Please Again");
                return;
            }
            // out.print(id.length);

        }

        if ("investigations".equals(request.getParameter("value"))) {

            //String[] id = request.getParameterValues("select[]") == null ? new String[0] : request.getParameterValues("select[]");
            String investigationnotes = request.getParameter("investigation") == null ? "" : request.getParameter("investigation");
            int visitid = request.getParameter("visitid") == null ? 0 : Integer.parseInt(request.getParameter("visitid"));
            String patientid = request.getParameter("patientid") == null ? "" : request.getParameter("patientid");
            String[] investigations = request.getParameterValues("select[]") == null ? null : request.getParameterValues("select[]");

            HMSHelper mgr = new HMSHelper();
            int qty = -1;
            Date date = new Date();
            DateFormat formatter;
            formatter = new SimpleDateFormat("yyyy-MM-dd");
            if (visitid == 0) {
                out.print("Error, Please Again");
                return;
            }
            //visitid  = -1;

            try {
                //visitid = Integer.parseInt(request.getParameter(id));
                // out.print(treatments.length);
                for (int i = 0; i < investigations.length; i++) {
                    String[] investigationcode = investigations[i].split("><");
                    //call get treatmentbyCode to retrieve item price
                    // mgr.addPatientTreatment(patientid, investigationcode[1], investigationcode[0], "", 0.0, "", id, formatter.format(date));
                    mgr.addPatientInvestigation(patientid, "CODE", Integer.parseInt(investigationcode[1]), "", mgr.getInvestigation(Integer.parseInt(investigationcode[1])).getPrice(), visitid, formatter.format(date), "", investigationnotes, 0);

                }
                out.print("Successfully Added");
                return;

            } catch (NumberFormatException e) {
                out.print("Error, Please Again");
                return;

            } catch (NullPointerException e) {
                out.print("Error, Please Again");
                return;
            }
            // out.print(id.length);

        }

        if ("addnotes".equals(request.getParameter("value"))) {
            String id = request.getParameter("visitid") == null ? "" : request.getParameter("visitid");
            String notes = request.getParameter("notes") == null ? "" : request.getParameter("notes");
            String doctorsid = request.getParameter("doctorsid") == null ? "" : request.getParameter("doctorsid");

            HMSHelper mgr = new HMSHelper();

            out.print(id + "" + notes + "" + doctorsid);
            int did = -1;

            try {
                did = Integer.parseInt(id);
                // wardName = request.getParameter("name");
                Admissionnotes dmonitor = mgr.addAdmissionNoteint(did, doctorsid, notes);
                out.print("Successfully Added");
                return;

            } catch (NumberFormatException e) {
                out.print("id error");
                return;

            } catch (NullPointerException e) {
                out.print("empty");
                return;
            }


        }
        if ("forward".equals(request.getParameter("action"))) {
            HMSHelper mgr = new HMSHelper();
            String notes = request.getParameter("notes") == null ? "" : request.getParameter("notes");
            String location = request.getParameter("location") == null ? "" : request.getParameter("location");
            String id = request.getParameter("visitid") == null ? "" : request.getParameter("visitid");
            String patientstatus = request.getParameter("patientstatus") == null ? "" : request.getParameter("patientstatus");
            String patientid = request.getParameter("patientid") == null ? "" : request.getParameter("patientid");
            if ("Transfer".equalsIgnoreCase(patientstatus)) {
                Transferlocation transferlocation = mgr.addTransferLocation(Integer.parseInt(id), new Date(), location, "doctorid", 0, notes);
                mgr.dischargePatience(Integer.parseInt(id), patientstatus, new Date());
                mgr.updateVisitationStatus(Integer.parseInt(id), "Records", mgr.getPatientFolder(patientid).getStatus());
                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(), "Records", patientid);
                out.print("empty" + location);
            }
            if ("Discharge".equalsIgnoreCase(patientstatus) || "Dead".equalsIgnoreCase(patientstatus)) {
                Visitationtable visitationtable = mgr.dischargePatience(Integer.parseInt(id), patientstatus, new Date());
                mgr.updateVisitationStatus(Integer.parseInt(id), "Records", mgr.getPatientFolder(patientid).getStatus());
                mgr.updateFolderLocation(mgr.getPatientFolder(patientid).getStatus(), "Records", patientid);
                out.print("mm" + location);
            }
            out.print("out" + patientstatus);
            //response.sendRedirect("../ward.jsp");

        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../ward.jsp");
        // out.print(id+""+morning+""+afternoon+""+evening);
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>