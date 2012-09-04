<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


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
                        <form action="anballsponsorsrevenues.jsp" method="post">
                            <ul style="margin-left: 0px; padding-bottom: 20px;"  class="breadcrumb ">
                                <li style="margin-top: 10px;">
                                    <a>Revenue From Sponsors | <%=displayedDate %></a>
                                </li>
                                <li class="pull-right" style="margin-top: 0px; margin-left: 5px;">
                                    <button type="submit" class="btn btn-inverse">
                                        <i class="icon icon-white icon-search"></i> Display
                                    </button>
                                </li>
                                <li class="pull-right" >
                                    <input name="daterange" placeholder="Select Date Range"  id="rangeA" type="text" class="input-large"  />
                                </li>
                            </ul>
                        </form>
                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>
                                <tr>
                                    <th>Sponsor </th>
                                    <th>Revenue </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    int regConsultation = 20;
                                    double patientConsultation = 0;
                                    HMSHelper mgr = new HMSHelper();

                                    List sponsors = mgr.listSponsors();
                                    Sponsorship sponsor;
                                    double sponsorTotal = 0;
                                    int sponsorId = 0;

                                    Sponsorhipdetails sponsorshipDetails;
                                    Sponsorhipdetails sponDetail;
                                    //       List visits = mgr.listVisitations();
                                    List patients = mgr.listPatients();
                                    List patientVisits = null;
                                    int patientVisitsNum;
                                    String patientId;
                                    String patientName;
                                    String sponsorName = "";

                                    Random registration = new Random();
                                    int regNum = 0;
                                    for (int q = 0; q < sponsors.size(); q++) {
                                        sponsor = (Sponsorship) sponsors.get(q);
                                        sponsorId = sponsor.getSponshorshipid();
                                        sponsorName = sponsor.getSponsorname();
                                        sponsorTotal = 0;
                                        for (int i = 0; i < patients.size(); i++) {
                                            Patient patient = (Patient) patients.get(i);
                                            patientId = patient.getPatientid();

                                            sponsorshipDetails = mgr.sponsorshipDetails(patientId);

                                            if (sponsorshipDetails.getSponsorid() == sponsorId) {


                                                patientName = patient.getFname() + " " + patient.getLname();

                                                if (correctDateFound) {
                                                    if (singleDateValue) {
                                                        System.out.println("very single");
                                                        System.out.println("patientId : " + patientId + " dateValue : " + dateValue);
                                                        patientVisits = mgr.patientHistoryForDate(patientId, dateSqlDate);
                                                    } else {
                                                        System.out.println("not very single");
                                                        patientVisits = mgr.patientHistoryForDateDuration(patientId, dateSqlDate, rangeSqlDate);
                                                    }
                                                } else {
                                                    patientVisits = mgr.patientHistory(patientId);
                                                }

                                                patientVisitsNum = patientVisits.size();
                                                System.out.println("patientVisitsNum : " + patientVisitsNum);

                                                regNum = registration.nextInt(regConsultation);
                                                regNum += 15;

                                                patientConsultation = regNum * patientVisitsNum;

                                                Investigation inv;
                                                double invCost, invPrice, totalInvCost = 0;
                                                int invId, invQty, visitId;
                                                List patientInvs;
                                                Visitationtable vT;
                                                Patientinvestigation pT;
                                                for (int j = 0; j < patientVisits.size(); j++) {
                                                    vT = (Visitationtable) patientVisits.get(j);
                                                    visitId = vT.getVisitid();

                                                    patientInvs = mgr.patientInvestigation(visitId);

                                                    for (int t = 0; t < patientInvs.size(); t++) {
                                                        pT = (Patientinvestigation) patientInvs.get(t);
                                                        invId = pT.getInvestigationid();
                                                        invQty = pT.getQuantity();

                                                        inv = mgr.getInvestigation(invId);
                                                        invPrice = inv.getPrice();
                                                        invCost = invPrice * invQty;

                                                        totalInvCost += invCost;
                                                    }
                                                }

                                                Treatment trtmnt;
                                                double treatCost, treatPrice, totalTreatCost = 0;
                                                int treatId, treatQty;
                                                List patientTreats;
                                                Patienttreatment patTreat;
                                                for (int j = 0; j < patientVisits.size(); j++) {
                                                    vT = (Visitationtable) patientVisits.get(j);
                                                    visitId = vT.getVisitid();

                                                    patientTreats = mgr.patientTreatment(visitId);

                                                    for (int t = 0; t < patientTreats.size(); t++) {
                                                        patTreat = (Patienttreatment) patientTreats.get(t);
                                                        treatId = patTreat.getTreatmentid();
                                                        treatQty = patTreat.getQuantity();

                                                        trtmnt = mgr.getTreatment(treatId);
                                                        treatPrice = trtmnt.getPrice();
                                                        treatCost = treatPrice * treatQty;

                                                        totalTreatCost += treatCost;
                                                    }
                                                }

                                                double patientTotals = patientConsultation + totalInvCost + totalTreatCost;
                                                sponsorTotal += patientTotals;

                                            }
                                        }
                                %>
                                <tr>
                                    <td><%=sponsorName%> </td>
                                    <td><%=sponsorTotal%></td>
                                </tr>
                                <%
                                    }
                                %>
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
