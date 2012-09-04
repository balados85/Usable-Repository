<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
        <%
            HMSHelper mgr = new HMSHelper();
        %>
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
                   
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <a> <i class="icon-home"></i> Front Desk</a><br/>
                                    <%if(session.getAttribute("lasterror") != null){ %>
                                    <h3><a> <%=session.getAttribute("lasterror")%> </a></h3>
                                    <%
                                    session.removeAttribute("lasterror");
                                    }%>
                                </li>
                            </ul>

                            <div style="margin-top: 20px;" class="clearfix"></div>
                            <br />
                            <br />

                            <a href="#">
                                <div class="span3  center  well large_button dialog_link">
                                    New Staff
                                </div> </a>
                            <a href="#">
                                <div class="dialog_link2 span3 offset1 center  well large_button">
                                    Find Staff
                                </div> </a>

                            <div class="clearfix"></div>
                            <br />
                            <br />
                            <br />

                            <div class="clearfix"></div>
                            <a href="recentpatients.jsp">
                                <div class="span3 center well large_button">
                                    List All Staff
                                </div> </a>
                            <a href="#">
                                <div class="span3 offset1  center well large_button">
                                    Rooster/Schedule
                                </div> </a>

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

        <div style="max-height: 600px; y-overflow; display: none" id="dialog" title="New Regitration">

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
                                <input name="year" class="input-mini"/>
                                <input name="month" class="input-mini"/>
                                <input name="day" class="input-mini"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>
                       <!-- <div class="form-actions first">
                            <button type="button" class="btn ui-primary continue">
                                <i class="icon-ok"></i> Continue
                            </button>
                            <button type="button" class="btn btn-inverse close_dialog">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>

                        </div>

                    </div>-->
                    <!--<div class="second_half" style="display: none;">-->
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

                      <!--  <div class="form-actions second">
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
                   <!-- </div>

                  <!--  <div style="display: none;" class="third_half">-->

                        <div class="control-group">
                            <label class="control-label" for="selectError">Sponsorship Method</label>
                            <div class="controls">
                                <select name="type">
                                    <option value="nhis">National Health Insurance</option>
                                    <option value="cash">Out of Pocket </option>
                                    <option value="private">Private Health Insurance</option>
                                    <option value="cooperate">Corporate</option>
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
                            <label class="control-label" >Membership ID</label>
                            <div class="controls">
                                <input type="text" id="inputSuccess"name="membershipid" for="inputSuccess" value="NA"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" >Benefit Plan</label>
                            <div class="controls">
                                <input type="text" id="inputSuccess" name="benefitplan" for="inputSuccess" value="NA"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="submit" name ="action" value="patient" class="btn ui-primary ">
                                <i class="icon-ok"></i> Save changes
                            </button>
                           <!-- <button type="button" class="btn btn-info previous">
                                <i class="icon-arrow-left icon-white"></i> Previous
                            </button>
                            <button type="button" class="btn btn-inverse close_dialog">
                                <i class="icon-off icon-white"></i> Cancel
                            </button>-->

                        </div>

                    </div>
                </fieldset>
            </form>

        </div>

        <div style="display: none;" id="dialog2" title="Patient Search">

            <form class="form-horizontal" action="searchresults.jsp" method="post">
                <fieldset>
                    <div class="control-group center">
                        <h3> Search By </h3>
                        <br />

                        <select name="searchid">
                            <option value="patientid">Patient ID/Folder No.</option>
                            <option value="fullname">Patient Name</option>
                            <option value="memberdshipnumber">Policy No.</option>

                        </select>

                    </div>

                    <hr />

                    <div class="clearfix"></div>
                    <div class="center">

                        <input type="text" placeholder="Please enter search query" class="input-xlarge"  name="searchquery"/>

                        <br />
                        <br />
                        <br />

                        <input class="btn btn-large" type="submit" value="search" name="action"/>
                    </div>

                </fieldset>
            </form>

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

    </body>
</html>
