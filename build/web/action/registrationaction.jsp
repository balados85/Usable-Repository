<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,helper.HibernateUtil"%>
<!DOCTYPE html>
<% try {
        // HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        if ("patient".equals(request.getParameter("action"))) {
            String patientID = request.getParameter("patientid");
            String lName = request.getParameter("lname");
            String fName = request.getParameter("fname");
            String midName = request.getParameter("midname") == "" ? "NA" : request.getParameter("midname");
            String gender = request.getParameter("gender") == "" ? "NA" : request.getParameter("gender");

            String year = request.getParameter("year") == "" ? "0000-" : request.getParameter("year");
            String month = request.getParameter("month") == "" ? "00" : request.getParameter("month");
            String day = request.getParameter("day") == "" ? "00" : request.getParameter("day");
            String address = request.getParameter("address") == "" ? "NA" : request.getParameter("address");
            String employer = request.getParameter("employer") == "" ? "NA" : request.getParameter("employer");
            String contact = request.getParameter("contact") == "" ? "NA" : request.getParameter("contact");
            String emergencyPerson = request.getParameter("emergencyperson") == "" ? "NA" : request.getParameter("emergencyperson");
            String emergencyContact = request.getParameter("emergencycontact") == "" ? "NA" : request.getParameter("emergencycontact");
            String email = request.getParameter("email") == "" ? "NA" : request.getParameter("email");
            int spid = 0;
            //String membershipID = request.getParameter("membershipid");
        String dob = year+"-"+month+"-"+day;
            String membershipID = request.getParameter("membershipid") == null ? "NA" : request.getParameter("membershipid");

            String benefitPlan = request.getParameter("benefitplan") == "" ? "NA" : request.getParameter("benefitplan");


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

            System.out.println("p p p p : " + p);

            if (p == null) {
                session.setAttribute("lasterror", "patient details could not be saved please try again");
                response.sendRedirect("../registration.jsp");
                return;
            }
           

            f = mgr.createFolder(p.getPatientid(), p.getLname().substring(0, 1) + "-0001", "OPD","Records");
            if (f == null) {
                session.setAttribute("lasterror", "patient folder could not be created delete patient's details and please try again");
                response.sendRedirect("../registration.jsp");
                return;
            }

            sd = mgr.createPatientSponsorshipDetails(p.getPatientid(), membershipID, sponsorType, benefitPlan, spid);
            if (f == null) {
                session.setAttribute("lasterror", "patient sponsorship details not be updated please update later");
                response.sendRedirect("../registration.jsp");
                return;
            }
            if (p != null ) {
                mgr.createNewVisit(p.getPatientid(), "", "", "OPD");
            }
            session.setAttribute("succ", "Patient's details saved successfully");
            session.setAttribute("patient", p);
            response.sendRedirect("../index.jsp");
            return;
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();

    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
           // throw (ServletException) ex;
            session.setAttribute("lasterror", "An error occurred please try again later");
             response.sendRedirect("../index.jsp");
        } else {
           // throw new ServletException(ex);
            session.setAttribute("lasterror", "An error occurred please try again later");
             response.sendRedirect("../index.jsp");
        }
    }%>