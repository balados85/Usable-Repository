<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <%
            HMSHelper mgr = new HMSHelper();
            Patient singleton = (Patient) session.getAttribute("patient");

            Sponsorhipdetails sponsorDetail = mgr.sponsorshipDetails(singleton.getPatientid());
            if (sponsorDetail == null) {
                response.sendRedirect("redirect.jsp?page=register");
            }
            session.setAttribute("details", sponsorDetail);
        %>
        <%@include file="widgets/stylesheets.jsp" %>
        <%@include file="widgets/javascripts.jsp" %>
        <script type="text/javascript">
            function updateView() {
                
                var str = document.getElementById("unitid").value;

                if (str=="")
                {
                    document.getElementById("tt").innerHTML="";
                    return;
                } 
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {// code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    { 
                        if(xmlhttp.responseText > 0){
                            alert("successful")
                        }else{
                            alert("successful")
                        }
                       
                    }
                }
                xmlhttp.open("GET","action/forward.jsp?action=forward.jsp&unitid="+str,true);
                xmlhttp.send();
            
            }
       	
           
        </script>
    </head>
    <body>

        <%@include file="widgets/header.jsp" %>


        <section id="middle">
            <div id="container-main">
                <div id="container">
                    <div id="content">



                        <div class="speedbar">
                            <div class="speedbar-nav"> <a href="#">Claimsync Panel</a> &rsaquo; <a href="#">Dashboard</a></div> 

                            <div class="search">
                                <form>
                                    <input type="text">
                                </form>   
                            </div>
                        </div>
                        <div class="grid-1">
                            <div class="title-grid">Visiting Sheet </div>
                            <div class="content-gird typography-heading">
                                <table>
                                    <tr>
                                        <td>
                                            <h1>Sponsorship Details</h1>
                                            <hr/>
                                            <h4>Sponsorship Type: <%=sponsorDetail.getType()%></h4>
                                            <h4>Sponsors: <%= mgr.getSponsor(sponsorDetail.getSponsorid()).getSponsorname()%></h4>
                                            <h4>Membership ID: <%=sponsorDetail.getMembershipid()%></h4>
                                            <h4>Benefit Plan: <%=sponsorDetail.getBenefitplan()%></h4>

                                            <form action="action/forwardaction.jsp" method="post">
                                                <h3>Forward Folder!</h3>
                                                <select name="unitid" onchange="updateView()">
                                                    <%
                                                        List units = mgr.listUnits();
                                                     
                                                        for (int i = 0; i < units.size(); i++) {
                                                            Units unit = (Units) units.get(i);
                                                    %>
                                                    <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                                                    <% }

                                                    %>
                                                </select><br/>
                                              
                                                <input type="submit" id="action" name="action" value="forward"/>
                                            </form>

                                        </td>
                                        <td>
                                            <form action="action/sponsorupdate.jsp" method="post">

                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label>Sponsorship Type</label>
                                                        </td>
                                                        <td>
                                                            <select name="type">
                                                                <%if(sponsorDetail.getType() != null){%>
                                                                <option selected="selected" value="<%=sponsorDetail.getType()%>"><%=sponsorDetail.getType()%></option> 
                                                                 <%}%>
                                                                <option value="nhis">NHIS</option>
                                                                <option value="cash">CASH</option>
                                                                <option value="private">Private Health Insurance</option>
                                                                <option value="cooperate">Cooperate</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>Sponsors</label>
                                                        </td>
                                                        <td>
                                                            <select name="sponsorid">
                                                                <%
                                                                    List Sponsors = mgr.listSponsors();
                                                                    for (int i = 0; i < Sponsors.size(); i++) {
                                                                        Sponsorship sponsor = (Sponsorship) Sponsors.get(i);
                                                                        if(sponsor.getSponshorshipid()== sponsorDetail.getSponsorid()){%>
                                                                            <option selected="selected" value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option> 
                                                                       <% }
                                                                %>
                                                                <option value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option> 
                                                                <% }

                                                                %>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>Benefit Plan : </label> 
                                                        </td>
                                                        <td>
                                                            <input type="text" name="benefitplan" value="<%=sponsorDetail.getBenefitplan() == null ? "" : sponsorDetail.getBenefitplan()%>"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>Membership ID Number : </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="membershipid" value="<%=sponsorDetail.getMembershipid() == null ? "" : sponsorDetail.getMembershipid()%>"/>
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td>
                                                            <input type="hidden" name="patientid" value="<%=singleton.getPatientid()%>"/>
                                                         
                                                        </td>
                                                        <td>
                                                            <input type="submit" id="action" name="action" value="update"/>
                                                        </td>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>


                            </div>
                        </div> 


                        <!-- Information data -->
                        <div class="information-data">
                            <div class="date">
                                <p class="date-figures">935</p>
                                <div class="headway-2"><div class="advance-2" style="width:80%;"></div></div>
                                <p class="date-title">Visits Per Week</p>
                            </div>
                            <div class="date">
                                <p class="date-figures">35%</p>
                                <div class="headway-2"><div class="advance-2" style="width:35%;"></div></div>
                                <p class="date-title">Today's Visits</p>
                            </div>
                            <div class="date">
                                <p class="date-figures">165</p>
                                <div class="headway-2"><div class="advance-2" style="width:60%;"></div></div>
                                <p class="date-title">Patients Per Week</p>
                            </div>
                            <div class="date">
                                <p class="date-figures">95%</p>
                                <div class="headway-2"><div class="advance-2" style="width:95%;"></div></div>
                                <p class="date-title">Patients Per Day</p>
                            </div>
                            <div class="date">
                                <p class="date-figures">1245</p>
                                <div class="headway-2"><div class="advance-2" style="width:92%;"></div></div>
                                <p class="date-title">Number of Staff</p>
                            </div>

                        </div>
                        <!-- Information data end -->
                        <!--  <div class="grid-2">
                              <div class="title-grid">Calendar</div>
                              <div class="content-gird">
                                  <div id="calendar"></div>
                              </div>
                          </div>  -->





                        <div class="clear"></div>

                    </div><!-- #content-->
                </div><!-- #container--> 
                <!-- #sideLeft -->
                <%@include file="widgets/leftsidebar.jsp" %>
                <!-- #sideLeft -->

            </div>
            <!-- #container main-->


            <!-- #footer -->
            <%@include file="widgets/footer.jsp" %>
            <!-- #footer -->
        </section><!-- #middle-->


        <div class="clear"></div>



    </body>
</html>



</body>
</html>
