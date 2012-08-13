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
                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">

                        <ul style="margin-left: 0px; " class="breadcrumb ">
                            <li>
                                <a >Out Patient Department</a><br/>
                                    <%if(session.getAttribute("lasterror") != null){ %>
                                    <h3><a> <%=session.getAttribute("lasterror")%> </a></h3>
                                    <%}%>
                            </li>
                        </ul>

                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>

                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Sponsor</th>
                                    <th>Registered On</th>
                                    <th> </th>



                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    HMSHelper mgr = new HMSHelper();
                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    //Patient p = (Patient)session.getAttribute("patient");
                                    //get current date time with Date()
                                    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
                                    Date date = new Date();
                                    //System.out.println(dateFormat.format(date));
                                    List visits = mgr.listUnitVisitations("OPD", dateFormat.format(date));
                                    // List patients = mgr.listPatients();
                                    for (int i = 0; i < visits.size(); i++) {
                                        Visitationtable visit = (Visitationtable) visits.get(i);


                                %>

                                <tr>
                                    <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%> </h5> <h5><b> Date of Birth :</b> <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofbirth())%>  </h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%= mgr.getPatientByID(visit.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%= mgr.getPatientByID(visit.getPatientid()).getEmployer()%>  </td>  </tr> <tr> <td> Sponsor </td> <td> <%= mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%> </td> </tr> <tr>
                                        <td> Policy Number </td> <td> <%= mgr.sponsorshipDetails(visit.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%= mgr.sponsorshipDetails(visit.getPatientid()).getBenefitplan()%> </td> </tr>  </table> ">
                                        <a href="vital.jsp?patientid=<%=visit.getPatientid()%>&id=<%=visit.getVisitid()%>"><%= visit.getPatientid()%> </a> 
                                    </td>
                                    <td>
                                        <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%> 
                                    </td>
                                    <td>
                                        <%= mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%>
                                    </td>
                                    <td>
                                        <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofregistration())%>
                                    </td>
                                    <td>
                                        <a id="<%=visit.getPatientid()%><%=visit.getVisitid()%>link"  class="visitlink btn btn-info"> <i class="icon-pencil icon-white"> </i> New Vital Record </a>
                                    </td>
                                </tr>
                                <% }

                                %>
                            </tbody>
                        </table>
                    </div> 

                    <div class="clear"></div>



                </div>

            </section>

            <%@include file="widgets/footer.jsp" %>

        </div><!-- /container -->



        <%@include file="widgets/javascripts.jsp" %>

        <%   for (int i = 0; i < visits.size(); i++) {
                Visitationtable visit = (Visitationtable) visits.get(i);%>
        <script type="text/javascript">
            $(document).ready(function(){
                                                      
               
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog({
                    autoOpen : false,
                    width : 600,
                    modal :true,
                    position : "top"
		
                });
                
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>link').click(function(){
                   
                    $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog('open');
                    return false;
                });
                
                                                        
                
            });
        </script>

        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="visit hide" id="<%=visit.getPatientid()%><%=visit.getVisitid()%>"  title="Patient Vital">

            <div class="well thumbnail">
                <ul style="margin-left: 0px;" class="breadcrumb">
                    <li>
                        <span class="divider"></span>  Folder No: <%= mgr.getPatientByID(visit.getPatientid()).getPatientid() %> 
                    </li>
                </ul>
                <form action="action/vitalaction.jsp" method="post" class="form-horizontal">

                    <fieldset>

                        <div class="control-group">
                            <label class="control-label" for="input01">Temperature: </label>
                            <div class="controls">
                                <input type="text" name="temp" placeholder="0.0" value=""/>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Weight: </label>
                            <div class="controls">
                                <input type="text" name="weight" placeholder="0.0" value=""/>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Height: </label>
                            <div class="controls">
                                <input type="text" name="height" placeholder="0.0" value=""/>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Pulse: </label>
                            <div class="controls">
                                <input type="text" name="pulse" placeholder="0" value=""/>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Blood Pressure (BP): </label>
                            <div class="controls">
                                <input type="text" name="bp" placeholder="0" value=""/>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Other Symptoms: </label>
                            <div class="controls">
                                <textarea class="medium"  id="message" name="content" rows="5" name="vitals"></textarea><br/>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">To Consultation Room: </label>
                            <div class="controls">
                                <select class="chzn-select medium-select select chzn-done" name="conroom">
                                    <%
                                        Patient p = null;


                                        p = mgr.getPatientByID(visit.getPatientid());
                                        session.setAttribute("current", p);
                                        List consultingrooms = mgr.listConRooms();
                                        for (int j = 0; j < consultingrooms.size(); j++) {
                                            Consultingrooms consultingroom = (Consultingrooms) consultingrooms.get(j);
                                    %>
                                    <option value="<%=consultingroom.getConsultingroom()%>"><%=consultingroom.getConsultingroom()%></option> 
                                    <% }

                                    %>


                                </select>
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-actions">
                            <input type="hidden" name="patientid" value="<%= visit.getPatientid()%>"/>
                            <input type="hidden" name="id" value="<%=visit.getVisitid()%>"/>
                            <button class="btn btn-danger btn-large" type="submit" name="action" value="Forward">
                                <i class="icon-arrow-right icon-white"> </i> Forward 
                            </button>

                        </div>
                    </fieldset>
                </form>

            </div>
        </div>


        <div class="clear"></div>

        <% }%>

    </body>
</html>



</body>
</html>