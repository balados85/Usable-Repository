<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="entities.HMSHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>ClaimSync Extended</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Le styles -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link type="text/css" href="css/custom-theme/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
        <link href="css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css">
        <style type="text/css" title="currentStyle">
            @import "css/jquery.dataTables_themeroller.css";
            @import "css/custom-theme/jquery-ui-1.8.16.custom.css";
            body {
                /*    overflow: hidden; */
            }

            .large_button {
                background-color: #35AFE3;
                background-image: -moz-linear-gradient(center top , #45C7EB, #2698DB);
                box-shadow: 0 1px 0 0 #6AD2EF inset;
                color: #FFFFFF;
                text-decoration: none;
                font-weight: lighter;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 36px;
            }

            .large_button:hover {
                background-color: #FBFBFB;
                background-image: -moz-linear-gradient(center top , #FFFFFF, #F5F5F5);
                background-repeat: repeat-x;
                border: 1px solid #DDDDDD;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 0 #FFFFFF inset;
                list-style: none outside none;
                color: #777777;
                /* padding: 7px 14px; */
            }
        </style>

        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

        <%
            HMSHelper mgr = new HMSHelper();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            //Patient p = (Patient)session.getAttribute("patient");
            //get current date time with Date()
            Date date = new Date();
            //System.out.println(dateFormat.format(date));
            List visits = mgr.listUnitVisitations("Pharmacy", dateFormat.format(date));
            // for (int i = 0; i < visits.size(); i++) {
            //   Visitationtable visit = (Visitationtable) visits.get(i);
%>
    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">


        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <%@include file="widgets/subhead.jsp" %>

            <%@include file="widgets/loading.jsp" %>
            <section style="margin-top: -30px;" id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>


                    <div style="margin-top: 0px; "class="span12 offset3 content">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content hide">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <a> <i class="icon-tasks"></i> Pharmacy</a>
                                </li>

                            </ul>
                            <table class="example display">
                                <thead>
                                    <tr>
                                        <th> Patient No </th>
                                        <th> Patient Name </th>
                                        <th> Date of Birth  </th>
                                        <th> Sponsor </th>
                                        <th> Membership ID </th>
                                        <th> Request Date </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (int i = 0; i < visits.size(); i++) {
                                            Visitationtable vst = (Visitationtable) visits.get(i);
                                    %>
                                    <tr>
                                        <td style=" text-transform: uppercase;" class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5><%=mgr.getPatientByID(vst.getPatientid()).getFname()%> <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></h5> <h5><b> Date of Birth :</b> <%=mgr.getPatientByID(vst.getPatientid()).getDateofbirth()%></h5> </span>"
                                            data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getEmployer()%> </td>  </tr> <tr> <td> Sponsor </td> <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%></td> </tr> <tr>
                                            <td> Policy Number </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getBenefitplan()%> </td> </tr>  </table> "> <%=vst.getPatientid()%>   </td>
                                        <td><%=mgr.getPatientByID(vst.getPatientid()).getFname()%> <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></td>
                                        <td><%=mgr.getPatientByID(vst.getPatientid()).getDateofbirth()%> </td>

                                        <td><%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%> </td>
                                        <td><%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%>   </td>

                                        <td><%=vst.getDate()%> </td>
                                        <td>
                                            <button class="btn btn-info" id="<%=vst.getPatientid()%>_link">
                                                <i class="icon-white icon-check"></i> Dispense
                                            </button>
                                        </td>
                                    </tr>
                                    <%
                                        }

                                    %>
                                </tbody>
                            </table>
                        </div>
                                
                                
                                
                                

                    </div>
                    <div class="clearfix"></div>


                </div>
            </section>
            <%@include file="widgets/footer.jsp" %>
        </div>





        <%@include file="widgets/javascripts.jsp" %>
    </body>
</html>
