<%-- 
    Document   : vital
    Created on : Mar 31, 2012, 8:12:09 PM
    Author     : afuaantwi
--%>

<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%  HMSHelper mgr = new HMSHelper();
            Patient p = null;
            p = mgr.getPatientByID(request.getParameter("patientid"));  
            Visitationtable vs = null;
            
           
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           
	    Date date = new Date();
           
            vs = mgr.currentVisitations(Integer.parseInt(request.getParameter("id")));
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <label>Consultation Rooms</label>
        <h5>Diagnosis will come here</h5>
        <form action="action/vitalaction.jsp" method="post">

            <textarea name="vitals"><%= vs.getVitals() %></textarea><br/>
            <select name="unitid">
                <%
                    List units = mgr.listUnits();
                    for (int i = 0; i < units.size(); i++) {
                        Units unit = (Units) units.get(i);
                %>
                <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                <% }

                %>


            </select><br/>
            <input type="hidden" name="patientid" value="<%=request.getParameter("patientid")%>"/>
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
            <input type="submit" name="action" value="vital"/>
        </form>
    </body>
</html>
