<%-- 
    Document   : visit
    Created on : Mar 31, 2012, 2:06:22 PM
    Author     : afuaantwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="widgets/stylesheets.jsp" %>
        <%
            HMSHelper mgr = new HMSHelper();
            Patient p = (Patient) session.getAttribute("patient");

            Sponsorhipdetails sd = mgr.sponsorshipDetails(p.getPatientid());
            session.setAttribute("details", sd);
        %>
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

                        <ul style="margin-left: 0px;" class="breadcrumb span6">
                            <li>
                                Visiting Sheet
                            </li>
                        </ul>
                        <div style="margin-bottom: 20px;" class="btn-group pull-right">

                            <form action="action/forwardaction.jsp" method="post">
                                <div class="input-append">
                                    <select class="span2" name="unitid">


                                        <%
                                            List units = mgr.listUnits();
                                            for (int i = 0; i < units.size(); i++) {
                                                Units unit = (Units) units.get(i);
                                        %>
                                        <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                                        <% }

                                        %>


                                    </select>

                                    <input type="submit" name="action" class="btn" value="Forward"/>
                                </div>
                            </form>



                        </div>
                        <div class="clearfix"></div>

                        <div style="margin-top: 12px; padding-top: 5px;  padding-bottom: 5px; text-align: center;" class="thumbnail span2">
                            <img src="images/default_profile.png" />
                            <button  id="modal_link" class="btn btn-small btn-inverse">
                                <i class="icon-edit"> </i> Edit
                            </button>
                            <button id="dialog_link"   class="btn btn-small btn-danger">
                                <i class="icon-remove"> </i> Delete
                            </button>
                            <table class="table table-condensed">
                                <tr>

                                    <td style="text-align: center;"> <b> <%=mgr.getPatientByID(p.getPatientid()).getLname()%> </b> , <b>  <%=mgr.getPatientByID(p.getPatientid()).getFname()%> </b></td>

                                </tr>
                                <tr >
                                    <td style="text-align: center;"> <b> <%=mgr.getPatientByID(p.getPatientid()).getGender()%> </b> </td>

                                </tr>

                            </table>

                        </div>

                        <table class="table span3 right table-striped table-bordered">

                            <tr>
                                <td> Employer </td>

                                <td> <b> <%=mgr.getPatientByID(p.getPatientid()).getEmployer()%> </b> </td>
                            </tr>
                            <tr>
                                <td>Sponsorship Type </td> 
                                <td>  <%=sd.getType()%> </td>
                            </tr>
                            <tr>
                                <td>Sponsors </td>
                                <td> <%= mgr.getSponsor(sd.getSponsorid()).getSponsorname()%></td>
                            </tr>
                            <tr>
                                <td>  Membership ID:</td>
                                <td>  <%=sd.getMembershipid()%> </td>
                            </tr>
                            <tr>
                                <td>
                                    Benefit Plan                                
                                </td>
                                <td>
                                    <%=sd.getBenefitplan()%>
                                </td>
                            </tr>







                        </table> 
                                <div style="max-height: 500px; ">          
                            <table class="span3 right table-bordered">
                                <thead>
                                    <tr> 
                                        <th style="color: black;">
                                            Visit Date
                                        </th>
                                        <th style="color: black;">
                                            Visit Type
                                        </th>

                                    </tr>
                                </thead>
                                <tr>
                                    <td> Employer </td>

                                    <td> <b> <%=mgr.getPatientByID(p.getPatientid()).getEmployer()%> </b> </td>
                                </tr>








                            </table> 


                        </div>
                    </div>

                </div>
            </section>

        </div>
        <%@include file="widgets/javascripts.jsp" %>

        <%@include file="widgets/loaded.jsp" %>
    </body>
</html>
