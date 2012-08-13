<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>ClaimSync Extended</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
        <%
            HMSHelper mgr = new HMSHelper();
            List units = mgr.listUnits();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();
            List visits = mgr.listRecentVisits(dateFormat.format(date));
            //String patientid = request.getParameter("patientid")== null ? "" : request.getParameter("patientid");
            try {
            } catch (Exception e) {
                session.setAttribute("lasterror", "patient does not exist please try again");
                response.sendRedirect("index.jsp");
            }
            //Patient patient = mgr.getPatientByID(patientid);
%>
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
                overflow: hidden;
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

    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <!-- Navbar
        ================================================== -->
        <div style="display: none;" class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
                    <a class="brand" href="../"><img src="images/logo.png" width="200px;" /></a>

                    <div style="margin-top: 10px;" class="nav-collapse">
                        <ul class="nav pull-right">

                            <li class="dropdown">
                                <a class="active" > Logged in as:  Mr. Amoo </a>

                            </li>
                            <li class="divider-vertical"></li>

                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> Account <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li>
                                        <a target="_blank" href="bootstrap.min.css"><i class="icon-wrench"></i> Settings </a>
                                    </li>

                                    <li>
                                        <a target="_blank" href="bootstrap.css"><i class="icon-question-sign"></i> Help </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="bootstrap.css"><i class="icon-share"></i> Feedback </a>
                                    </li>
                                    <li class="divider"></li>

                                    <li>
                                        <a target="_blank" href="variables.less"><i class="icon-off"></i> Log Out</a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li>
                            <a href="#">Front Desk</a><span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">Recent Patients</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            <div style="position: absolute; left: 30%; top: 200px; text-align: center;" class="progress1">
                <img src="images/logoonly.png" width="136px;" style="margin-bottom: 20px;" />
                <a href="#"> <h3 class="segoe" style="text-align: center; font-weight: lighter;"> Your page is taking longer than expected to load.....
                        <br />
                        Please be patient!</h3>
                    <br />
                </a>
                <div  class="progress progress-striped active span5">

                    <div class="bar"
                         style="width: 100%;"></div>
                </div>
            </div>

            <section style="margin-top: -30px;" id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">
                      <%@include file="widgets/leftsidebar.jsp" %>
                    
                    
