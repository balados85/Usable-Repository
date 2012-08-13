<%-- 
    Document   : indexjsp
    Created on : Apr 2, 2012, 4:38:58 PM
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
        <h1>List of Patients!</h1><h1><a href=""</h1>
        <table>
            <tr>
            <th>Patient Number</th>
            <th>Patient Name</th>

        </tr>
        <%
            HMSHelper mgr = new HMSHelper();
           
            List patients = mgr.listPatients();
            for (int i = 0; i < patients.size(); i++) {
                Patient patient = (Patient) patients.get(i);
        %>
        <tr>
            <td>
                <a href="action/forwardaction.jsp?patientid=<%=patient.getPatientid()%>"><%= patient.getPatientid()%> <a> 
            </td>
            <td>
               <%= mgr.getPatientByID(patient.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(patient.getPatientid()).getLname() %> 
            </td>
        </tr>
        <% }

        %>

    </table>
    </body>
</html>
