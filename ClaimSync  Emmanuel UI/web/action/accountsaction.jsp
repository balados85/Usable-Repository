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
            String tids[] = request.getParameterValues("pid[]") == null ? null : request.getParameterValues("pid[]");
            String vids[] = request.getParameterValues("vid[]") == null ? null : request.getParameterValues("vid[]");
            String checks[] = request.getParameterValues("checks[]") == null ? null : request.getParameterValues("checks[]");

            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String unitName = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String visit = request.getParameter("visitid");
            int visitid = - 1;
            //double amountpiad;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../accounts.jsp");
                return;
            }


            if (patientid != null) {
                // System.out.println(patientid);
                if (tids != null) {
                    for (int r = 0; r < tids.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(tids[r]),"paid");
                    }
                    mgr.updateFolderLocation("Accounts", "Pharmacy", patientid);
                    mgr.updateVisitationStatus(visitid, "Pharmacy", "Accounts");
                }
                if (vids != null) {
                    for (int r = 0; r < vids.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        //System.out.println("hello"+vids[r]);
                        double amountpaid = request.getParameter("nm_"+vids[r])==""?0:Double.parseDouble(request.getParameter("nm_"+vids[r]));
                        mgr.updatePatientInvestigation(Integer.parseInt(vids[r]),"","No",amountpaid);
                    }
                    if(checks != null){
                        for(int r = 0; r<checks.length;r++){
                            mgr.updatePatientInvestigationPayment(Integer.parseInt(checks[r]));
                        }
                    }
                    mgr.updateFolderLocation("Accounts", "Laboratory", patientid);
                    mgr.updateVisitationStatus(visitid, "Laboratory", "Accounts");
                }

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