<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
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

                            <div class="search">
                                <form>
                                    <input type="text">
                                </form>   
                            </div>
                        </div>
                        <div class="grid-1">
                            <div class="title-grid">Patient List </div>
                            <div class="content-gird">
                                <table class="display" id="example">
                                    <thead>
                                        <tr>
                                            <th>Patient Number</th>
                                            <th>Patient Name</th>

                                        </tr>
                                    </thead>
                                    <%
                                        HMSHelper mgr = new HMSHelper();
                                        List patients = mgr.listPatients();
                                        for (int i = 0; i < patients.size(); i++) {
                                            Patient patient = (Patient) patients.get(i);
                                    %>
                                    <tbody>

                                        <tr class="item">
                                            <td>
                                                <a href="action/forwardaction.jsp?patientid=<%=patient.getPatientid()%>"> <%= patient.getPatientid()%> <a> 
                                                        </td>
                                                        <td>
                                                            <%= mgr.getPatientByID(patient.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(patient.getPatientid()).getLname()%> 
                                                        </td>
                                                        </tr>
                                                        <% }

                                                        %>
                                                        </tbody>
                                                        </table>


                                                        <div class="clear"> </div>
                                                        </div>
                                                        </div> 


                                                        <!-- Information data -->
                                                        <div class="information-data">
                                                            <div class="date">
                                                                <p class="date-figures">935</p>
                                                                <div class="headway-2"><div class="advance-2" style="width:80%;"></div></div>
                                                                <p class="date-title">Visits Per Week</p>
                                                            </div>
                                                            <div class="date">
                                                                <p class="date-figures">35%</p>
                                                                <div class="headway-2"><div class="advance-2" style="width:35%;"></div></div>
                                                                <p class="date-title">Today's Visits</p>
                                                            </div>
                                                            <div class="date">
                                                                <p class="date-figures">165</p>
                                                                <div class="headway-2"><div class="advance-2" style="width:60%;"></div></div>
                                                                <p class="date-title">Patients Per Week</p>
                                                            </div>
                                                            <div class="date">
                                                                <p class="date-figures">95%</p>
                                                                <div class="headway-2"><div class="advance-2" style="width:95%;"></div></div>
                                                                <p class="date-title">Patients Per Day</p>
                                                            </div>
                                                            <div class="date">
                                                                <p class="date-figures">1245</p>
                                                                <div class="headway-2"><div class="advance-2" style="width:92%;"></div></div>
                                                                <p class="date-title">Number of Staff</p>
                                                            </div>

                                                        </div>
                                                        <!-- Information data end -->
                                                        <!--  <div class="grid-2">
                                                              <div class="title-grid">Calendar</div>
                                                              <div class="content-gird">
                                                                  <div id="calendar"></div>
                                                              </div>
                                                          </div>  -->





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

