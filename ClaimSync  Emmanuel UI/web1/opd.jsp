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
        <%@include file="widgets/stylesheets.jsp" %>

    </head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <%@include file="widgets/subhead.jsp" %>

            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div class="span9 offset3 thumbnail well content hide">

                        <ul style="margin-left: 0px;" class="breadcrumb span4">
                            <li>
                                Out Patient Department
                            </li>
                        </ul>

                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>
                                <tr>
                                    <th>Patient Number</th>
                                    <th>Patient Name</th>

                                </tr>
                            </thead>
                            <%
                                HMSHelper mgr = new HMSHelper();
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                //Patient p = (Patient)session.getAttribute("patient");
                                //get current date time with Date()
                                Date date = new Date();
                                //System.out.println(dateFormat.format(date));
                                List visits = mgr.listUnitVisitations("OPD", dateFormat.format(date));
                                for (int i = 0; i < visits.size(); i++) {
                                    Visitationtable visit = (Visitationtable) visits.get(i);
                            %>
                            <tr>
                                <td>
                                    <a href="vital.jsp?patientid=<%=visit.getPatientid()%>&id=<%=visit.getVisitid()%>"><%= visit.getPatientid()%> <a> 
                                            </td>
                                            <td>
                                                <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%> 
                                            </td>
                                            </tr>
                                            <% }

                                            %>

                                            </table>

                                            </div>

                                            </div>

                                            </section>

                                            <%@include file="widgets/footer.jsp" %>

                                            </div><!-- /container -->

                                            <%@include file="widgets/javascripts.jsp" %>


                                            <%@include file="widgets/loaded.jsp" %>

                                            </body>
                                            </html>
