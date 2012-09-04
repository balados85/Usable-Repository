<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
        <%
            HMSHelper mgr = new HMSHelper();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();
            List visits = mgr.listRecentVisits(dateFormat.format(date));
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
                    <a class="brand" href="#"><img src="images/logo.png" width="200px;" /></a>

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


                
                    <%if (session.getAttribute("lasterror") != null) {%>
                    
                    <div class="alert alert-danger">
                    <%=session.getAttribute("lasterror")%> 
                     </div>
                    <%
                            session.removeAttribute("lasterror");
                        }%>
               


                <div class="row">


                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <a> <i class="icon-home"></i> Front Desk</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="listpatients.jsp">List Patients</a><br/>

                                </li>
                            </ul>

                            <div style="margin-top: 20px;" class="clearfix"></div>
                            <br />
                            <br />

                            <a href="#">
                                <div class="span3  center  well large_button dialog_link">
                                    New Registration
                                </div> </a>
                            <a href="#">
                                <div class="dialog_link2 span3 offset1 center  well large_button">
                                    Find Patient
                                </div> </a>

                            <div class="clearfix"></div>
                            <br />
                            <br />
                            <br />

                            <div class="clearfix"></div>
                            <a href="recentpatients.jsp">
                                <div class="span3 center well large_button">
                                    <%if (visits != null) {%>
                                    Today's Visits (<%=visits.size()%>)
                                    <%} else {%> No Visits Today<%}%>
                                </div> </a>
                            <a href="#">
                                <div class="span3 offset1  center well large_button">
                                    Appointments
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

        <div style="max-height: 600px; display: none" id="dialog" title="New Regitration">

            <form enctype="multipart/data"action="action/registrationaction.jsp" method="POST" class="form-horizontal well">
                <fieldset>
                    <div style="float: left;" class="pre_first_half">
                        <div class="control-group">
                            <label class="control-label" for="input01">Folder No. / Patient ID </label>
                            <div class="controls">
                                <%String yr = "" + Calendar.getInstance().get(Calendar.YEAR);
                                    String y = yr.substring(2);
                                %>
                                <input type="text" name="patientid" readonly="readonly" id="input01" value="<%=(y + "DC" + (mgr.listPatients().size() + 1))%>"/>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>


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
                            <label class="control-label" for="input01">Other Names</label>
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
                                <select class="input-mini"  name="day">
                                    <option>D</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>

                                <select class="input-mini" name="month">
                                    <option>M</option>
                                    <option value="01">Jan</option>
                                    <option value="02">Feb</option>
                                    <option value="03">Mar</option>
                                    <option value="04">Apr</option>
                                    <option value="05">May</option>
                                    <option value="06">Jun</option>
                                    <option value="07">Jul</option>
                                    <option value="08">Aug</option>
                                    <option value="09">Sep</option>
                                    <option value="10">Oct</option>
                                    <option value="11">Nov</option>
                                    <option value="12">Dec</option>
                                </select>



                                <select class="input-small"  name="year">
                                    <option>Y</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                    <option value="1958">1958</option>
                                    <option value="1957">1957</option>
                                    <option value="1956">1956</option>
                                    <option value="1955">1955</option>
                                    <option value="1954">1954</option>
                                    <option value="1953">1953</option>
                                    <option value="1952">1952</option>
                                    <option value="1951">1951</option>
                                    <option value="1950">1950</option>
                                    <option value="1949">1949</option>
                                    <option value="1948">1948</option>
                                    <option value="1947">1947</option>
                                    <option value="1946">1946</option>
                                    <option value="1945">1945</option>
                                    <option value="1944">1944</option>
                                    <option value="1943">1943</option>
                                    <option value="1942">1942</option>
                                    <option value="1941">1941</option>
                                    <option value="1940">1940</option>
                                    <option value="1939">1939</option>
                                    <option value="1938">1938</option>
                                    <option value="1937">1937</option>
                                    <option value="1936">1936</option>
                                    <option value="1935">1935</option>
                                    <option value="1934">1934</option>
                                    <option value="1933">1933</option>
                                    <option value="1932">1932</option>
                                    <option value="1931">1931</option>
                                    <option value="1930">1930</option>
                                    <option value="1929">1929</option>
                                    <option value="1928">1928</option>
                                    <option value="1927">1927</option>
                                    <option value="1926">1926</option>
                                    <option value="1925">1925</option>
                                    <option value="1924">1924</option>
                                    <option value="1923">1923</option>
                                    <option value="1922">1922</option>
                                    <option value="1921">1921</option>
                                    <option value="1920">1920</option>
                                    <option value="1919">1919</option>
                                    <option value="1918">1918</option>
                                    <option value="1917">1917</option>
                                    <option value="1916">1916</option>
                                    <option value="1915">1915</option>
                                    <option value="1914">1914</option>
                                    <option value="1913">1913</option>
                                    <option value="1912">1912</option>
                                    <option value="1911">1911</option>
                                    <option value="1910">1910</option>
                                    <option value="1909">1909</option>
                                    <option value="1908">1908</option>
                                    <option value="1907">1907</option>
                                    <option value="1906">1906</option>
                                    <option value="1905">1905</option>
                                    <option value="1904">1904</option>
                                    <option value="1903">1903</option>
                                    <option value="1902">1902</option>
                                    <option value="1901">1901</option>
                                    <option value="1900">1900</option>
                                </select>

                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="input01">Marital Status</label>
                            <div class="controls">
                                <select name="maritalstatus" id="select01">
                                    <option>Married</option>
                                    <option>Single</option>
                                    <option>Divorced</option>
                                </select>
                                <p class="help-inline">

                                </p>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="input01">Country</label>
                            <div class="controls">
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
                                <input type="text" name="city" id="inputSuccess"/>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                    </div>
                    <div  style="float: left;" class="second">            

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
                        <!-- <div class="control-group">
                             <label class="control-label" for="inputSuccess">Upload Image</label>
                             <div class="controls">
                                 <input type="file" name="imglocation" id="inputSuccess"/>
                                 <span class="help-inline"></span>
                             </div>
                         </div>-->


                        <div class="control-group">
                            <label class="control-label" for="selectError">Sponsorship Method</label>
                            <div class="controls">
                                <select id="payment" name="type">
                                    <option >Select</option>
                                    <option id="nhis" value="NHIS" onclick="showInsurance()">National Health Insurance</option>
                                    <option id="cash" value="CASH" onclick="hideIt()">Out of Pocket </option>
                                    <option id="private"value="Private" onclick="showMembershipbox()">Private Health Insurance</option>
                                    <option id="corporate" value="Cooperate" onclick="showCorporate()">Cooperate</option>
                                </select>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div style="display:none;" id="companydiv">
                            <div class="control-group">
                                <label class="control-label" >Company</label>
                                <div class="controls">


                                    <select name="coperate">
                                        <option>Select</option>
                                        <%

                                            List companies = mgr.listCooperateInsurers();
                                            for (int i = 0; i < companies.size(); i++) {
                                                Sponsorship sponsor = (Sponsorship) companies.get(i);
                                        %>
                                        <option value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option>
                                        <% }

                                        %>

                                    </select>

                                    <span class="help-inline"></span>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" >Corporate ID</label>
                                <div class="controls">
                                    <input type="text" id="inputSuccess" name="coperateid" for="inputSuccess" value=""/>
                                    <span class="help-inline"></span>
                                </div>
                            </div>
                        </div>
                        <div style="display:none;" id="privatediv">
                            <div class="control-group">
                                <label class="control-label" for="selectError">Sponsors</label>
                                <div class="controls">
                                    <select name="sponsorid">
                                        <option value="0">Select</option>
                                        <%

                                            List Sponsors = mgr.listPrivateSponsors();
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
                                    <input type="text" id="inputSuccess"name="membershipid" for="inputSuccess" value=""/>
                                    <span class="help-inline"></span>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" >Benefit Plan</label>
                                <div class="controls">
                                    <input type="text" id="inputSuccess" name="benefitplan" for="inputSuccess" value=""/>
                                    <span class="help-inline"></span>
                                </div>
                            </div>
                        </div>
                        <div style="display:none;" id="nhisdiv">
                            <div class="control-group">
                                <label class="control-label" >Membership ID</label>
                                <div class="controls">
                                    <input type="text" id="inputSuccess"name="nhismembershipid" for="inputSuccess" value=""/>
                                    <span class="help-inline"></span>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >Consultation Type</label>
                            <div class="controls">
                                <select name="contype">
                                    <option value="0">Select</option>
                                    <%
                                        List types = mgr.listConsultation();
                                        for (int j = 0; j < types.size(); j++) {
                                            Consultation unit = (Consultation) types.get(j);
                                    %>
                                    <option value="<%=unit.getConid()%>"><%=unit.getContype()%></option> 
                                    <% }%>
                                </select></div>
                        </div>
                    </div>
                </fieldset>
                <div style="text-align: center;">
                    <button type="submit" name ="action" value="patient" class="btn btn-danger btn-large">
                        <i class="icon-ok icon-white"></i> Save changes
                    </button>

                </div>

            </form>
        </div>

    </div>

    <div style="display: none;" id="dialog2" title="Patient Search">

        <form class="form-horizontal" action="searchresults.jsp" method="post">
            <fieldset>
                <div class="control-group center">
                    <h3> Search By </h3>
                    <br />

                    <select name="searchid">
                        <option value="patientid">Patient ID/Folder No.</option>
                        <option value="fullname">Patient First or Last Names</option>
                        <option value="memberdshipnumber">Policy No.</option>
                        <option value="dob">Date of Birth(0000-00-00)</option>
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
        
        $("#payment").change(function() {
          
            var payment =  $('#payment option:selected').attr('id');
            
            if(payment=='nhis'){
                $("#companydiv").slideUp();
                $("#privatediv").slideUp();
                $("#nhisdiv").slideDown();
                
            }else if(payment=='cash'){
                $("#companydiv").slideUp();
                $("#privatediv").slideUp();
                $("#nhisdiv").slideUp();
                
            }else if(payment=='private'){
                $("#companydiv").slideUp();
                $("#privatediv").slideDown();
                $("#nhisdiv").slideUp();
            
            }else if(payment=='corporate'){
                $("#companydiv").slideDown();
                $("#privatediv").slideUp();
                $("#nhisdiv").slideUp();
            }
            else{
                alert("Please Select Payment Method");
            }
        });
               
               
               
           
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
            
            
            
            
            
        function showMembershipbox(){
                           var show = document.getElementById("privateid");
                           var shows = document.getElementById("nhis");
                          
                           show.style.display="block";
                           shows.style.display="none";
                       
                   }
        
         function showCorporate(){
                           var show = document.getElementById("privateid");
                           var shows = document.getElementById("nhis");
                          
                           show.style.display="none";
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
                           
                         //  } if(show.style.display == "none"){ 
                            shows.style.display="none";
                   }    
      
    </script>

</body>
</html>
