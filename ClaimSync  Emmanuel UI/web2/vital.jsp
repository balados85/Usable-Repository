<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                            <div class="search">
                                <form>
                                    <input type="text">
                                </form>   
                            </div>
                        </div>
                        <div class="grid-1">
                            <div class="title-grid">Consultation Rooms</div>
                            <div class="content-gird">


                                <form action="action/vitalaction.jsp" method="post">
                                    <div class="elem">
                                        <label>Consultation Information:</label>
                                        <div class="indent">
                                            <table><tr>
                                                    <td>
                                                         <label>Temperature: </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="temp" placeholder="0.0" value=""/>
                                                    </td>
                                                </tr><tr>
                                                    <td>
                                                         <label>Weight: </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="weight" placeholder="0.0" value=""/>
                                                    </td>
                                                </tr>
                                            <tr>
                                                    <td>
                                                         <label>Height: </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="height" placeholder="0.0" value=""/>
                                                    </td>
                                                </tr>
                                            <tr>
                                                    <td>
                                                          <label>Pulse: </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="pulse" placeholder="0" value=""/>
                                                    </td>
                                                </tr>
                                            <tr>
                                                    <td>
                                                        <label>Blood Pressure (BP): </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="bp" placeholder="0" value=""/>
                                                    </td>
                                                </tr>
                                            <tr>
                                                    <td>
                                                         <label>Other Symptons: </label>
                                                    </td>
                                                    <td>
                                                         <textarea class="medium"  id="message" name="message" rows="5" name="vitals"></textarea><br/>
                                                    </td>
                                                </tr>
                                             <tr>
                                                    <td>
                                                         <label>To Consultation Room: </label>
                                                    </td>
                                                    <td>
                                                         <select class="chzn-select medium-select select chzn-done" name="conroom">
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
                                                    </td>
                                                </tr></table>
                                          
                                           <br/>
                                            <input type="hidden" name="patientid" value="<%=request.getParameter("patientid")%>"/>
                                            <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                                            <input class="button-a gray" type="submit" name="action" value="Forward"/> 
                                        </div>
                                    </div>
                                </form>

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



</body>
</html>
