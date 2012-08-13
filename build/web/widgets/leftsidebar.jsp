<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="entities.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.HMSHelper"%>
<%@page import="java.text.DateFormat"%>
<%HMSHelper mg = new HMSHelper();
    DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

    Date dt = new Date();
    //System.out.println(dateFormat.format(date));
    List vjs = mg.listRecentVisits(dateformat.format(dt), "In Patient");
    List outs = mg.listRecentVisits(dateformat.format(dt), "Out Patient");
    List labs = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List pharmacy = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List accs = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List rms = mg.listUnitVisitations("Room 1", dateformat.format(dt));
%>

<div style="height: 100%; position: fixed;" class="span3">
    <ul style="display: none;"  class="menu hide">
        <li class="item1">
            <a  href="#"><i class="icon-folder-open"></i> Patient Management</a>
            <ul>
                <li class="subitem1">
                    <a href="index.jsp">Front Desk </a>
                </li>
                <li class="subitem2">
                    <a href="opd.jsp">Out Patient Department </a>
                </li>

            </ul>

        </li>
        <li class="item2">
            <a href="#"> <i class=" icon-search"></i> Consultation
            </a> 
            <ul>
                <li class="subitem1">
                    <a href="consultingroom.jsp">Patients <span><%=rms.size()%></span></a>
                </li>
                <li class="subitem2">
                    <a href="#">Appointments <span>6</span></a>
                </li>
                <li class="subitem3">
                    <a href="outpatient.jsp">Recent Out Patients <span><%=vjs.size()%></span></a>
                </li> 
                <li class="subitem4">
                    <a href="inpatient.jsp">Recent In Patients <span><%=outs.size()%></span></a>
                </li> 
                <li class="subitem5">
                    <a href="#">Lab Results<span>2</span></a>
                </li> 
            </ul>
        </li>
        <li class="item2">
            <a href="#"> <i class=" icon-search"></i> Male Ward
            </a> 
            <ul>
                <li class="subitem1">
                    <a href="ward.jsp">In Patients <span></span></a>
                </li>
                <li class="subitem2">
                    <a href="#">New Ward Report <span></span></a>
                </li>
                <li class="subitem3">
                    <a href="#">Ward Reports Previous Reports <span></span></a>
                </li> 
                <li class="subitem4">
                    <a href="#">Schedule<span></span></a>
                </li> 

            </ul>
        </li>
        <li class="item3">
            <a href="#"><i class="icon-share"></i> Laboratory  </a>
            <ul>
                <li class="subitem1">
                    <a href="laboratory.jsp">Patients </a><span><%=labs.size()%></span>
                </li>
                <li class="subitem2">

                </li>
                <li class="subitem3">
                    <a href="">Outstanding Treatments</a><span>6</span>
                </li>
                <li class="subitem3">
                    <a href="#">Procurement Sheet</a>
                </li>

            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Pharmacy </a>
            <ul>
                <li class="subitem1">
                    <a href="pharmacy.jsp">Patients </a><span><%=pharmacy.size()%></span>
                </li>
                <li class="subitem2">

                </li>
                <li class="subitem3">
                    <a href="">Outstanding Treatments</a><span>6</span>
                </li>
                <li class="subitem3">
                    <a href="">Procurement Sheet</a>
                </li>

            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Accounts and Billing</a>
            <ul>
                <li class="subitem1">
                    <a href="accounts.jsp">Current Bills </a><span><%=accs.size()%></span>
                </li>

                <li class="subitem3">
                    <a href="anballdepartments.jsp">Departmental Bills</a>
                </li>
                <li class="subitem3">
                    <a href="anballpatientsrevenues.jsp">All Patients Revenues</a>
                </li>
                <li class="subitem3">
                    <a href="anbpatientrevenues.jsp">Patient Revenues</a>
                </li>
                <li class="subitem3">
                    <a href="anballsponsorsrevenues.jsp">Sponsors Revenues</a>
                </li>


            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i>Inventory</a>
            <ul>
                <li class="subitem1">
                    <a href="inventoryindex.jsp">Add Item</a>
                </li>
                <li class="subitem2">
                    <a href="addType.jsp">Add Item Type</a>
                </li>
                <li class="subitem3">
                    <a href="search_item.jsp">Search Item</a>
                </li>
                <li class="subitem4">
                    <a href="application.jsp">List Items</a>
                </li>
                <li class="subitem4">
                    <a href="check.jsp">Check Expiry</a>
                </li>
                <li class="subitem4">
                    <a href="addSupplier.jsp">Add Supplier</a>
                </li>
            </ul>
        </li>

    </ul>
</div>