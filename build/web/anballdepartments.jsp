<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page import="java.util.Random"%>
<%@page import="java.util.Random"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <%
            boolean correctDateFound = false;
            boolean singleDateValue = true;
            SimpleDateFormat dateformatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date dateUtilDate = new java.util.Date();
            java.sql.Date dateSqlDate = null;

            SimpleDateFormat rangeformatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date rangeUtilDate = new java.util.Date();
            java.sql.Date rangeSqlDate = null;

            String displayedDate = "";
            String dateValue = "";
            String dateRange = "";
            String splittedDateDuration[] = new String[2];
            String[] splittedDate = new String[3];
            String[] splittedDateRange = new String[3];

            if (request.getParameter("daterange") != null) {
                dateValue = request.getParameter("daterange");
                displayedDate = dateValue;

                if (!dateValue.isEmpty()) {
                    correctDateFound = true;
                    if (dateValue.contains("-")) {
                        singleDateValue = false;

                        splittedDateDuration = dateValue.split("-");
                        dateValue = splittedDateDuration[0];
                        dateRange = splittedDateDuration[1];

                        dateRange = dateRange.replace("/", "-");
                        splittedDateRange = dateRange.split("-");
                        dateRange = splittedDateRange[2].trim() + "-" + splittedDateRange[0].trim() + "-" + splittedDateRange[1].trim();

                        rangeUtilDate = rangeformatter.parse(dateRange);
                        rangeSqlDate = new java.sql.Date(rangeUtilDate.getTime());
                    } else {
                        singleDateValue = true;
                    }
                    dateValue = dateValue.replace("/", "-");
                    splittedDate = dateValue.split("-");
                    dateValue = splittedDate[2].trim() + "-" + splittedDate[0].trim() + "-" + splittedDate[1].trim();
                    dateUtilDate = dateformatter.parse(dateValue);
                    dateSqlDate = new java.sql.Date(dateUtilDate.getTime());
                }
            }

            System.out.print("dateValue : " + dateValue);
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
                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">
                        <form action="anballdepartments.jsp" method="post">
                            <ul style="margin-left: 0px; padding-bottom: 20px;" class="breadcrumb ">
                                <li style="margin-top: 10px;">
                                    <a>All Departments - Revenue | <%=displayedDate%></a>
                                </li>
                                <li class="pull-right" style="margin-top: 7px; margin-left: 5px;">
                                    <button class="btn btn-inverse">
                                        <i class="icon icon-white icon-search"></i> Display
                                    </button>
                                </li>
                                <li class="pull-right">
                                    <input name="daterange" placeholder="Select Date Range" style="margin-top: 8px;" id="rangeA" type="text" class="input-large"  />
                                </li>
                            </ul>
                        </form>
                        <table cellpadding="0" cellspacing="0" border="0" class="display table">
                            <thead>

                                <tr>
                                    <th>Department</th>
                                    <th>Revenue</th>
                                    <!--       <th>Sponsor</th>
                                           <th>Registered On</th>
                                           <th> </th>
                                    -->
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    HMSHelper mgr = new HMSHelper();
                                    List allPTreatments = null;
                                    List allPInvs = null;

                                    if (correctDateFound) {
                                        if (singleDateValue) {
                                            System.out.println("very single");
                                            System.out.println(" dateValue : " + dateValue);
                                            allPTreatments = mgr.listAllPatientTreatmentsForDate(dateSqlDate);
                                        } else {
                                            System.out.println("not very single");
                                            allPTreatments = mgr.listAllPatientTreatmentsForDuration(dateSqlDate, rangeSqlDate);
                                        }
                                    } else {
                                        allPTreatments = mgr.listAllPatientTreatments();
                                    }

                                System.out.println(" allPTreatments : " + allPTreatments.size());

                                    Treatment treatment;
                                    double treatmentCost, treatmentPrice, totalTreatmentCost = 0;
                                    int treatmentId, qty;
                                    for (int i = 0; i < allPTreatments.size(); i++) {
                                        Patienttreatment pT = (Patienttreatment) allPTreatments.get(i);
                                        treatmentId = pT.getTreatmentid();
                                        qty = pT.getQuantity();

                                        treatment = mgr.getTreatment(treatmentId);
                                        treatmentPrice = treatment.getPrice();
                                        treatmentCost = treatmentPrice * qty;

                                        totalTreatmentCost += treatmentCost;
                                    }

                                      if (correctDateFound) {
                                        if (singleDateValue) {
                                            System.out.println("very single");
                                            System.out.println(" dateValue : " + dateValue);
                                            allPInvs = mgr.listAllPatientInvestigationForDate(dateSqlDate);
                                        } else {
                                            System.out.println("not very single");
                                            allPInvs = mgr.listAllPatientInvestigationForDuration(dateSqlDate, rangeSqlDate);
                                        }
                                    } else {
                                         allPInvs = mgr.listAllPatientInvestigation();
                                    }
                                    
                                   
                                    System.out.println(" allPInvs : " + allPInvs.size());
                                    Investigation inv;
                                    double invCost, invPrice, totalInvCost = 0;
                                    int invId, invQty;
                                    for (int i = 0; i < allPInvs.size(); i++) {
                                        Patientinvestigation pT = (Patientinvestigation) allPInvs.get(i);
                                        invId = pT.getInvestigationid();
                                        invQty = pT.getQuantity();

                                        inv = mgr.getInvestigation(invId);
                                        invPrice = inv.getPrice();
                                        invCost = invPrice * invQty;

                                        totalInvCost += invCost;
                                    }

                                    List allVisits = mgr.listVisitations();
                                    int visitsCount = allVisits.size();
                                    double regCost = 5;
                                    double consultationCost = 15;
                                    double specialistConsultation = 35;

                                    Random registration = new Random();
                                    int regNum = registration.nextInt(visitsCount);
                                    regNum += 50;
                                    double totalRegCost = regCost * regNum;

                                    Random speccons = new Random();
                                    int specConsNum = speccons.nextInt(visitsCount);
                                    specConsNum += 50;
                                    double totalSpecCost = specialistConsultation * specConsNum;

                                    double totalConst = visitsCount * consultationCost;

                                %>
                                <tr>
                                    <td>OPD / Registration </td> <td><%=totalRegCost%></td>
                                </tr>
                                <tr>
                                    <td>Consultation </td> <td><%=totalConst%></td>
                                </tr>
                                <tr>
                                    <td>Specialist Consultation </td> <td><%=totalSpecCost%></td>
                                </tr>
                                <tr>
                                    <td>Pharmacy </td> <td><%=totalTreatmentCost%></td>
                                </tr>
                                <tr>
                                    <td>Laboratory </td> <td><%=totalInvCost%></td>
                                </tr>

                            </tbody>
                        </table>
                    </div> 

                    <div class="clear"></div>



                </div>

            </section>

            <%@include file="widgets/footer.jsp" %>

        </div><!-- /container -->



        <%@include file="widgets/javascripts.jsp" %>
        <script type="text/javascript">
                   
            $("#rangeA").daterangepicker();

        </script>



    </body>
</html>



</body>
</html>
