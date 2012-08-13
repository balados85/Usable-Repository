<%-- 
    Document   : opd
    Created on : Mar 31, 2012, 2:14:04 PM
    Author     : afuaantwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Patients At OPD!</h1>
        <table>
            <tr>
            <th>Patient Number</th>
            <th>Patient Name</th>

        </tr>
        <%
            HMSHelper mgr = new HMSHelper();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            //Patient p = (Patient)session.getAttribute("patient");
	   //get current date time with Date()
	   Date date = new Date();
	   //System.out.println(dateFormat.format(date));
            List visits = mgr.listUnitVisitations("Con Room 1",dateFormat.format(date));
            for (int i = 0; i < visits.size(); i++) {
                Visitationtable visit = (Visitationtable) visits.get(i);
        %>
        <tr>
            <td>
                <a href="condetails.jsp?patientid=<%=visit.getPatientid()%>&id=<%=visit.getVisitid()%>"><%= visit.getPatientid()%> <a> 
            </td>
            <td>
               <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname() %> 
            </td>
        </tr>
        <% }

        %>

    </table>
</body>
</html>
