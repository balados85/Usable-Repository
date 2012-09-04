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

                                <form action="action/forwardaction.jsp" method="post">
                                    <div class="elem">
                                        <label>Consultation Information:</label>
                                        <div class="indent">
                                            <table>
                                                <tr>
                                                    <td>
                                                         <label>CODE</label>
                                                    </td>
                                                    <td>
                                                       <label>DRUG</label>
                                                    </td>
                                                     <td>
                                                       <label>DOSAGE</label>
                                                    </td>
                                                     <td>
                                                       <label>PRICE</label>
                                                    </td>
                                                     <td>
                                                       <label>DISPENSED</label>
                                                    </td>
                                                </tr>
                                                <% 
                                                 HMSHelper mgr = new HMSHelper();
                                                 String visitid = request.getParameter("visitid");
                                                 int vid = -1;
                                                 try{
                                                     vid = Integer.parseInt(visitid);
                                                 }
                                                 catch(Exception e){
                                                     session.setAttribute("lasterror", "user does not exist");
                                                     response.sendRedirect("pharmacy.jsp");
                                                     return;
                                                 }
                                               
                                                 List patienttreatments = mgr.patientTreatment(vid);
                                                 
                                                for(int i=0; i<patienttreatments.size(); i++){
                                                Patienttreatment  patienttreatment =  (Patienttreatment)patienttreatments.get(i);
    %>
                                                <tr>
                                                    <td>
                                                         <label><%=patienttreatment.getCode()%></label>
                                                    </td>
                                                     <td>
                                                         <label><%=patienttreatment.getTreatment()%></label>
                                                    </td>
                                                     <td>
                                                         <label><%=patienttreatment.getDosage()%></label>
                                                    </td>
                                                    
                                                    <td>
                                                         <label><%=patienttreatment.getPrice()%></label>
                                                     </td>
                                                    <td>
                                                         <label><input type="checkbox" name="dispensed[]" value="<%=patienttreatment.getId()%>"/></label>
                                                    </td>
                                                    
                                                </tr>
                                                   <%}%>
                                            </table>
                                                       <select name="unitid">
                                        <%
                                            List units = mgr.listUnits();
                                            for (int r = 0; r < units.size(); r++) {
                                                Units unit = (Units) units.get(r);
                                        %>
                                        <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                                        <% }

                                        %>
                                    </select>
                                                
                                       
                                            </select
                                           <br/>
                                            <input type="hidden" name="patient" value="<%=request.getParameter("pid")%>"/>
                                            <input type="hidden" name="visitid" value="<%=request.getParameter("visitid")%>"/><br/>
                                            <input class="button-a gray" type="submit" name="pharmacy" value="Forward"/> 
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