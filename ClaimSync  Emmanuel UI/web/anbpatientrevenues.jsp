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

            int regConsultation = 20;
            double patientConsultation = 0;
            HMSHelper mgr = new HMSHelper();

            //       List visits = mgr.listVisitations();
            List patients = mgr.listPatients();
            Random registration = new Random();
            int regNum = 0;
            Random randPatient = new Random();
            int randPatientId = randPatient.nextInt(patients.size());
            randPatientId += 1;

            Patient patient = null;
            List patientVisits = null;
            int patientVisitsNum;
            String patientId = "";
            String patientName = "";
            String sVisitationDate = "";
            Investigation inv;
            double invCost, invPrice, totalInvCost = 0;
            int invId, invQty, visitId;
            List patientInvs;
            Visitationtable vT;
            Date visitationDate;
            java.sql.Date todaysDate = new java.sql.Date(new java.util.Date().getTime());
            System.out.println("todaysDate : " + todaysDate);

            String filterBy = "";
            String folderNumber = "";
            String existingPatId = "";

            boolean foundQuery = false;
            boolean foundDateRange = false;

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

            if (request.getParameter("filterBy") != null) {
                filterBy = request.getParameter("filterBy");

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


                if (request.getParameter("folderNum") != null) {
                    folderNumber = request.getParameter("folderNum");

                    System.out.print("folderNumber : " + folderNumber);

                    if (!folderNumber.isEmpty()) {
              //          existingPatId = request.getParameter("existingPatId");
              //          System.out.print("existingPatId : " + existingPatId);
                       foundQuery = true;
                    }

                    if (foundQuery) {
                        if (correctDateFound) {
                            if(singleDateValue) {
                                patientVisits = mgr.patientHistoryForDate(folderNumber, dateSqlDate);
                            } else {
                                patientVisits = mgr.patientHistoryForDateDuration(folderNumber, dateSqlDate, rangeSqlDate);
                            }
                        } else {
                              System.out.println("PVisits : " + patientVisits);
                            patientVisits = mgr.patientHistory(folderNumber);
                          
                        }
                    }
                }

            }
            System.out.print("filterBy : " + filterBy);
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
                    <div style="display: none; padding-top: 2px;" class="span9 offset3 thumbnail well content hide">

                        <div style="margin-bottom: 0px; padding-bottom: 0px; ">
                            <%
                                if (foundQuery) {%>
                            <input type="hidden" name="existingPatId" value="<%=folderNumber%>" />
                            <%  }
                            %>
                            <ul style="padding-top: 1px; margin-bottom: 0px;"  class="breadcrumb ">
                                <li style="margin-top: 10px;">
                                    <a>Search By</a>
                                </li>
                            </ul>
                            <form action="anbpatientrevenues.jsp" method="post">
                                <table style="margin-bottom: 0px; padding-bottom: 0px;" class="center " >
                                    <tr>
                                        <td class="center">
                                            <select class="input-large" name="filterBy">
                                                <option> Folder Number </option>
                                                <!--   <option> Patient Name </option>   -->
                                            </select>
                                        </td>

                                        <td class="center">
                                            <input name="folderNum" placeholder="Patient Name" type="text" class="input-xlarge" value="<%=folderNumber%>" />
                                        </td>

                                        <td>
                                            <input name="daterange" placeholder="Select Date Range"  id="rangeA" type="text" class="input-large"  />
                                        </td>
                                        <td class="center">
                                            <button type="submit" class="btn btn-large btn-danger">
                                                <i class="icon icon-white icon-search"></i>
                                                Search
                                            </button>
                                        </td> 
                                    </tr>
                                </table>
                            </form>
                        </div>






                        <table style="margin-top: 0px;" cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>
                                <tr>
                                    <th>Date </th>
                                    <th>Reg / Consultation</th>
                                    <th>Lab</th>
                                    <th>Pharmacy</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    if (foundQuery) {
                                        for (int i = 0; i < patientVisits.size(); i++) {
                                            vT = (Visitationtable) patientVisits.get(i);
                                            visitId = vT.getVisitid();
                                            patientVisitsNum = patientVisits.size();
                                            visitationDate = vT.getDate();
                                            sVisitationDate = visitationDate + "";
                                            regNum = registration.nextInt(regConsultation);
                                            regNum += 15;

                                            patientConsultation = regNum * patientVisitsNum;

                                            Patientinvestigation pT;
                                            for (int j = 0; j < patientVisits.size(); j++) {
                                                //  vT = (Visitationtable) patientVisits.get(j);

                                                //   visitId = vT.getVisitid();

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
                                                //    vT = (Visitationtable) patientVisits.get(j);
                                                //    visitId = vT.getVisitid();

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

                                %>

                                <tr>
                                    <td>
                                        <%=sVisitationDate%></td>
                                    <td> <%=patientConsultation%></td>
                                    <td><%=totalInvCost%></td>
                                    <td><%=totalTreatCost%></td>
                                    <td><%=patientTotals%></td>
                                </tr>
                                <%
                                        }
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
