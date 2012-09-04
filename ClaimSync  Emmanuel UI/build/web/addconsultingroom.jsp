<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="helper.HibernateUtil"%>
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
        <script type="text/javascript">
            function submitform(){
                 
                 var t =  validateForm();
            
               if(t){
                var name = document.getElementById("name").value;
                
                // alert(name);
                $.post('action/conroomaction.jsp', { action : "consulting", name : name}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );}else{
                alert("Consulting room cannot be empty");
                }
            }
            
            function updateUnit(id,name){
             var t =  validateForm();
               if(t){
                var uname = document.getElementById(name).value;
                var uid = document.getElementById(id).value;
                
                $.post('action/conroomaction.jsp', { action : "edit", uname : uname, uid : uid}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );}else{
                alert("Consulting room cannot be empty");
                }
            }
            
            function deleteUnit(id){
                var id = document.getElementById(id).value;
                // var roledescription = document.getElementById("roledescription").value;
                var con = confirm("Are You Sure You Want To Delete This Item");
                if (con ==true)
                {
                    $.post('action/conroomaction.jsp', { action : "delete", id : id}, function(data) {
                        alert(data);
                        $('#results').html(data).hide().slideDown('slow');
                    } );
                }
                else 
                {
                    alert("Delete Was Cancelled!");
                    //return;
                }
                
            }
        </script>
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
                            <a href="#">Inventory</a><span class="divider"></span>
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

                    <%

                        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

                        HMSHelper mgr = new HMSHelper();

                        List itmss = mgr.listConRooms();
                    %>     
                    <%@include file="widgets/leftsidebar.jsp" %>
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">
                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <h4>Add New Consultation Room</h4>
                                    <br/>
                                    <a> <i class="icon-tasks"></i>Complete The Fields Below To Add A New Consultation room</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="dialog_link">

                                        <i class="icon-tasks"></i>Show Consultation Rooms
                                    </a>

                                </li>

                            </ul>

                            <form action="" method="post" onsubmit="return validateForm();" name="items" >

                                <fieldset>

                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Consultation Room Name: </label>
                                        <div class="controls">
                                            <input type="text" name="name" id="name">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>

                                    <div class="form-actions">

                                        <button class="btn btn-danger btn-large"  onclick='submitform();return false;'>
                                            <i class="icon-arrow-right icon-white"> </i> Add Consultation Room 
                                        </button>

                                    </div>
                                </fieldset>
                            </form>

                        </div>

                    </div>
                    <div class="clearfix"></div>

                </div>
                <div style="display: none;" id="dialog" title="List of All Units">
                    <table class="example display">
                        <thead>
                            <tr>
                                <th>
                                    Unit Name 
                                </th>
                                <th></th><th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < itmss.size(); i++) {
                                    Consultingrooms unit = (Consultingrooms) itmss.get(i);
                            %>
                            <tr>
                                <td>
                                    <%=unit.getConsultingroom()%>
                                </td>

                                <td>
                                    <button class="btn btn-group btn-medium" id="<%=unit.getConsultingroomid()%>_link">
                                        <i class="icon-arrow-right icon-white"> </i> Edit 
                                    </button>
                                    <div style="display: none;" id="<%=unit.getConsultingroomid()%>_dialog" title="Editting <%=unit.getConsultingroom()%>">
                                        <form action="action/unitaction.jsp" method="post" onsubmit="return validateForm();" name="edit">
                                            <div class="control-group">
                                                <label class="control-label" for="input01"> Consultation Room Name: </label>
                                                <div class="controls">
                                                    <input type="text" name="uname" id="nameunit_<%=unit.getConsultingroomid()%>" value="<%=unit.getConsultingroom()%>">
                                                    <input type="hidden" name="uid" id="unitid_<%=unit.getConsultingroomid()%>" value="<%=unit.getConsultingroomid()%>">
                                                    <p class="help-block"></p>
                                                </div>
                                            </div>

                                            <div class="form-actions">

                                                <button class="btn btn-danger btn-large" onclick='updateUnit("unitid_<%=unit.getConsultingroomid()%>","nameunit_<%=unit.getConsultingroomid()%>");return false;'>
                                                    <i class="icon-arrow-right icon-white"> </i> Update Consulting Room 
                                                </button>

                                            </div>

                                        </form> 
                                    </div>
                                </td>

                                <td>
                                    <form action="action/unitaction.jsp" method="post">
                                        <input type="hidden" id="id_<%=unit.getConsultingroomid()%>" value="<%=unit.getConsultingroomid()%>"/> 

                                        <button class="btn btn-danger btn-medium" type="submit" name="action" value="units" onclick='deleteUnit("id_<%=unit.getConsultingroomid()%>");return false;'>
                                            <i class="icon-arrow-right icon-white"> </i> Delete  
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                </div>

            </section>

            <footer style="display: none; margin-top: 50px;" class="footer">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>

        </div><!-- /container -->    

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
    
     function validateForm()
    {
        var x=document.forms["items"]["name"].value;
        if (x==null || x=="")
        {
           // alert("Item must be filled out");
            return false;
        }
        var x=document.forms["edit"]["uname"].value;
        if (x==null || x=="")
        {
           // alert("Item must be filled out");
            return false;
        }
        
        return true;
    }


    function todaysdate()
    {
        var currentDate = new Date()
        var day = currentDate.getDate()
        var month = currentDate.getMonth() + 1
        var year = currentDate.getFullYear()
        var dat=(" " + year + "-" + month + "-" + day )
        //document.write(dat)
        // alert("Todays Date is "+dat)
        return dat; 
   
 
    }
</script>
<% for (int i = 0;
            i < itmss.size();
            i++) {
        Consultingrooms vst = (Consultingrooms) itmss.get(i);
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getConsultingroomid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getConsultingroomid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getConsultingroomid()%>_link").click(function(){
      
        $("#<%=vst.getConsultingroomid()%>_dialog").dialog('open');
    
    })
  
    
    $("#<%= vst.getConsultingroomid()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getConsultingroomid()%>_adddrug_dialog").dialog('open');
        
    })
   
    
</script>

<% }%>
</body>
</html>