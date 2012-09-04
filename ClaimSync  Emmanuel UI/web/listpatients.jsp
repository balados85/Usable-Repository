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

            List patients = mgr.listPatients();
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
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px; " class="span9 thumbnail well content">
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
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (int r = 0; r < patients.size(); r++) {
                                            Patient patient = (Patient) patients.get(r);
                                    %>
                                    <tr>
                                        <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <%=patient.getFname()%></h5> <h5><b> Date of Birth :</b>  <%=patient.getDateofbirth()%></h5> </span>"
                                            data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%=patient.getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%=patient.getEmployer()%> </td>  </tr> 
                                            </table> "> <%=patient.getPatientid()%> </td>

                                        <td><%=patient.getFname()%></td>
                                        <td> <%=patient.getDateofbirth()%> </td>
                                        <td>
                                            <div style="display: block" id="s_<%=patient.getPatientid()%>">
                                                <select name="contype" onchange='showConType("d_<%=patient.getPatientid()%>")'>
                                                    <option>Select</option>
                                                    <%
                                                        List types = mgr.listConsultation();
                                                        for (int j = 0; j < types.size(); j++) {
                                                            Consultation unit = (Consultation) types.get(j);
                                                    %>
                                                    <option value="<%=unit.getConid()%>"><%=unit.getContype()%></option> 
                                                    <% }%>
                                                </select>
                                            </div>
                                            <div id="d_<%=patient.getPatientid()%>" style="display: none">
                                                <button class="btn user_summary_link btn-info">
                                                    <i class="icon-white icon-pencil"></i> New Visit
                                                </button>
                                            </div></td>
                                        <td>
                                            <div style="max-height: 600px; display: none" id="<%=patient.getPatientid()%>_dialog" title="Patient's Profile">

                                                <form action="action/registrationaction.jsp" method="POST" class="form-horizontal well">
                                                    <fieldset>
                                                        <div class="pre_first_half">
                                                            <div class="control-group">
                                                                <label class="control-label" for="input01">Folder No. / Patient ID </label>
                                                                <div class="controls">
                                                                    <input type="text" name="patientid"  id="input01" value="<%=patient.getPatientid()%>"/>
                                                                    <p class="help-inline">

                                                                    </p>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="first_half">
                                                            <div class="control-group">
                                                                <label class="control-label" for="input01">Full Name</label>
                                                                <div class="controls">
                                                                    <input  type="text" name="fname"  id="input01" value="<%=patient.getFname()%>"/>
                                                                    <p class="help-inline">

                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class="control-group">
                                                                <label class="control-label" for="input01">Gender</label>

                                                                <div class="controls">
                                                                    <select name="gender" id="select01">
                                                                        <!-- <option>Select</option>
                                                                         <option>Male</option>
                                                                         <option>Female</option>-->
                                                                        <%if (patient.getGender().equals("Male")) {%>
                                                                        <option selected="selected">Male</option>
                                                                        <option>Female</option>
                                                                        <%}
                                                                            if (patient.getGender().equals("Female")) {%>
                                                                        <option selected="selected">Female</option>
                                                                        <option>Male</option>
                                                                        <%}%>
                                                                    </select>
                                                                    <p class="help-inline">

                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class="control-group">
                                                                <label class="control-label" for="inputError">Date of Birth</label>
                                                                <div class="controls">
                                                                    <input name="year" class="input-mini" placeholder="1899" value="<%=patient.getDateofbirth().getYear()%>"/>
                                                                    <input name="month" class="input-mini" placeholder="12" value="<%=patient.getDateofbirth().getMonth()%>"/>
                                                                    <input name="day" class="input-mini" placeholder="31" value="<%=patient.getDateofbirth().getDay()%>"/>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="input01">Marital Status</label>
                                                                <div class="controls">
                                                                    <select name="maritalstatus" id="select01">
                                                                        <option>Select</option>
                                                                        <%if (patient.getMaritalstatus().equals("Married")) {%>
                                                                        <option selected="selected">Married</option>
                                                                        <option>Single</option>
                                                                        <option>Divorced</option>
                                                                        <%}
                                                                            if (patient.getMaritalstatus().equals("Single")) {%>
                                                                        <option>Married</option>
                                                                        <option selected="selected">Single</option>
                                                                        <option>Divorced</option>
                                                                        <%}
                                                                            if (patient.getMaritalstatus().equals("Divorced")) {%>
                                                                        <option>Married</option>

                                                                        <option>Single</option>
                                                                        <option selected="selected">Divorced</option>

                                                                        <%}%>
                                                                    </select>
                                                                    <p class="help-inline">

                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class="control-group">
                                                                <label class="control-label" for="input01">Country</label>
                                                                <div class="controls">
                                                                    <label><%=patient.getCountry()%> </label>
                                                                    <select name="country" id="select01">
                                                                        <option>Ghana</option>
                                                                        <option>Togo</option>
                                                                        <option>Benin</option>
                                                                    </select>
                                                                    <p class="help-inline">

                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="city">City</label>
                                                                <div class="controls">
                                                                    <input type="text" name="city" id="inputSuccess" value="<%=patient.getCity()%>"/>

                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="inputSuccess">Address</label>
                                                                <div class="controls">
                                                                    <textarea type="text" name="address" id="inputSuccess"><%=patient.getAddress()%></textarea>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>

                                                            <div class="control-group">
                                                                <label class="control-label" for="inputSuccess">Telephone No.</label>
                                                                <div class="controls">
                                                                    <input type="text" name="contact" id="inputSuccess" value="<%=patient.getContact()%>"/>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="inputSuccess">Next of Kin.</label>
                                                                <div class="controls">
                                                                    <input type="text" name="emergencyperson" id="inputSuccess" value="<%=patient.getEmergencyperson()%>"/>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="inputSuccess">Emergency Tel. No.</label>
                                                                <div class="controls">
                                                                    <input type="text" name="emergencycontact" id="inputSuccess" value="<%=patient.getEmergencycontact()%>"/>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="inputSuccess">Email</label>
                                                                <div class="controls">
                                                                    <input type="text" name="email" id="inputSuccess" value="<%=patient.getEmail()%>"/>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="inputSuccess">Employer</label>
                                                                <div class="controls">
                                                                    <input type="text" name="employer" id="inputSuccess" value="<%=patient.getEmployer()%>"/>
                                                                    <span class="help-inline"></span>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-actions">
                                                                <button type="submit" name ="action" value="patient" class="btn ui-primary">
                                                                    <i class="icon-ok"></i> Update Profile
                                                                </button>

                                                            </div>

                                                        </div>
                                                    </fieldset>
                                                </form>

                                            </div>
                                            <button class="btn  btn-info" id="<%=patient.getPatientid()%>_link">
                                                <i class="icon-white icon-pencil"></i> Update
                                            </button></td>
                                        <td>
                                            <form action="" method="post">
                                                <input type="hidden" id ="id_<%=patient.getPatientid()%>" value="<%=patient.getPatientid()%>"/>
                                                <button class="btn btn-danger btn-medium" onclick='deletePatient("id_<%=patient.getPatientid()%>")'>
                                                    <i class="icon-white icon-pencil"></i> Delete
                                                </button>
                                            </form></td>
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
        
            function showMembershipbox(){
                var show = document.getElementById("privateid");
                var shows = document.getElementById("nhis");
               
                show.style.display="block";
                shows.style.display="none";
                
            }
            function showInsurance(){
                var show = document.getElementById("nhis");
                var shows = document.getElementById("privateid");
               
                show.style.display="block";
                shows.style.display="none";
                
            }
            function hideIt(){
                var show = document.getElementById("privateid");
                var shows = document.getElementById("nhis");
                //if(show.style.display == "block"){
                show.style.display="none";
                //}else{
                
                //  } if(show.style.display == "none"){ 
                shows.style.display="none";
            }
            
            function showConType(id){
                var show = document.getElementById(id);
                //var shows = document.getElementById("nhis");
                //if(show.style.display == "block"){
                show.style.display="block";
                //}else{
                
                //  } if(show.style.display == "none"){ 
               // shows.style.display="none";
            }

        </script>
        <% for (int i = 0;
                    i < patients.size();
                    i++) {
                Patient vst = (Patient) patients.get(i);
        %>


        <script type="text/javascript">
   
                      
            $("#<%= vst.getPatientid()%>_dialog").dialog({
                autoOpen : false,
                width : 1000,
                modal :true

            });
    
            $("#<%= vst.getPatientid()%>_adddrug_dialog").dialog({
                autoOpen : false,
                width : 1000,
                modal :true

            });
    
   
    
            $("#<%= vst.getPatientid()%>_link").click(function(){
      
                $("#<%=vst.getPatientid()%>_dialog").dialog('open');
    
            })
  
    
            $("#<%= vst.getPatientid()%>_adddrug_link").click(function(){
                alert("");
                $("#<%=vst.getPatientid()%>_adddrug_dialog").dialog('open');
        
            })
   
    
        </script>



        <% }%>
    </body>
</html>
