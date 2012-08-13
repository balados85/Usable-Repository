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
            String searchid = request.getParameter("searchid") == null ? "" : request.getParameter("searchid");
            String searchquery = request.getParameter("searchquery") == null ? "" : request.getParameter("searchquery");
            System.out.println(searchid);
            System.out.println(searchquery);
            Patient p = null;
            try {
                if (searchid.equalsIgnoreCase("memberdshipnumber")) {
                    Sponsorhipdetails spd = mgr.getSearchedSpID(searchquery.trim());
                    p = mgr.getPatientByID(spd.getPatientid());
                }
                if (searchid.equalsIgnoreCase("fullname")) {
                    String fname = searchid.split(" ")[0];
                    String lname = searchid.split(" ")[1];
                    p = mgr.getPatientByName(fname, lname);
                }
                if (searchid.equalsIgnoreCase("patientid")) {
                    p = mgr.getPatientByID(searchquery.trim());
                }
            } catch (NullPointerException e) {
                session.setAttribute("lasterror", "Patient does not exist! Register Patient");
                response.sendRedirect("index.jsp");
                return;
            }


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
                background-color: #FBFBFB;
                background-image: -moz-linear-gradient(center top , #FFFFFF, #F5F5F5);
                background-repeat: repeat-x;
                border: 1px solid #DDDDDD;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 0 #FFFFFF inset;
                list-style: none outside none;
                font-weight: lighter;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 36px;
                /* padding: 7px 14px; */
            }

            .large_button:hover {
                background-color: #35AFE3;
                background-image: -moz-linear-gradient(center top , #45C7EB, #2698DB);
                box-shadow: 0 1px 0 0 #6AD2EF inset;
                color: #FFFFFF;
                text-decoration: none;
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
                            <a href="#">Home</a><span class="divider"></span>
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
                 

                    <div style="display: none;" class="span9 offset3 thumbnail well content1 hide">

                        <ul style="margin-left: 0px;" class="breadcrumb ">
                            <li>
                                <a>Search Result for {Query} </a>
                            </li>
                        </ul>

                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>
                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Sponsor</th>
                                    <th>Date of Birth</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>

                                <tr class="odd gradeX">
                                    <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <b><%= p.getLname()%> </b>,  <%= p.getFname()%>  </h5> <h5><b> Date of Birth :</b> <%= p.getDateofbirth()%></h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%= p.getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%= p.getEmployer()%>  </td>  </tr> <tr> <td> Sponsor </td> <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(p.getPatientid()).getSponsorid()).getSponsorname()%> </td> </tr>
                                        </table>"><a class="patientid"><%= p.getPatientid()%></a></td><td><b><%= p.getLname()%> </b>,  <%= p.getFname()%> <td><%= mgr.sponsorshipDetails(p.getPatientid()).getType()%></td><td>  <%= p.getDateofbirth()%> </td>
                                    <td><a  id="patientidlink"  class="btn btn-info"> <i class="icon-pencil icon-white"> </i> New Visit </a></td>
                                </tr>

                            </tbody>
                        </table>

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

        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="usersummary hide" id="<%= p.getPatientid()%>"  title="Patient Information">
            <div class="well thumbnail">
                <ul style="margin-left: 0px;" class="breadcrumb">
                    <li>
                        <span class="divider"></span> Folder No: <%= p.getPatientid()%>
                    </li>
                </ul>

                <div style="margin-top: 12px; padding-top: 5px;  padding-bottom: 5px; text-align: center;" class="thumbnail span2">
                    <img src="images/default_profile.png" />

                </div>

                <table class="table span3 right table table-bordered table-condensed">
                    <tr>
                        <td> First Name</td>

                        <td><b> <%= p.getFname()%></b></td>
                    </tr>
                    <tr>
                        <td> Last Name</td>

                        <td><b> <%= p.getLname()%> </b></td>
                    </tr>
                    <tr>
                        <td> Gender </td>

                        <td><b> <%=p.getGender()%></b></td>
                    </tr>

                    <tr>
                        <td> Employer </td>

                        <td><b> <%= p.getEmployer()%></b></td>
                    </tr>

                </table>

                <div class="clearfix"></div>
                <br />
                <div class="clearfix"></div>

                <hr />


                <form class="span3" style="text-align: center; margin-left: 25%; "  action="action/forwardaction.jsp" method="post">
                    Send <b><%= p.getFname()%> <%= p.getLname()%></b> to;
                    <select name="unitid" onchange="updateView()">
                        <%
                            List units = mgr.listUnits();

                            for (int x = 0; x < units.size(); x++) {
                                Units unit = (Units) units.get(x);
                        %>
                        <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option>
                        <% }

                        %>
                    </select>
                    <br />
                    <input type="hidden" name="patient" value="<%=p.getPatientid()%>"/>
                    <button class="btn btn-danger" type="submit" id="action" name="action" value="forward">
                        <i class="icon-arrow-right icon-white"> </i> Forward
                    </button>

                </form>
                <div class="clearfix"></div>

                <div class="btn-group" style="margin-left: 40%;">
                    <button class="btn update_sponsor btn-info">
                        Sponsorship
                    </button>


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
                                    <% Sponsorhipdetails sponsorhipdetails = mgr.sponsorshipDetails(p.getPatientid());%>
                                    <% if (sponsorhipdetails != null) {%>
                                    <select name="type">
                                        <%if (sponsorhipdetails.getType() != null) {%>
                                        <option selected="selected" value="<%=sponsorhipdetails.getType()%>"><%=sponsorhipdetails.getType()%></option>
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
                                    <% if (sponsorhipdetails != null) {%>
                                    <select name="sponsorid">
                                        <%
                                            List sponsorList = mgr.listSponsors();
                                            for (int i = 0; i < sponsorList.size(); i++) {
                                                Sponsorship sponsor = (Sponsorship) sponsorList.get(i);
                                                if (sponsor.getSponshorshipid() == sponsorhipdetails.getSponsorid()) {%>
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
                                    <% if (sponsorhipdetails != null) {%>
                                    <input type="text" name="benefitplan" value="<%=sponsorhipdetails.getBenefitplan() == null ? "" : sponsorhipdetails.getBenefitplan()%>"/>

                                    <%}%><p class="help-inline">

                                    </p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Membership ID Number : </label>
                                <div class="controls">
                                    <% if (sponsorhipdetails != null) {%>
                                    <input type="text" name="membershipid" value="<%=sponsorhipdetails.getMembershipid() == null ? "" : sponsorhipdetails.getMembershipid()%>"/>

                                    <input type="hidden" name="patientid" value="<%= p.getPatientid()%>"/>
                                    <%}%><p class="help-inline">

                                    </p>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn" id="action" name="action" value="update">
                                    <i class="icon-edit "> </i> Update Details
                                </button>
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
                        <% List visits = mgr.patientHistory(p.getPatientid());%>
                        <tbody>
                            <%for (int r = 0; r < visits.size(); r++) {
                                    Visitationtable vs = (Visitationtable) visits.get(r);
                            %>
                            <tr>
                                <td class="patient_visit" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Visit Summary </h3> <h5><%=p.getFname()%> <%=p.getFname()%></h5> <h5> <%=p.getDateofbirth()%> </h5> <span>"
                                    data-content="<table class='table table-bordered'> <tr> <td> <%=vs.getStatus()%></td> <td> <%=vs.getDate()%> </td> </tr>  <tr> <%=vs.getStatus()%></td> <td> <%=vs.getDate()%>  </td> </tr>  <tr> <td>  <%=vs.getStatus()%></td> <td> <%=vs.getDate()%>  </td> </tr> <tr>
                                    </table> "> <%=vs.getDate()%> </td>
                                <td><%=vs.getStatus()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

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
        <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {

                $('.example').dataTable({
                    "bJQueryUI" : true,
                    "sScrollY" : "300px",
                    "sPaginationType" : "full_numbers",
                    "iDisplayLength" : 25,
                    "aaSorting" : [],
                    "bSort" : true

                });

                $(".patient").popover({

                    placement : 'right',
                    animation : true

                });

                $(".patient_visit").popover({

                    placement : 'top',
                    animation : true

                });

            });

        </script>

    </body>
</html>
