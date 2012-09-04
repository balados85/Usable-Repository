<%-- 
    Document   : home
    Created on : Jun 26, 2012, 10:23:18 AM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html lang="en">
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

                        <ul style="margin-left: 0px;" class="breadcrumb span4">
                            <li>
                                <a >Patient Management</a>
                            </li>
                        </ul>
                        <div style="margin-bottom: 20px;" class="btn-group pull-right">
                            <button  id="dialog_link" class="btn btn-large ">
                                <i class="icon-pencil "></i> New Patient
                            </button>

                            <div class="clearfix"></div>
                        </div>

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
                                    // Patient singleton = (Patient) session.getAttribute("patient");

                                    // Sponsorhipdetails sponsorDetail = mgr.sponsorshipDetails(singleton.getPatientid());
                                    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
                                    List patients = mgr.listPatients();
                                    for (int i = 0; i < patients.size(); i++) {
                                        Patient patient = (Patient) patients.get(i);
                                        Sponsorhipdetails sponsor = mgr.sponsorshipDetails(patient.getPatientid());
                                %>

                                <tr class="odd gradeX">
                                    <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <%=mgr.getPatientByID(patient.getPatientid()).getFname()%> <%=mgr.getPatientByID(patient.getPatientid()).getLname()%> </h5> <h5><b> Date of Birth :</b> <%= formatter.format(patient.getDateofbirth())%> </h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> Male </td> </tr> <tr> <td> Employer </td> <td> Guiness  </td>  </tr> <tr> <td> Sponsor </td> <td> <%= mgr.getSponsor(sponsor.getSponsorid()).getSponsorname()%> </td> </tr> <tr>
                                        <td> Policy Number </td> <td> <%= sponsor.getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%= sponsor.getBenefitplan()%> </td> </tr>  </table> "><a class="patientid" id="<%= patient.getPatientid()%>link" href="#"><%= patient.getPatientid()%></a></td><td><b><%= mgr.getPatientByID(patient.getPatientid()).getLname()%> </b>,  <%=   mgr.getPatientByID(patient.getPatientid()).getFname()%>
                                    <td><%= mgr.getSponsor(sponsor.getSponsorid()).getSponsorname()%></td> </td><td> <%= formatter.format(patient.getDateofregistration())%></td> 
                                    <td> <a id="<%= patient.getPatientid()%>visit"  class="btn btn-info"> <i class="icon-pencil icon-white"> </i> New Visit </a> </td>
                                </tr>





                                <% }

                                %>
                            </tbody>
                        </table>

                    </div>

                </div>

            </section>

            <%@include file="widgets/footer.jsp" %>

        </div><!-- /container -->



        <%@include file="widgets/javascripts.jsp" %>



        <%@include file="widgets/loaded.jsp" %>

        <%   for (int i = 0; i < patients.size(); i++) {
                Patient patient1 = (Patient) patients.get(i);
                Sponsorhipdetails sponsor1 = mgr.sponsorshipDetails(patient1.getPatientid());
        %>

        <script type="text/javascript">
            $(document).ready(function(){
                
               
                $('#<%= patient1.getPatientid()%>').dialog({
                    autoOpen : false,
                    width : 600,
                    modal :true,
                    position : "top"
		
                });
                
                $('#<%= patient1.getPatientid()%>visit').click(function(){
                   
                    $('#<%= patient1.getPatientid()%>').dialog('open');
                    return false;
                });
                
                $('#<%= patient1.getPatientid()%>link').click(function(){
                   
                    $('#<%= patient1.getPatientid()%>').dialog('open');
                    return false;
                });
                
            });
        </script>

        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="user_summary hide" id="<%= patient1.getPatientid()%>"  title="Patient Information">

            <div style="margin-top: 12px; padding-top: 5px;  padding-bottom: 5px; text-align: center;" class="thumbnail span2">
                <img src="images/default_profile.png" />

            </div>

            <table class="table span3 right table table-bordered table-condensed">
                <tr>
                    <td> First Name</td>

                    <td> <b>  <%=mgr.getPatientByID(patient1.getPatientid()).getFname()%> </b></td>
                </tr>
                
                <tr>
                    <td> Gender </td>

                    <td> <b><%=mgr.getPatientByID(patient1.getPatientid()).getGender()%> </b> </td>
                </tr>

                <tr>
                    <td> Employer </td>

                    <td> <b> <%=mgr.getPatientByID(patient1.getPatientid()).getEmployer()%> </b></td>
                </tr>


            </table>

            <div class="clearfix"></div>

            <form class="span3" style="text-align: center; margin-left: 25%; "  action="action/forwardaction.jsp" method="post">
                Send  <b>  <%=mgr.getPatientByID(patient1.getPatientid()).getFname()%>   <%=mgr.getPatientByID(patient1.getPatientid()).getLname()%> </b> to;
                <select name="unitid" onchange="updateView()">
                    <%
                        List units = mgr.listUnits();

                        for (int x = 0; x < units.size(); x++) {
                            Units unit = (Units) units.get(x);
                    %>
                    <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                    <% }

                    %>
                </select><br/>
                <button class="btn btn-danger" type="submit" id="action" name="action" value="forward">
                    <i class="icon-arrow-right icon-white"> </i> Forward 
                </button>

            </form>
            <div class="clearfix"></div>

            <div class="btn-group" style="margin-left: 30%;">
                <button class="btn update_sponsor btn-info">Sponsorship</button>
                <button class="btn update_vitals btn-info">Vitals</button>
                <button class="btn update_history btn-info">History</button>
            </div> 
            <br />
            <div class="clearfix"></div>

            <div style="display: none;" class="vitals_panel thumbnail well hide">
                <ul class="breadcrumb">
                    <li>
                        <a  href="#">Vitals </a>
                    </li>

                </ul>
                <form class="form-horizontal">

                    <fieldset>

                        <div class="control-group">
                            <label class="control-label" for="input01">Sponsor Type</label>
                            <div class="controls">
                                <select id="select01">
                                    <option>Cash Paying</option>
                                    <option>Private  Insurance </option>
                                    <option>Company Benefits </option>
                                    <option>National Health Insurance </option>

                                </select>
                                <p class="help-inline">
                                    Select Appropriately
                                </p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Sponsor </label>
                            <div class="controls">
                                <select id="select01">
                                    <option>Momentum Ghana</option>
                                    <option>GLICO Mutual Health </option>
                                    <option>First Fidelity Insurance</option>
                                    <option>Liberty Mutual </option>
                                    <option>MedX Health Systems</option>
                                    <option>Premier Mutual Insurance</option>
                                </select>

                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Benefit Plan</label>
                            <div class="controls">
                                <select id="select01">
                                    <option>Executive </option>
                                    <option>Premium </option>
                                    <option>Gold</option>
                                    <option>Regular</option>
                                </select>

                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Policy Number</label>
                            <div class="controls">
                                <input type="text" />

                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn ui-primary ">
                                <i class="icon-ok"></i> Save changes
                            </button>
                            <button type="button" class="btn btn-inverse vitals_cancel">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>

                        </div>
                    </fieldset>
                </form>
            </div>
            <div style="display: none;" class="sponsor_panel thumbnail well hide">
                <ul class="breadcrumb">
                    <li>
                        <a  href="#"> Sponsorship Details </a>
                    </li>

                </ul>

                <form action="action/sponsorupdate.jsp" method="post" class="form-horizontal">
                    <fieldset>

                        <div class="control-group">
                            <label class="control-label" for="input01">Sponsor Type</label>
                            <div class="controls">
                                <% if (sponsor1 != null) {%>
                                <select name="type">
                                    <%if (sponsor1.getType() != null) {%>
                                    <option selected="selected" value="<%=sponsor1.getType()%>"><%=sponsor1.getType()%></option> 
                                    <%}%>
                                    <option value="nhis">National Health Insurance </option>
                                    <option value="cash">Out of Pocket</option>
                                    <option value="private">Private Health Insurance</option>
                                    <option value="cooperate">Corporate</option>
                                </select>
                                <%}%> 
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Sponsors</label>
                            <div class="controls">
                                <% if (sponsor1 != null) {%>
                                <select name="sponsorid">
                                    <%
                                        List sponsorList = mgr.listSponsors();
                                        for (int p = 0; p < sponsorList.size(); p++) {
                                            Sponsorship sponsor = (Sponsorship) sponsorList.get(p);
                                            if (sponsor.getSponshorshipid() == sponsor1.getSponsorid()) {%>
                                    <option selected="selected" value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option> 
                                    <% }
                                    %>
                                    <option value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option> 
                                    <% }

                                    %>
                                </select>
                                <%}%>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="input01">Benefit Plan : </label> 
                            <div class="controls">
                                <% if (sponsor1 != null) {%>
                                <input type="text" name="benefitplan" value="<%=sponsor1.getBenefitplan() == null ? "" : sponsor1.getBenefitplan()%>"/>

                                <%}%><p class="help-inline">

                                </p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Membership ID Number : </label>
                            <div class="controls">
                                <% if (sponsor1 != null) {%>
                                <input type="text" name="membershipid" value="<%=sponsor1.getMembershipid() == null ? "" : sponsor1.getMembershipid()%>"/>

                                <input type="hidden" name="patientid" value="<%= patient1%>"/>
                                <%}%><p class="help-inline">

                                </p>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn" id="action" name="action" value="update"><i class="icon-edit "> </i> Update Details</button>
                            <button type="button" class="btn btn-inverse slideup">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>
                        </div>
                    </fieldset>
                </form>

            </div>

            <div style="display: none;" class="history_panel thumbnail well hide">
                <ul class="breadcrumb">
                    <li>
                        <a  href="#">Visit History </a>
                    </li>

                </ul>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="color: black;">Visit Date </th>
                            <th style="color: black;">Visit Type </th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="patient_visit" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Visit Summary </h3> <h5> Emmanuel Addo-Yirenkyi </h5> <h5> 15th April, 2012 </h5> <span>"
                                data-content="<table class='table table-bordered'> <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr> <tr>
                                <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> </table> "> fdsfs </td>
                            <td>fsdfs</td>
                        </tr>
                        <tr>
                            <td class="patient_visit" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Visit Summary </h3> <h5> Emmanuel Addo-Yirenkyi </h5> <h5> 15th April, 2012 </h5> <span>"
                                data-content="<table class='table table-bordered'> <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr> <tr>
                                <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> </table> "> fdsfs </td>
                            <td>fsdfs</td>
                        </tr>
                        <tr>
                            <td class="patient_visit" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Visit Summary </h3> <h5> Emmanuel Addo-Yirenkyi </h5> <h5> 15th April, 2012 </h5> <span>"
                                data-content="<table class='table table-bordered'> <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr> <tr>
                                <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> </table> "> fdsfs </td>
                            <td>fsdfs</td>
                        </tr>
                        <tr>
                            <td class="patient_visit" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Visit Summary </h3> <h5> Emmanuel Addo-Yirenkyi </h5> <h5> 15th April, 2012 </h5> <span>"
                                data-content="<table class='table table-bordered'> <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr>  <tr> <td> Hello </td> <td> Hello </td> </tr> <tr>
                                <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> <tr> <td> Hello </td> <td> Hello </td> </tr> </table> "> fdsfs </td>
                            <td>fsdfs</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        <% }

        %>
    </body>
</html>
