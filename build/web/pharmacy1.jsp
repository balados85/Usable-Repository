<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <%@include file="widgets/javascripts.jsp" %>
    </head>
    <body>
        <%@include file="widgets/header.jsp" %>
        <section id="middle">
            <div id="container-main">
                <div id="container">
                    <div id="content">
                        <div class="speedbar">
                            <div class="speedbar-nav"> <a href="#">Claimsync Panel</a> &rsaquo; <a href="#">Dashboard</a></div> 
                            <% if (session.getAttribute("lasterror") != null) {%>
                            <h3><%=session.getAttribute("lasterror")%></h3>
                            <% }%>
                            <div class="search">
                                <form>
                                    <input type="text">
                                </form>   
                            </div>
                        </div>
                        <div class="grid-1">

                            <h1>Welcome Pharmacy</h1>
                            <table class="display" id="example">
                                <thead>
                                    <tr>
                                        <th>Patient Number</th>
                                        <th>Patient Name</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        HMSHelper mgr = new HMSHelper();
                                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        //Patient p = (Patient)session.getAttribute("patient");
                                        //get current date time with Date()
                                        Date date = new Date();
                                        //System.out.println(dateFormat.format(date));
                                        List visits = mgr.listUnitVisitations("Pharmacy", dateFormat.format(date));
                                        for (int i = 0; i < visits.size(); i++) {
                                            Visitationtable visit = (Visitationtable) visits.get(i);
                                    %>
                                    <tr>
                                        <td>
                                            <a href="drugdetails.jsp?visitid=<%= visit.getVisitid()%>&pid=<%=visit.getPatientid()%>"> <%= visit.getPatientid()%><a> 
                                                    </td>
                                                   
                                                    <td style="display: none">
                                                      <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%>   
                                                    </td>
                                                    </tr>
                                                    <% }

                                                    %>
                                                    </tbody>
                                                    </table>
                                                    </div> 

                                                    <div class="clear"></div>

                                                    </div><!-- #content-->
                                                    </div><!-- #container--> 
                                                    <!-- #sideLeft -->
                                                    <%@include file="widgets/leftsidebar.jsp" %>
                                                    <!-- #sideLeft -->

                                                    </div>
                                                    <!-- #container main-->


                                                    <!-- #footer -->
                                                    <%@include file="widgets/footer.jsp" %>
                                                    <!-- #footer -->
                                                    </section><!-- #middle-->


                                                    <div class="clear"></div>



                                                    </body>
                                                    </html>



                                                    </body>
                                                    </html>
