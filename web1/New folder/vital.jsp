<%-- 
    Document   : vital
    Created on : Mar 31, 2012, 8:12:09 PM
    Author     : afuaantwi
--%>

<%@page import="entities.*,java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <label>Consultation Rooms</label>
        <form action="action/vitalaction.jsp" method="post">
            <textarea name="vitals"></textarea><br/>
            <select name="conroom">
                <%
                Patient p = null;
                
                    HMSHelper mgr = new HMSHelper();
                    p = mgr.getPatientByID(request.getParameter("patientid"));
                    session.setAttribute("current", p);
                    List consultingrooms = mgr.listConRooms();
                    for (int i = 0; i < consultingrooms.size(); i++) {
                        Consultingrooms consultingroom = (Consultingrooms) consultingrooms.get(i);
                %>
                <option value="<%=consultingroom.getConsultingroom()%>"><%=consultingroom.getConsultingroom()%></option> 
                <% }

                %>


            </select><br/>
            <input type="hidden" name="patientid" value="<%=request.getParameter("patientid")%>"/>
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                <input type="submit" name="action" value="vital"/>
        </form>
    </body>
</html>
