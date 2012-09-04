<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : afuaantwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,helper.HibernateUtil"%>
<!DOCTYPE html>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("patient".equals(request.getParameter("action"))) {
            String patientID = request.getParameter("patientid");
            String lName = request.getParameter("lname");
            String fName = request.getParameter("fname");
            String midName = request.getParameter("midname");
          
            String dob_d = request.getParameter("dob_d");
            String dob_m = request.getParameter("dob_m");
            String dob_y = request.getParameter("dob_y");
            String dob = dob_y+"-"+dob_m+"-"+dob_d;
            
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String emergencyContact = request.getParameter("emergencycontact");
            
             String email = request.getParameter("email");
       
            int spid = 0;
            //String membershipID = request.getParameter("membershipid");

            String membershipID = request.getParameter("membershipid") == null ? "NA" : request.getParameter("membershipid");

            String benefitPlan = request.getParameter("benefitplan") == null ? "NA" : request.getParameter("benefitplan");
            String gender = request.getParameter("gender") == null ? "NA" : request.getParameter("gender");
            String employer = request.getParameter("employer") == null ? "NA" : request.getParameter("employer");
            String emergencyPerson = request.getParameter("emergencyperson") == null ? "NA" : request.getParameter("emergencyperson");

            String sponsorType = request.getParameter("type");
            //String benefitPlan = request.getParameter("benefitplan");
            String sponsorid = request.getParameter("sponsorid");
            if (sponsorid != "") {
                spid = Integer.parseInt(sponsorid);
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Patient p = null;
            Folder f = null;
            Sponsorhipdetails sd = null;


            p = mgr.createPatient(patientID, fName, lName, midName, gender, address, employer, dob, contact, emergencyPerson, emergencyContact, email);

            f = mgr.createFolder(p.getPatientid(), p.getLname().substring(0, 1) + "-0001", "Records");

            sd = mgr.createPatientSponsorshipDetails(p.getPatientid(), membershipID, sponsorType, benefitPlan, spid);

            //Visitationtable vs = new Visitationtable(p.getPatientid());
            //vs.setStatus("OPD");

            session.setAttribute("patient", p);
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        session.setAttribute("message", "Patient Registered Successfully!");
        response.sendRedirect("../home.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>