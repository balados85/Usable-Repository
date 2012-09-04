<%-- 
    Document   : redirect
    Created on : Jun 14, 2012, 8:52:50 AM
    Author     : Arnold Isaac McSey
--%>

<%
    String nextPage = request.getParameter("page");
    if(nextPage == "opd"){
        %>
      <%@include file="opd.jsp" %>
   <% }
     if(nextPage == "home"){
        %>
      <%@include file="index.jsp" %>
   <% }
     if(nextPage == "visit"){
        %>
      <%@include file="visit.jsp" %>
   <% }
     if(nextPage == "register"){
        %>
      <%@include file="registration.jsp" %>
   <% }
     if(nextPage == "vital"){
         session.setAttribute("pid", request.getParameter("patientid"));
         session.setAttribute("id", request.getParameter("id"));
        %>
        <%@include file="vital.jsp"%>
   <% }
     if(nextPage == "conroom"){
        %>
      <%@include file="consultingroom.jsp" %>
   <% }
     if(nextPage == "dashboard"){
        %>
      <%@include file="dashboard.jsp" %>
   <% }
     if(nextPage == "condetails"){
          session.setAttribute("pid", request.getParameter("patientid"));
         session.setAttribute("id", request.getParameter("id"));
        %>
      <%@include file="condetails.jsp" %>
 <% }%>
 
 

<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <%@include file="widgets/stylesheets.jsp" %>
        <%@include file="widgets/javascripts.jsp" %>
    </head>
    <body>
        <%@include file="widgets/header.jsp" %>
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
