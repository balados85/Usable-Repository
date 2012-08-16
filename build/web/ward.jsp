<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <script type="text/javascript">
            
            var diagnosis = "";
            var treatment = "";
            var investigation = "";
           
            
            function showdetails(id){
                var show = document.getElementById(id);
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function showdTreatment(){
                var show = document.getElementById("treat");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function showdInvestigation(){
                var show = document.getElementById("lab");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function addDiagnosis(id,dd){               
                var diag = document.getElementById(id).value;
                diagnosis = diagnosis+"<>"+diag;
               
                document.getElementById(dd).value = diagnosis;
              
            }
            function addTreatment(id,dd){               
                var treat = document.getElementById(id).value;                
                treatment = treatment+"<>"+treat;                
                document.getElementById(dd).value=treatment;
                 
            }
            function addDosage(id,dd){ 
                
                var treat = document.getElementById(id).value;  
                treatment = treatment+"><"+treat;                
                document.getElementById(dd).value=treatment;
                //return false;
            }
            function addType(id,dd){  
                var treat = document.getElementById(id).value;                
                treatment = treatment+"><"+treat;                
                document.getElementById(dd).value=treatment;
                 
            }
            function addQuantity(id,dd){ 
                var treat = document.getElementById(id).value;                
                treatment = treatment+"><"+treat;                
                document.getElementById(dd).value=treatment;
                 
            }
            function addInvestigation(id,dd){                
                var treat = document.getElementById(id).value;             
                investigation = investigation+"<>"+treat;               
                document.getElementById(dd).value=investigation;
               
            }
            function addDiadChecks(id1){
                //alert("here");
                var t1 = document.getElementById(id1).value;
                var tr = document.createElement("tr");
                var td1 = document.createElement("td"); 
                var td5 = document.createElement("td"); 
                var text = document.createTextNode(document.getElementById(id1).value);
                var cb = document.createElement( "input" );
                cb.type = "checkbox";
                cb.id = "id";
                cb.name = "diaglist";
                var ttt = t1;
                cb.value = ttt;
                cb.checked = true;
                td1.appendChild(text);
                
                td5.appendChild(cb);
                tr.appendChild(td1);
                tr.appendChild(td5);
                document.getElementById( 'appendd' ).appendChild( tr );
            }
            function addInvestigationCheck(id1){
               
                var t1 = document.getElementById(id1).value;
                var tr = document.createElement("tr");
                var td1 = document.createElement("td"); 
                var td5 = document.createElement("td"); 
                var text = document.createTextNode(document.getElementById(id1).value);
                var cb = document.createElement( "input" );
                cb.type = "checkbox";
                cb.id = "id";
                cb.name = "labtest";
                var ttt = t1;
                cb.value = ttt;
                cb.checked = true;
                td1.appendChild(text);
                
                td5.appendChild(cb);
                tr.appendChild(td1);
                tr.appendChild(td5);
                document.getElementById( 'appendx' ).appendChild( tr );
            }
            function addCheckboxes (id1,id2,id3,id4){
                var t1 = document.getElementById(id1).value;
                var t2 = document.getElementById(id2).value;
                var t3 = document.getElementById(id3).value;
                var t4 = document.getElementById(id4).value;
                if(t1 =="Select"){
                    alert("Please select treatment before adding");
                    document.getElementById(id1).focus();
                    return;
                }
                if(t2 =="Select"){
                    alert("Please select drug type before adding");
                    document.getElementById(id2).focus();
                    return;
                }
                if(t3 =="0"){
                    alert("Quantity cannot be 0");
                    document.getElementById(id3).focus();
                    return;
                }
                if(t4 =="dosage"){
                    alert("Please add dosage");
                    document.getElementById(id4).focus();
                    return;
                }
                
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                var td2 = document.createElement("td");
                var td3 = document.createElement("td");
                var td4 = document.createElement("td");
                var td5 = document.createElement("td");
                var text = document.createTextNode(document.getElementById(id1).value);
                var text2 = document.createTextNode(document.getElementById(id2).value);
                var text3= document.createTextNode(document.getElementById(id3).value);
                var text4 = document.createTextNode(document.getElementById(id4).value);
                // alert(text);
                //tr.appendChild(td);
                var cb = document.createElement( "input" );
                cb.type = "checkbox";
                cb.id = "id";
                cb.name = "data";
                var ttt = ""+t1+"><"+t2+"><"+t3+"><"+t4;
                cb.value = ttt;
                cb.checked = true;
                td1.appendChild(text);
                td2.appendChild(text2);
                td3.appendChild(text3);
                td4.appendChild(text4);
                
                td5.appendChild(cb);
                // td.appendChild(text);
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);
                tr.appendChild(td5);
                // var text = document.createTextNode( "checkbox" );
                // document.getElementById( 'append' ).appendChild( text );
                document.getElementById( 'append' ).appendChild( tr );
                //return false;
            }
            function updateDosage(vst,treatmentid,id,morning,afternoon,evening){
               
                var id = document.getElementById(id).value;
                var morning = document.getElementById(morning).value;
                var evening = document.getElementById(evening).value;
                var afternoon = document.getElementById(afternoon).value;
                var vidid = document.getElementById(vst).value;
                var tid = document.getElementById(treatmentid).value;
                 
                $.post('action/admissionaction.jsp', { value : "dosagemeter", visitid : vidid, treamentid : tid, id:id , morning : morning,  afternoon : afternoon , evening : evening}, function(data) {
                    // alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            function updateNote(){
               
                var visitid = document.getElementById("nid").value;
                var notes = document.getElementById("adminnotes").value;
                var doctorsid = document.getElementById("doctorsid").value;
                //alert(docid);
                 
                $.post('action/admissionaction.jsp', { value : "addnotes", visitid : visitid, notes : notes, doctorsid : doctorsid}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            function updateInvestigation(){
              
                
                var visitid = document.getElementById("visitid").value;
                 
                var patientid = document.getElementById("patientid").value;
                var investigationnotes = document.getElementById("investigation_note").value;
                var selected = new Array();
                
                $("input:checkbox[name=labtest]:checked").each(function() {
                    selected.push($(this).val());
                });
                
                $.post('action/admissionaction.jsp', { value : "investigations", investigation : investigationnotes, patientid : patientid, visitid : visitid, 'select[]' : selected}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
                //alert(investigationnotes);
            }
            function updateTreatment(){
                
                var prescriptionotes = document.getElementById("prescription_notes").value;
                var visitid = document.getElementById("visitid").value;
                var patientid = document.getElementById("patientid").value;
                var selected = new Array();

                $("input:checkbox[name=data]:checked").each(function() {
                    selected.push($(this).val());
                });
                 
                $.post('action/admissionaction.jsp', { value : "treatments", prescription : prescriptionotes, visitid : visitid, patientid : patientid, 'select[]' : selected}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
                //alert(prescriptionotes);
               
            }
            function showTransfer(){
                var show = document.getElementById("trans");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
                //showBig();
                
            }
            
            function showBig(){
                var show = document.getElementById("bigtrans");
            
            if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
           
            /* attach a submit handler to the form */
            $("#searchForm").submit(function(event) {
               
                /* stop form from submitting normally */
                event.preventDefault(); 
        
                /* get some values from elements on the page: */
                var $form = $( this ),
                term = $form.find( 'input[name='+id+']' ).val(),
                url = $form.attr( 'action' );

                /* Send the data using post and put the results in a div */
                $.post( url, { s: term },
                function( data ) {
                    var content = $( data ).find( '#content' );
                    $( "#result" ).empty().append( content );
                }
            );
            });
        </script>

    </head>


    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <%@include file="widgets/subhead.jsp" %>

            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard"> 

                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">

                        <ul style="margin-left: 0px;" class="breadcrumb">
                            <li>
                                <a>Male Ward</a><br/>
                                <%if (session.getAttribute("lasterror") != null) {%>
                                <h3><a> <%=session.getAttribute("lasterror")%> </a></h3>
                                <%}%>
                            </li>
                        </ul>


                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>

                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Diagnosis</th>
                                    <th>Admission Date</th>
                                    <th> </th>



                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    HMSHelper mgr = new HMSHelper();
                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
                                    Visitationtable vs = null;
                                    List investigations = null;
                                    List treatments = null;
                                    Date date = new Date();
                                    //System.out.println(dateFormat.format(date));
                                    List visits = mgr.listUnitVisitations("Male Ward", dateFormat.format(date));
                                    for (int i = 0; i < visits.size(); i++) {
                                        Visitationtable visit = (Visitationtable) visits.get(i);
                                        vs = mgr.currentVisitations(visit.getVisitid());

                                        // List patientHistory = mgr.patientHistory(visit.getPatientid());
                                %>
                                <tr>
                                    <td>
                                        <a href="condetails.jsp?patientid=<%=visit.getPatientid()%>&id=<%=visit.getVisitid()%>"> 
                                            <%= visit.getPatientid()%> </a> 
                                    </td>
                                    <td>
                                        <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%> 
                                    </td>
                                    <td>
                                        <%= mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%>
                                    </td>
                                    <td>
                                        <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofregistration())%>
                                    </td>
                                    <td>
                                        <a id="<%=visit.getPatientid()%><%=visit.getVisitid()%>link"  class="visitlink btn btn-info"> <i class="icon-pencil icon-white"> </i> Consultation </a>
                                    </td>
                                </tr>
                                <% }

                                %>
                            </tbody>
                        </table>
                    </div>
                </div> 
            </section>
        </div>
        <%@include file="widgets/footer.jsp" %>

    </div><!-- /container -->


    <%@include file="widgets/javascripts.jsp" %>

    <%

        for (int i = 0; i < visits.size(); i++) {
            Visitationtable visit = (Visitationtable) visits.get(i);
            // vs = mgr.currentVisitations(visit.getVisitid());
            List patientHistory = mgr.patientHistory(visit.getPatientid());
            List adminssionHistory = mgr.patientAdmissionHistory(visit.getPatientid());
    %>
    <script type="text/javascript">
        $(document).ready(function(){
                                                      
               
            $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog({
                autoOpen : false,
                width : 600,
                modal :true,
                position : "top"
		
            });
                
            $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>link').click(function(){
                   
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog('open');
                return false;
            });
                
                                                        
                
        });
    </script>

    <div style="max-height: 600px; y-overflow: scroll; display: none;" class="visit hide" id="<%=visit.getPatientid()%><%=visit.getVisitid()%>"  title="Consultation for <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%>   ">


        <div class="btn-toolbar center">
            <div class="btn-group">
                <button class="btn btn-info history_link bar">History</button>
                <button class="btn btn-info vital_link bar">Admission History </button>
                <button class="btn btn-info diagnosis_link bar">Drugs (Medication)</button>
                <button class="btn btn-info laboratory_link bar ">Investigations</button>
                <button class="btn btn-info results_link bar">Doctors Daily Report</button>
                <button class="btn btn-info prescription_link bar">Requested Treatments</button>
            </div>
        </div>
        <!--  <form action="action/labnpharmactions.jsp" method="post" id="frm">-->
        <div style="display: block;" class="well thumbnail center vital">
            <ul class="breadcrumb">
                <li>
                    <a style="text-align: center;">Admission History </a>
                </li>

            </ul>

            <table class="table">

                <thead style="color: black;">
                    <tr>
                        <th>
                            Admission Date 
                        </th>
                        <th>
                            Discharge Date 
                        </th>
                        <th>
                            Diagnosis
                        </th>
                        <th>
                            Medications
                        </th>
                        <th>
                            Investigations
                        </th>

                    </tr>
                </thead>
                <tbody>
                    <% for (int r = 0; r < adminssionHistory.size(); r++) {
                            Visitationtable vps = (Visitationtable) adminssionHistory.get(r);

                    %>
                    <tr>

                        <td>
                            <%=vps.getAdmissiondate()%>
                        </td>

                        <td>
                            <%=vps.getDischargedate()%>
                        </td>
                        <td>
                            <%List diagnoses = mgr.patientDiagnosis(vps.getVisitid());
                                for (int d = 0; d < diagnoses.size(); d++) {
                                    Patientdiagnosis patientdiagnosis = (Patientdiagnosis) diagnoses.get(d);

                            %>
                            <%=mgr.getDiagnosis(patientdiagnosis.getDiagnosisid()).getDiagnosis()%>
                            <%}%>
                        </td>
                        <td>
                            <%List dmonitors = mgr.listDosageMonitor(vps.getVisitid());
                                for (int t = 0; t < dmonitors.size(); t++) {
                                    Dosagemonitor dosagemonitor = (Dosagemonitor) dmonitors.get(t);

                            %>
                            <%=mgr.getTreatment(dosagemonitor.getPatienttreatmentid()).getTreatment()%>
                            <%}%>
                        </td>
                        <td>
                            <%List pInvestigations = mgr.patientInvestigation(vps.getVisitid());
                                for (int d = 0; d < pInvestigations.size(); d++) {
                                    Patientinvestigation pInvestigation = (Patientinvestigation) pInvestigations.get(d);

                            %>
                            <%=mgr.getInvestigation(pInvestigation.getInvestigationid()).getInvestigation()%>
                            <%}%>
                        </td>

                    </tr>
                    <%}%>
                </tbody>

            </table>

        </div>
        <div style="display: none;" class="well thumbnail center diagnosis">
            <ul class="breadcrumb">
                <li>
                    <a style="text-align: center;">Drugs (Medication) and Dosage</a>
                </li>

            </ul>
            <form action="action/admissionaction.jsp" method="POST" id="searchForm">
                <table class="table">

                    <thead style="color: black;">
                        <tr>
                            <th>
                                Medication
                            </th>
                            <th>
                                Morning
                            </th>
                            <th>
                                Afternoon
                            </th>
                            <th>
                                Evening
                            </th>
                            <th>
                                Others
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%List dmonitors = mgr.listDosageMonitor(visit.getVisitid());
                            for (int t = 0; t < dmonitors.size(); t++) {
                                Dosagemonitor dosagemonitor = (Dosagemonitor) dmonitors.get(t);

                        %>

                        <tr>
                            <td> <%=mgr.getTreatment(dosagemonitor.getPatienttreatmentid()).getTreatment()%>
                            </td>  
                            <td> 
                                <%
                                    if (dosagemonitor.getMorning().equalsIgnoreCase("No")) {%>
                                <input type="checkbox" id="morning<%=t%>" value="Yes"/>

                                <%  } else {
                                %><%=dosagemonitor.getMorning()%>
                                <%}%>
                            </td> 
                            <td> 
                                <%
                                    if (dosagemonitor.getAfternoon().equalsIgnoreCase("No")) {%>
                                <input type="checkbox" id="afternoon<%=t%>" value="Yes"/>

                                <%  } else {
                                %><%=dosagemonitor.getAfternoon()%>
                                <%}%>
                            </td> 
                            <td> 
                                <%
                                    if (dosagemonitor.getEvening().equalsIgnoreCase("No")) {%>
                                <input type="checkbox" id="evening<%=t%>" value="Yes"/>

                                <%  } else {
                                %><%=dosagemonitor.getEvening()%>
                                <%}%>
                            </td> 
                            <td> 
                                <%
                                    if (dosagemonitor.getGivenday() == null) {%>
                                Not Started

                                <%  } else {
                                %><%=dosagemonitor.getGivenday()%>
                                <%}%>
                            </td> 
                    <input type="hidden" id="vs<%=dosagemonitor.getId()%>" value="<%=dosagemonitor.getVisitid()%>"/>
                    <input type="hidden" id="pt<%=dosagemonitor.getId()%>" value="<%=dosagemonitor.getPatienttreatmentid()%>"/>
                    <input type="hidden" id="id<%=dosagemonitor.getId()%>" value="<%=dosagemonitor.getId()%>"/>
                    <td><!--<input type="submit" onclick='updateDosage("id<%=dosagemonitor.getId()%>","morning<%=t%>","afternoon<%=t%>","evening<%=t%>");return false;'--</td>-->
                        <button class="btn btn-info span2" onclick='updateDosage("vs<%=dosagemonitor.getId()%>","pt<%=dosagemonitor.getId()%>" ,"id<%=dosagemonitor.getId()%>","morning<%=t%>","afternoon<%=t%>","evening<%=t%>");return false;'>
                            <i class="icon-white icon-pencil"> </i>   Update
                        </button></td>
                    </tr>
                    <tr><td><div id="result"/></td></tr>
                    <%}%> 


                    </tbody>
                </table>
            </form>
            <br/>

        </div>
        <div style="display: none;" class="well thumbnail center history">
            <ul class="breadcrumb">
                <li>
                    <a style="text-align: center;">History</a>
                </li>
            </ul>
            <table class="">
                <thead>
                    <tr>
                        <td>
                            Visit Date
                        </td>
                        <td>
                            Diagnosis

                        </td>
                        <td>
                            Investigation

                        </td>
                        <td>

                            Treatment
                        </td>
                    </tr>
                </thead>
                <tbody>

                    <% for (int r = 0; r < patientHistory.size(); r++) {
                            Visitationtable vps = (Visitationtable) patientHistory.get(r);
                            List pdiagnosis = mgr.patientDiagnosis(vps.getVisitid());
                            List pInvestigation = mgr.patientInvestigation(vps.getVisitid());
                            List pTreatment = mgr.patientTreatment(vps.getVisitid());
                    %>
                    <tr>

                        <td>
                            <%=vps.getDate()%>
                        </td>

                        <td>
                            <% for (int s = 0; s < pdiagnosis.size(); s++) {
                                    Patientdiagnosis pd = (Patientdiagnosis) pdiagnosis.get(s);
                                    if (pd != null) {
                            %>
                            <h5><%= mgr.getId(pd.getDiagnosisid()).getDiagnosis()%></h5> 
                            <%}
                                }%>
                        </td>
                        <td>
                            <% for (int s = 0; s < pInvestigation.size(); s++) {
                                    Patientinvestigation pi = (Patientinvestigation) pInvestigation.get(s);
                                    if (pi != null) {
                            %>
                            <h5><%= mgr.getInvestigation(pi.getInvestigationid()).getInvestigation()%></h5> 
                            <% }
                                }%>
                        </td>
                        <td>
                            <% for (int s = 0; s < pTreatment.size(); s++) {
                                    Patienttreatment pt = (Patienttreatment) pTreatment.get(s);
                                    if (pt != null) {
                            %>
                            <h5><%= mgr.getTreatment(pt.getTreatmentid()).getTreatment()%></h5> 
                            <% }
                                }%>
                        </td>

                    </tr>
                    <%}%>

                </tbody>

            </table>

        </div>
        <div style="display: none;" class="well thumbnail center prescription">
            <ul class="breadcrumb">
                <li>
                    <a>Requested Treatments</a>
                </li>

            </ul>
            <table cellpadding="0" cellspacing="0" border="0" class=" example table">

                <thead>
                    <tr>
                        <th>
                            <label class="span3"> Item </label>
                        </th>
                        <th>
                            <label class="span2"> Quantity </label>
                        </th>
                        <th>
                            <label class="span2"> Cost (unit cost * quantity) </label>
                        </th>

                    </tr>
                </thead>
                <tbody>
                    <% List ptreatments = mgr.patientTreatment(visit.getVisitid());
                        for (int var = 0; var < ptreatments.size(); var++) {
                            Patienttreatment patienttreatment = (Patienttreatment) ptreatments.get(var);
                    %>
                    <tr>
                        <td>
                            <%=mgr.getTreatment(patienttreatment.getTreatmentid()).getTreatment()%> 
                        </td>
                        <td>

                            <%=patienttreatment.getQuantity()%> 

                        </td>
                        <td>

                            <%= (patienttreatment.getQuantity() * patienttreatment.getPrice())%> 

                        </td>
                    </tr>
                    <%}%>
                </tbody>

            </table>
            <div id="treat">
                <form action="action/admissionaction.jsp" method="POST" id="treatform">
                    <table> 

                        <thead>

                            <tr>
                                <th style="color: #000;">
                                    Item
                                </th>
                                <th style="color: #000;">
                                    Quantity 
                                </th>
                                <th style="color: #000;">
                                    Cost 
                                </th>

                            </tr>

                        </thead>
                        <tbody>                     

                            <tr>

                                <td> 
                                    <%
                                        if (mgr.sponsorshipDetails(visit.getPatientid()).getType().equalsIgnoreCase("nhis")) {%>

                                    <select  id="treatment<%=visit.getVisitid()%>" onchange = 'addTreatment("treatment<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")'>
                                        <option value="Select">Select Treatment</option>
                                        <%
                                            treatments = mgr.listNhisTreatment();
                                            if (treatments != null) {
                                                for (int v = 0; v < treatments.size(); v++) {
                                                    Nhistreatment treatment = (Nhistreatment) treatments.get(v);
                                        %>
                                        <option value="<%=treatment.getDrug()%>><<%=treatment.getCode()%>"><%=treatment.getDrug()%></option> 
                                        <% }
                                            }
                                        %>
                                    </select>
                                    <%  } else {%>                                      
                                    <select  id="treatment<%=visit.getVisitid()%>" onchange = 'addTreatment("treatment<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")'>
                                        <option value="Select">Select Treatment</option>
                                        <%
                                            treatments = mgr.listTreatments();
                                            if (treatments != null) {
                                                for (int v = 0; v < treatments.size(); v++) {
                                                    Treatment treatment = (Treatment) treatments.get(v);
                                        %>
                                        <option value="<%=treatment.getTreatment()%>><<%=treatment.getTreatmentid()%>"><%=treatment.getTreatment()%></option> 
                                        <% }
                                            }
                                        %>
                                    </select>

                                    <%   }
                                    %>                                  

                                </td>

                                <td>
                                    <select class="input-small" name="drugtype" id="drugtype<%=visit.getVisitid()%>" onchange=addType("drugtype<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")>
                                        <option value="Select">
                                            Select
                                        </option>
                                        <option value="Tab">
                                            Tab
                                        </option>
                                        <option value="Syrup">
                                            Syrup
                                        </option>
                                        <option value="Capsule">
                                            Capsule
                                        </option>
                                        <option value="Cream">
                                            Cream
                                        </option>
                                    </select>
                                </td>
                                <td>                                    <select class="input-mini" name="qty" id="qty<%=visit.getVisitid()%>" onchange=addQuantity("qty<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")>
                                        <option value="0">
                                            0
                                        </option>
                                        <option value="1">
                                            1
                                        </option>
                                        <option value="2">
                                            2
                                        </option>
                                        <option value="3">
                                            3
                                        </option>
                                        <option value="4">
                                            4
                                        </option>
                                        <option value="5">
                                            5
                                        </option>
                                        <option value="6">
                                            6
                                        </option>
                                        <option value="7">
                                            7
                                        </option>
                                        <option value="8">
                                            8
                                        </option>
                                        <option value="9">
                                            9
                                        </option>
                                        <option value="10">
                                            10
                                        </option>

                                    </select>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                    <table>
                        <thead>
                            <tr>
                                <th style="color: #000;">
                                    Dosage
                                </th>
                                <th>

                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>

                                    <input type="text" value="dosage" class="input-xlarge" name="dosage" id="dosage<%=visit.getVisitid()%>"/>
                                </td>

                                <td class="center">
                                    <button id="addCheckBoxes" class="btn btn-info span2" onclick='addCheckboxes("treatment<%=visit.getVisitid()%>","drugtype<%=visit.getVisitid()%>","qty<%=visit.getVisitid()%>","dosage<%=visit.getVisitid()%>");return false;'>
                                        <i class="icon-white icon-pencil"> </i>   Add
                                    </button>
                                </td>
                            </tr>
                        </tbody>


                    </table>


                   <!-- <textarea style="width: 95%" name="treatment" id="tt<%=visit.getVisitid()%>" ></textarea> -->
                    <div id="" style="display: none;">
                    </div>
                    <div id="append">
                        <table id="append">

                        </table>
                    </div>
                    <b> <u> Prescription Note </u> </b> <br />  <br />


                    <textarea style="width: 95%"  id ="prescription_notes" name="prescription_notes" ></textarea>
                    <br/>
                    <input type="hidden" id="visitid" name="visitid" value="<%=visit.getVisitid()%>"/>
                    <input type="hidden" id="patientid" name="patientid" value="<%=visit.getPatientid()%>"/>

                    <button id="" class="btn btn-info span2" onclick='updateTreatment();return false;'>
                        <i class="icon-white icon-pencil"> </i>   Add to Drugs
                    </button> 
                </form>

            </div>
        </div>
        <div style="display: none;" class="well thumbnail center laboratory">
            <ul class="breadcrumb">
                <li>
                    <a href="#" onclick="showdInvestigation()">Patient Investigations</a>
                </li>

            </ul>

            <div class="center" id="lab">
                <form action="action/admissionaction.jsp" id="docnote" method="POST" id="note">
                    <table cellpadding="0" cellspacing="0" border="0" class=" example table">

                        <thead>
                            <tr>
                                <th>
                                    <label class="span4"> Test </label>
                                </th>
                                <th>
                                    <label class="span4"> Results </label>
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            <% List results = mgr.patientInvestigation(visit.getVisitid());
                                for (int var = 0; var < results.size(); var++) {
                                    Patientinvestigation patientinvestigation = (Patientinvestigation) results.get(var);
                            %>
                            <tr>
                                <td>
                                    <%=mgr.getInvestigation(patientinvestigation.getInvestigationid()).getInvestigation()%> 
                                </td>
                                <td>
                                    <%if (patientinvestigation.getResult().isEmpty()) {%>
                                    <label style="color: red">Pending</label>
                                    <%} else {%>
                                    <%=patientinvestigation.getResult()%> 
                                    <%}%>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>

                    </table>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#" onclick="showdInvestigation()">Laboratory Request Form</a>
                        </li>

                    </ul>
                    <% if (mgr.sponsorshipDetails(vs.getPatientid()).getType().equalsIgnoreCase("nhis")) {%>
                    <select  id="test<%=visit.getVisitid()%>" onchange = 'addInvestigationCheck("test<%=visit.getVisitid()%>");addInvestigation("test<%=visit.getVisitid()%>","lb<%=visit.getVisitid()%>")'>
                        <option value="Select">Select Investigation</option>
                        <%
                            // List treatments = mgr.patientTreatment(int visitationid);
                            investigations = mgr.listNhisInvesigation();
                            if (investigations != null) {
                                for (int p = 0; p < investigations.size(); p++) {
                                    Nhisinvestigation investigation = (Nhisinvestigation) investigations.get(p);
                        %>
                        <option value="<%=investigation.getInvestigation()%>><<%= investigation.getCode()%>"><%=investigation.getInvestigation()%></option> 
                        <%}%>
                    </select>
                    <%}
                    } else {%>
                    <select  id="test<%=visit.getVisitid()%>" onchange = 'addInvestigationCheck("test<%=visit.getVisitid()%>");addInvestigation("test<%=visit.getVisitid()%>","lb<%=visit.getVisitid()%>")'>
                        <option value="Select">Select Investigation</option>
                        <%
                            // List treatments = mgr.patientTreatment(int visitationid);
                            investigations = mgr.listInvestigation();
                            if (investigations != null) {
                                for (int p = 0; p < investigations.size(); p++) {
                                    Investigation investigation = (Investigation) investigations.get(p);
                        %>
                        <option value="<%=investigation.getInvestigation()%>><<%= investigation.getInvestigationId()%>"><%=investigation.getInvestigation()%></option> 
                        <% }%>
                    </select> 
                    <% }
                        }%>

                    <br />
                   <!-- <textarea style="width: 95%" name="investigation" id="lb<%=visit.getVisitid()%>"></textarea> -->
                    <div id="appendx">
                        <table id="appendx">

                        </table>
                    </div>
                    <br />
                    Investigation Note <br />  <br />
                    <textarea style="width: 95%" id ="investigation_note" name="investigation_note"></textarea> 
                    <input type="hidden" id="visitid" name="visitid" value="<%=visit.getVisitid()%>"/>
                    <input type="hidden" id="patientid" name="patientid" value="<%=visit.getPatientid()%>"/>
                    <button class="btn btn-info span2" onclick='updateInvestigation();return false;'>
                        <i class="icon-white icon-pencil"> </i>   Make Request
                    </button>
                </form>
            </div>

        </div>
        <div style="display: none;" class="well thumbnail center results">
            <ul class="breadcrumb">
                <li>
                    <a href="#" onclick="showdInvestigation()">Doctor's Notes</a>
                </li>

            </ul>
            <table cellpadding="0" cellspacing="0" border="0" class="display example table">

                <thead>
                    <tr>
                        <th class="span3">Date</th>
                        <th class="span3">Note</th>
                        <th class="span3">Doctor</th>
                    </tr>
                <tbody>
                    <% List notes = mgr.listPatientAdmissionNote(visit.getVisitid());


                        for (int nt = 0; nt < notes.size(); nt++) {
                            Admissionnotes admissionnotes = (Admissionnotes) notes.get(nt);
                    %>
                    <tr>
                        <td><%=admissionnotes.getDate()%></td>
                        <td><%=admissionnotes.getNote()%></td>
                        <td><%=admissionnotes.getDoctorsid()%></td>
                    </tr>
                    <%}%>
                </tbody>
                </thead>

            </table>
            Add Notes

            <form action="action/admissionaction.jsp" id="docnote" method="POST" id="note">
                <input type="hidden" id="nid" name="visitid" value="<%=visit.getVisitid()%>"/>
                <input type="hidden" id="doctorsid" name="doctorsid" value=""/>
                <textarea id="adminnotes" name="admissionnote"></textarea><br/>
                <button class="btn btn-info span2" onclick='updateNote();return false;'>
                    <i class="icon-white icon-pencil"> </i>   Add Notes
                </button>
            </form>
        </div>

        <div class="form-actions center" >
            <!--<select name="unitid">
                <%
                    List units = mgr.listUnits();
                    for (int j = 0; j < units.size(); j++) {
                        Units unit = (Units) units.get(j);
                %>
                <option value="<%=unit.getUnitname()%>"><%=unit.getUnitname()%></option> 
                <% }


                %>
            </select>-->
            <input type="hidden" name="patientid" value="<%=visit.getPatientid()%>"/>
            <input type="hidden" name="id" value="<%=visit.getVisitid()%>"/> 
            <br />
            <form action="action/admissionaction.jsp" method="POST" id="frmid">
                <input type="hidden"  name="visitid" value="<%=visit.getVisitid()%>"/>
                <input type="hidden"  name="patientid" value="<%=visit.getPatientid()%>"/>
                Discharge: <input type="radio" name="patientstatus" value="Discharge" onclick="showBig()"/> Dead: <input type="radio" name="patientstatus" value="Dead" onclick="showBig()"/> Transfer: <input type="radio" name="patientstatus" value="Transfer" onclick="showBig();showTransfer()"/>
                <div id="bigtrans" style="display: none">
                    <div id="trans" style="display: none">
                    Transferred to: <input type="text" name="location"/><br/>
                Transfer Notes:<br/>
                <textarea name="notes"></textarea>
                </div>
                <br/><button type="submit" name="action" value="forward" class="btn btn-danger btn-large">
                    <i class="icon-white icon-arrow-right"> </i> Forward
                </button>
                </div>
            </form>
        </div>
        <!-- </form>-->

    </div>
    <div class="clear"></div>

    <% //}%>
    <%   //  }
        }
    %>

</body>
</html>