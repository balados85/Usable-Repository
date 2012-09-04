<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <%  HMSHelper mgr = new HMSHelper();
            Patient p = null;
            p = mgr.getPatientByID(request.getParameter("patientid"));
            Visitationtable vs = null;


            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();

            vs = mgr.currentVisitations(Integer.parseInt(request.getParameter("id")));

            List visits = mgr.patientHistory(request.getParameter("patientid"));

            List investigations = mgr.listInvestigation();
            List treatments = mgr.listTreatments();
        %>
        <script type="text/javascript">
            
            var diagnosis = "";
            var treatment = "";
            var investigation = "";
            
            function showdetails(id){
                var show = document.getElementById(id);
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function showdTreatment(){
                var show = document.getElementById("treat");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function showdInvestigation(){
                var show = document.getElementById("lab");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function addDiagnosis(){
                var diag = document.getElementById("diagnosis").value;
                diagnosis = diagnosis+","+diag;
                document.getElementById("dd").value = diagnosis;
              
            }
            function addTreatment(){
                var treat = document.getElementById("treatment").value;
                treatment = treatment+","+treat;
                document.getElementById("tt").value=treatment;
            }
            function addInvestigation(){
                var invest = document.getElementById("ivestigation").value;
                investigation = investigation+","+invest;
                document.getElementById("lb").value=investigation;
                  alert("here");
            }
        </script>
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
                            <div class="title-grid">Visiting Sheet </div>
                            <div class="content-gird typography-heading">
                                <form action="action/vitalaction.jsp" method="post">
                                    <table>
                                        <tr>
                                            <td>
                                                <h3>Consultation Rooms</h3>
                                                <textarea name="vitals"><%= vs.getVitals()%></textarea><br/>

                                                <h3>Diagnosis:</h3>
                                                <select id="diagnosis" onchange ="addDiagnosis()">
                                                    <%
                                                        List diagnoses = mgr.listDiagnosis();
                                                        for (int i = 0; i < diagnoses.size(); i++) {
                                                            Diagnosis diagnosis = (Diagnosis) diagnoses.get(i);
                                                    %>
                                                    <option value="<%=diagnosis.getDiagnosis()%>"><%=diagnosis.getDiagnosis()%></option> 
                                                    <% }

                                                    %>
                                                </select><br/>
                                                <textarea name="diagnosis" id="dd" ></textarea>
                                                <br/>

                                            </td>
                                            <td>
                                                 <h3>Patient History</h3>
                                                <%  if (visits != null) {
                                                        for (int i = 0; i < visits.size(); i++) {
                                                            Visitationtable visit = (Visitationtable) visits.get(i);%>
                                        <tr>
                                            <td>
                                                <h5><a href="#?id=<%=visit.getVisitid()%>" onclick="showdetails(<%=visit.getVisitid()%>)"><%=visit.getDate()%></h5>
                                            </td>
                                            <td>
                                                <div style="display: none" id="<%=visit.getVisitid()%>">
                                                    <h3><%=visit.getVitals()%></h3>
                                                    <table>
                                                        <tr>
                                                            <td>Diagnosis</td> 
                                                            <td>Investigation</td>
                                                            <td>Drugs</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <% List diagObjs = mgr.patientDiagnosis(visit.getVisitid());
                                                                    if (diagObjs != null) {
                                                                        for (int r = 0; r < diagObjs.size(); r++) {
                                                                            Patientdiagnosis diagObj = (Patientdiagnosis) diagObjs.get(r);
                                                                %>
                                                                <%= diagObj.getDiagnosis()%>
                                                                <%   }
                                                                }%>
                                                            </td>
                                                            <td>
                                                                <% List treatObjs = mgr.patientTreatment(visit.getVisitid());
                                                                    if (treatObjs != null) {
                                                                        for (int s = 0; s < treatObjs.size(); s++) {
                                                                            Patienttreatment treatObj = (Patienttreatment) treatObjs.get(s);
                                                                %>
                                                                <%= treatObj.getTreatment()%> - <%=treatObj.getDosage()%>
                                                                <%   }
                                                                }%>
                                                            </td>
                                                            <td>
                                                                <% List investObjs = mgr.patientInvestigation(visit.getVisitid());
                                                                    if (investObjs != null) {
                                                                        for (int t = 0; t < investObjs.size(); t++) {
                                                                            Patientinvestigation investObj = (Patientinvestigation) investObjs.get(t);
                                                                %>
                                                                <%= investObj.getInvestigation()%> - <%=investObj.getResult()%>
                                                                <%              }
                                                                }%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>

                                        </tr>
                                        <%     }
                                            }
                                        %>
                                        </td>
                                        </tr>
                                    </table> 
                                    <table>
                                        <tr>
                                            <td> 
                                                <a href="#" onclick="showdTreatment()">Prescription Form</a>
                                                <div style="display: none" id="treat">
                                                    <select name="treat" id="treatment" onchange = "addTreatment()">
                                                        <%
                                                            // List treatments = mgr.patientTreatment(int visitationid);
                                                            if (treatments != null) {
                                                                for (int i = 0; i < treatments.size(); i++) {
                                                                    Treatment treatment = (Treatment) treatments.get(i);
                                                        %>
                                                        <option value="<%=treatment.getTreatment()%>"><%=treatment.getTreatment()%></option> 
                                                        <% }
                                                            }
                                                        %>
                                                    </select><br/>
                                                    <textarea name="treatment" id="tt"></textarea>

                                                </div>
                                            </td>
                                            <td>
                                                <a href="#" onclick="showdInvestigation()">Laboratory Request Form</a>
                                                <div style="display: none" id="lab">

                                                    <select name="inves" id="investigation" onchange = "addInvestigation()">
                                                        <%
                                                            // List treatments = mgr.patientTreatment(int visitationid);
                                                            if (investigations != null) {
                                                                for (int i = 0; i < investigations.size(); i++) {
                                                                    Investigation investigation = (Investigation) investigations.get(i);
                                                        %>
                                                        <option value="<%=investigation.getInvestigation()%>"><%=investigation.getInvestigation()%></option> 
                                                        <% }
                                                            }
                                                        %>
                                                    </select><br/>
                                                    <textarea name="investigation" id="lb"></textarea> 

                                                </div>
                                            </td>
                                        </tr>
                                    </table> <select name="unitid">
                                        <%
                                            List units = mgr.listUnits();
                                            for (int i = 0; i < units.size(); i++) {
                                                Units unit = (Units) units.get(i);
                                        %>
                                        <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                                        <% }

                                        %>
                                    </select>
                                    <input type="hidden" name="patientid" value="<%=request.getParameter("patientid")%>"/>
                                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                                    <input type="submit" name="action" value="Forward"/>
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
