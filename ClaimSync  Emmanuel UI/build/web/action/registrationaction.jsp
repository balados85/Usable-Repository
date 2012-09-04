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

            String lName = request.getParameter("lname") == "" ? "" : request.getParameter("lname");
            String fName = request.getParameter("fname") == "" ? "" : request.getParameter("fname");
            String midName = request.getParameter("midname") == "" ? "" : request.getParameter("midname");
            String gender = request.getParameter("gender") == "" ? "N/A" : request.getParameter("gender");
            String country = request.getParameter("country") == "" ? "N/A" : request.getParameter("country");
            String city = request.getParameter("city") == "" ? "N/A" : request.getParameter("city");
            String maritalstatus = request.getParameter("maritalstatus") == "" ? "N/A" : request.getParameter("maritalstatus");

            String year = request.getParameter("year") == "" ? "0000-" : request.getParameter("year");
            String month = request.getParameter("month") == "" ? "00-" : request.getParameter("month");
            String day = request.getParameter("day") == "" ? "00" : request.getParameter("day");
            String address = request.getParameter("address") == "" ? "N/A" : request.getParameter("address");
            String employer = request.getParameter("employer") == "" ? "N/A" : request.getParameter("employer");
            String contact = request.getParameter("contact") == "" ? "N/A" : request.getParameter("contact");
            String emergencyPerson = request.getParameter("emergencyperson") == "" ? "N/A" : request.getParameter("emergencyperson");
            String emergencyContact = request.getParameter("emergencycontact") == "" ? "N/A" : request.getParameter("emergencycontact");
            String email = request.getParameter("email") == "" ? "NA" : request.getParameter("email");
            String nhismembershipid = request.getParameter("nhismembershipid") == "" ? "N/A" : request.getParameter("nhismembershipid");
            String coperateid = request.getParameter("coperateid") == "" ? "N/A" : request.getParameter("coperateid");
            String coperate = request.getParameter("coperate") == "" ? "N/A" : request.getParameter("coperate");
            int spid = 0;
            //String membershipID = request.getParameter("membershipid");
            String dob = year + "-" + month + "-" + day;
            String membershipID = request.getParameter("membershipid") == null ? "N/A" : request.getParameter("membershipid");

            String benefitPlan = request.getParameter("benefitplan") == "" ? "N/A" : request.getParameter("benefitplan");
            int contype = request.getParameter("contype") == "" ? 0 : Integer.parseInt(request.getParameter("contype"));


            String sponsorType = request.getParameter("type");
            //String benefitPlan = request.getParameter("benefitplan");
            String sponsorid = request.getParameter("sponsorid");
            System.out.println(contact.length());
            if(lName.equalsIgnoreCase("")||fName.equalsIgnoreCase("")){
               session.setAttribute("lasterror", "Name fields cannot be empty");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(city.equalsIgnoreCase("")){
                 session.setAttribute("lasterror", "City field cannot be empty");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(year.equalsIgnoreCase("D")||month.equalsIgnoreCase("M")||day.equalsIgnoreCase("Y")){
                 session.setAttribute("lasterror", "Date fields cannot be empty");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(!contact.equals("N/A") && contact.length() > 10){ 
                session.setAttribute("lasterror", "Telephone number length cannot be more than 10 digits");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(!contact.equals("N/A") && contact.length() < 10){
                session.setAttribute("lasterror", "Telephone number length cannot be less then 10 digits");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(!emergencyContact.equals("N/A") && emergencyContact.length() > 10){ 
                 session.setAttribute("lasterror", "Emergency telephone number length cannot be more than 10 digits");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(!emergencyContact.equals("N/A") && emergencyContact.length() < 10){
               session.setAttribute("lasterror", "Emergency telephone number length cannot be less than 10 digits");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(address.equalsIgnoreCase("")){
                 session.setAttribute("lasterror", "Address field cannot be empty, please enter patient house number instead");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(sponsorType.trim().equals("NHIS") && nhismembershipid.equalsIgnoreCase("")){
               session.setAttribute("lasterror", "NHIS membership number field cannot be empty");
                response.sendRedirect("../index.jsp");
                return; 
            }
            if(sponsorType.trim().equals("Cooperate") && coperateid.equalsIgnoreCase("N/A")){
                session.setAttribute("lasterror", "Coperate membership number field cannot be empty");
                response.sendRedirect("../index.jsp");
                return;  
            }
            if(contype == 0){
               session.setAttribute("lasterror", "Please select a consultation type");
                response.sendRedirect("../index.jsp");
                return; 
            }
            
            if(sponsorType.trim().equals("Private") && membershipID.equalsIgnoreCase("")){
                 session.setAttribute("lasterror", "Private membership number field cannot be empty");
                response.sendRedirect("../index.jsp");
                return; 
            }
            
            if (sponsorid != "") {
                spid = Integer.parseInt(sponsorid);
            }
            if (!coperate.equalsIgnoreCase("Select")) {
                spid = Integer.parseInt(coperate);
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Patient p = null;
            Folder f = null;
            Sponsorhipdetails sd = null;
            String name = fName+" "+lName+" "+midName;
            p = mgr.createPatient(patientID, name, "\"\"", "\"\"", gender, address, employer, dob, contact, emergencyPerson, emergencyContact, email, country, city, maritalstatus, "");

            System.out.println("p p p p : " + p);

            if (p == null) {
                session.setAttribute("lasterror", "patient details could not be saved please try again");
                response.sendRedirect("../index.jsp");
                return;
            }


            f = mgr.createFolder(p.getPatientid(), p.getLname().substring(0, 1) + "-0001", "OPD", "Records");
            if (f == null) {
                session.setAttribute("lasterror", "patient folder could not be created delete patient's details and please try again");
                response.sendRedirect("../index.jsp");
                return;
            }
            System.out.println(sponsorType);
            System.out.println(coperateid);
            System.out.println(spid);
            if (sponsorType.trim().equals("NHIS")) {
                sd = mgr.createPatientSponsorshipDetails(p.getPatientid(), nhismembershipid, sponsorType, "N/A", 0);
            }
            if (sponsorType.trim().equals("Private")) {
                sd = mgr.createPatientSponsorshipDetails(p.getPatientid(), membershipID, sponsorType, benefitPlan, spid);
            }
            if (sponsorType.trim().equals("Cooperate")) {
                sd = mgr.createPatientSponsorshipDetails(p.getPatientid(), coperateid, sponsorType, "N/A", spid);
            }
            if (sponsorType.trim().equals("CASH")) {
                sd = mgr.createPatientSponsorshipDetails(p.getPatientid(), "N/A", sponsorType, "N/A", 0);
            }
            if (sd == null) {
                session.setAttribute("lasterror", "patient sponsorship details could not be updated please update later");
                response.sendRedirect("../registration.jsp");
                return;
            }
            if (p != null) {
                mgr.createNewVisit(p.getPatientid(), "", "", "OPD", contype);
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