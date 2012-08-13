<%-- 
    Document   : registration
    Created on : Mar 30, 2012, 12:06:40 PM
    Author     : afuaantwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="action/registrationaction.jsp" method="POST">
            <label>Patient ID Number  : </label><input type="text" name="patientid" value=""/><br />
            <label>Patient First Name: </label><input type="text" name="fname" value=""/><br/>
            <label>Patient Last Name : </label><input type="text" name="lname" value=""/><br/>
            <label>Patient Mid Name  : </label><input type="text" name="midname" value=""/><br />
            <label>Date of Birth(YYYY-MM-DD): </label><input type="text" name="dob" value=""/><br/>
            <label>Patient Address : </label><input type="text" name="address" value=""/><br/>
            <label>Patient Contact : </label><input type="text" name="contact" value=""/><br />
            <label>Patient Emergency: </label><input type="text" name="emergency" value=""/><br/>
            <label>Patient Email : </label><input type="text" name="email" value=""/><br/>

            <label>Sponsorship Type</label>
            <select name="type">
                <option value="nhis">NHIS</option>
                <option value="cash">CASH</option>
                <option value="private">Private Health Insurance</option>
                <option value="cooperate">Cooperate</option>
            </select><br/>
            <label>Sponsors</label>
            <select name="sponsorid">
                <%
                    HMSHelper mgr = new HMSHelper();
                    List Sponsors = mgr.listSponsors();
                    for (int i = 0; i < Sponsors.size(); i++) {
                        Sponsorship sponsor = (Sponsorship) Sponsors.get(i);
                %>
                <option value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option> 
                <% }

                %>


            </select><br/>
            <label>Benefit Plan : </label><input type="text" name="benefitplan" value=""/><br/>
            <label>Membership ID Number : </label><input type="text" name="membershipid" value=""/><br/>
            <label>Benefit Plan : </label><input type="text" name="benefitplan" value=""/><br/>
            <input type="submit" name="action" value="patient"/>
        </form>
    </body>
</html>