<!--
                    <div style="height: 100%; position: fixed;" class="span3">
                        <ul style="display: none; " class="menu">
                            <li class="item1">
                                <a href=""><i class="icon-home"></i> Front Desk </a>

                                <ul>
                                    <li class="subitem1">
                                        <a class="dialog_link" href="#">New Patient </a>
                                    </li>
                                    <li class="subitem2">
                                        <a class="dialog_link2">Find Patient</a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="">Recent Patients</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item3">
                                <a href="#"><i class="icon-user"></i> Appointments </a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="">View Staff <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="">New Staff</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="item4">
                                <a href="#"><i class="icon-lock"></i> Consultation </a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="">Membership Status <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="">Benefit Status <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="">Membership Archive <span>2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item5">
                                <a href="#"> <i class="icon-list-alt"></i> Statistics & Reports </a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="">Client Utilization </a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="">Provider Utilization </a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="">Medical Analysis </a>
                                    </li>
                                    <li class="subitem4">
                                        <a href="">Cash Claims</a>
                                    </li>
                                    <li class="subitem5">
                                        <a href="">Medical Claims</a>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    --->
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <a> <i class="icon-tasks"></i> Recent Patients</a>
                                </li>

                            </ul>
                            <table class="example display">
                                <thead>
                                    <tr>
                                        <th> Folder Number </th>
                                        <th> Full name</th>
                                        <th> Date of Birth </th>
                                        <th> Sponsor </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (int r = 0; r < visits.size(); r++) {
                                            Visitationtable visit = (Visitationtable) visits.get(r);
                                    %>
                                    <tr>
                                        <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <%=mgr.getPatientByID(visit.getPatientid()).getFname()%> <%=mgr.getPatientByID(visit.getPatientid()).getLname()%> </h5> <h5><b> Date of Birth :</b>  <%=mgr.getPatientByID(visit.getPatientid()).getDateofbirth()%></h5> </span>"
                                            data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%=mgr.getPatientByID(visit.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%=mgr.getPatientByID(visit.getPatientid()).getEmployer()%> </td>  </tr> <tr> <td> Sponsor </td> <td><%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%> </td> </tr> <tr>
                                            <td> Policy Number </td> <td><%=mgr.sponsorshipDetails(visit.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%=mgr.sponsorshipDetails(visit.getPatientid()).getBenefitplan()%> </td> </tr>  </table> "> <%=mgr.getPatientByID(visit.getPatientid()).getPatientid()%> </td>

                                        <td><%=mgr.getPatientByID(visit.getPatientid()).getFname()%> <%=mgr.getPatientByID(visit.getPatientid()).getLname()%></td>
                                        <td> <%=mgr.getPatientByID(visit.getPatientid()).getDateofbirth()%> </td>
                                        <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%></td>
                                        <td>
                                            <button class="btn user_summary_link btn-info">
                                                <i class="icon-white icon-pencil"></i> New Visit
                                            </button></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

                        </div>

                    </div>
                    <div class="clearfix"></div>

                </div>

            </section>

            <footer style="display: none; margin-top: 50px;" class="footer">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>

        </div><!-- /container -->

        <div style="display: none;" id="dialog" title="New Patient">

            <form action="action/registrationaction.jsp" method="POST" class="form-horizontal well">
                <fieldset>
                    <div class="pre_first_half">
                        <div class="control-group">
                            <label class="control-label" for="input01">Folder No. / Patient ID </label>
                            <div class="controls">
                                <input type="text" name="patientid"  id="input01"/>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="first_half">
                        <div class="control-group">
                            <label class="control-label" for="input01">First Name</label>
                            <div class="controls">
                                <input  type="text" name="fname"  id="input01"/>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="input01">Last Name</label>
                            <div class="controls">
                                <input type="text" name="lname"  id="input01"/>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Middle Name</label>
                            <div class="controls">
                                <input type="text" name="midname"  id="input01"/>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Gender</label>
                            <div class="controls">
                                <select name="gender" id="select01">
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="inputError">Date of Birth</label>
                            <div class="controls">
                                <input name="dob" class="input-mini"/>
                                <input name="dob" class="input-mini"/>
                                <input name="dob" class="input-mini"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div class="form-actions first">
                            <button type="button" class="btn ui-primary continue">
                                <i class="icon-ok"></i> Continue
                            </button>
                            <button type="button" class="btn btn-inverse close_dialog">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>

                        </div>

                    </div>
                    <div class="second_half" style="display: none;">
                        <div class="control-group">
                            <label class="control-label" for="inputSuccess">Address</label>
                            <div class="controls">
                                <textarea type="text" name="address" id="inputSuccess"></textarea>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="inputSuccess">Telephone No.</label>
                            <div class="controls">
                                <input type="text" name="contact" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputSuccess">Emergency Person.</label>
                            <div class="controls">
                                <input type="text" name="emergencyperson" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputSuccess">Emergency Tel. No.</label>
                            <div class="controls">
                                <input type="text" name="emergencycontact" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputSuccess">Email</label>
                            <div class="controls">
                                <input type="text" name="email" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputSuccess">Employer</label>
                            <div class="controls">
                                <input type="text" name="employer" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-actions second">
                            <button type="button" class="btn ui-primary proceed">
                                <i class="icon-ok"></i> Continue
                            </button>
                            <button type="button" class="btn btn-info back">
                                <i class="icon-arrow-left icon-white"></i> Previous
                            </button>
                            <button type="button" class="btn btn-inverse close_dialog">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>

                        </div>
                    </div>

                    <div style="display: none;" class="third_half">

                        <div class="control-group">
                            <label class="control-label" for="selectError">Sponsorship Method</label>
                            <div class="controls">
                                <select name="type">
                                    <option value="cooperate">Corporate</option>
                                    <option value="cash">Out of Pocket </option>
                                    <option value="private">Private Health Insurance</option>
                                    <option value="nhis">National Health Insurance</option>
                                </select>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="selectError">Sponsors</label>
                            <div class="controls">
                                <select name="sponsorid">
                                    <%

                                        List Sponsors = mgr.listSponsors();
                                        for (int i = 0; i < Sponsors.size(); i++) {
                                            Sponsorship sponsor = (Sponsorship) Sponsors.get(i);
                                    %>
                                    <option value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option>
                                    <% }

                                    %>

                                </select>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" name="membershipid" for="inputSuccess">Membership ID</label>
                            <div class="controls">
                                <input type="text" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" name="benefitplan" for="inputSuccess">Benefit Plan</label>
                            <div class="controls">
                                <input type="text" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="submit" name ="action" value="patient" class="btn ui-primary ">
                                <i class="icon-ok"></i> Save changes
                            </button>
                            <button type="button" class="btn btn-info previous">
                                <i class="icon-arrow-left icon-white"></i> Previous
                            </button>
                            <button type="button" class="btn btn-inverse close_dialog">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>

                        </div>

                    </div>
                </fieldset>
            </form>

        </div>

        <div style="display: none;" id="dialog2" title="Patient Search">

            <form class="form-horizontal">
                <fieldset>
                    <div class="control-group center">
                        <h3> Search By </h3>
                        <br /><select name="searchid">
                            <option value="patientid">Patient ID/Folder No.</option>
                            <option value="fullname">Patient Name</option>
                            <option value="memberdshipnumber">Policy No.</option>

                        </select>
                        </select>

                    </div>

                    <hr />

                    <div class="clearfix"></div>
                    <div class="center">

                        <input type="text" placeholder="Please enter search query" class="input-xlarge" />

                        <br />
                        <br />
                        <br />
                        <a href="searchresults.jsp" class="btn btn-large"><i class="icon-search"></i> Patient Search</a>

                    </div>

                </fieldset>
            </form>

        </div>
        <% for (int s = 0; s < visits.size(); s++) {
                Visitationtable visit = (Visitationtable) visits.get(s);
                Patient patient1 = mgr.getPatientByID(visit.getPatientid());
                Sponsorhipdetails sp = mgr.sponsorshipDetails(visit.getPatientid());
        %>
        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="user_summary hide " id="<%= patient1.getPatientid()%>"  title="Patient Information">
            <div class="well thumbnail">
                <ul style="margin-left: 0px;" class="breadcrumb">
                    <li>
                        <span class="divider"></span>  Folder No: PAT-0011
                    </li>
                </ul>

                <div style="margin-top: 12px; padding-top: 5px;  padding-bottom: 5px; text-align: center;" class="thumbnail span2">
                    <img src="images/default_profile.png" />

                </div>

                <table class="table span3 right table table-bordered table-condensed">
                    <tr>
                        <td> First Name</td>

                        <td> <b> <%= patient1.getFname()%></b></td>
                    </tr>
                    <tr>
                        <td> Last Name</td>

                        <td> <b> <%= patient1.getLname()%> </b> </td>
                    </tr>
                    <tr>
                        <td> Gender </td>

                        <td> <b><%= patient1.getGender()%> </b> </td>
                    </tr>

                    <tr>
                        <td> Employer </td>

                        <td> <b> <%= patient1.getEmployer()%> </b></td>
                    </tr>


                </table>

                <div class="clearfix"></div>

                <form class="span3" style="text-align: center; margin-left: 25%; "  action="action/forwardaction.jsp" method="post">
                    Send  <b>  <%= patient1.getLname()%>  <%= patient1.getFname()%> </b> to;
                    <select name="unitid" onchange="updateView()">
                                                    <%
                                                       // List units = mgr.listUnits();
                                                     
                                                        for (int i = 0; i < units.size(); i++) {
                                                            Units unit = (Units) units.get(i);
                                                    %>
                                                    <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                                                    <% }

                                                    %>
                                                </select> <br />
                    <input type="hidden" name="patient" value="<%=patient1.getPatientid()%>"/> 
                    <button class="btn btn-danger" type="submit" id="action" name="action" value="forward">
                        <i class="icon-arrow-right icon-white"> </i> Forward 
                    </button>

                </form>
                <div class="clearfix"></div>

                <div class="btn-group" style="margin-left: 40.5%;">
                    <button class="btn update_sponsor btn-info">Sponsorship</button>

                 <!--   <button class="btn update_history btn-info">History</button>  -->
                </div> 
                <br />
                <div class="clearfix"></div>


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
                                    <% if (sp != null) {%>
                                    <select name="type">
                                        <%if (sp.getType() != null) {%>
                                        <option selected="selected" value="<%=sp.getType()%>"><%=sp.getType()%></option> 
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
                                    <% if (sp != null) {%>
                                    <select name="sponsorid">
                                        <%
                                            List sponsorList = mgr.listSponsors();
                                            for (int p = 0; p < sponsorList.size(); p++) {
                                                Sponsorship sponsor = (Sponsorship) sponsorList.get(p);
                                                if (sponsor.getSponshorshipid() == sp.getSponsorid()) {%>
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
                                    <% if (sp != null) {%>
                                    <input type="text" name="benefitplan" value="<%=sp.getBenefitplan() == null ? "" : sp.getBenefitplan()%>"/>

                                    <%}%><p class="help-inline">

                                    </p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Membership ID Number : </label>
                                <div class="controls">
                                    <% if (sp != null) {%>
                                    <input type="text" name="membershipid" value="<%=sp.getMembershipid() == null ? "" : sp.getMembershipid()%>"/>

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

            </div>

        </div>

        <%}%>                 
        <!--end static dialog-->

        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap-dropdown.js"></script>
        <script src="js/bootstrap-scrollspy.js"></script>
        <script src="js/bootstrap-collapse.js"></script>
        <script src="js/bootstrap-tooltip.js"></script>
        <script src="js/bootstrap-popover.js"></script>
        <script src="js/application.js"></script>

        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>

        <script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>
        <script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>

        <script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

        <script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
        <script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

        <script type="text/javascript" src="js/tablecloth.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/demo.js"></script>

        <!--initiate accordion-->
        <script type="text/javascript">
            $(function() {

                var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

                menu_ul.hide();

                $(".menu").fadeIn();
                $(".content1").fadeIn();
                $(".navbar").fadeIn();
                $(".footer").fadeIn();
                $(".subnav").fadeIn();
                $(".progress1").hide();

                menu_a.click(function(e) {
                    e.preventDefault();
                    if(!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });

        </script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('.example').dataTable({
                    "bJQueryUI" : true,
                    "sPaginationType" : "full_numbers",
                    "iDisplayLength" : 25,
                    "aaSorting" : [],
                    "bSort" : true

                });

                $(".patient").popover({

                    placement : 'right',
                    animation : true

                });

            });

        </script>

    </body>
</html>
