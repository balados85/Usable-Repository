<%-- 
    Document   : index
    Created on : Jul 5, 2012, 2:14:52 PM
    Author     : Lisandro
--%>




<%@page import="entities.HMSHelper"%>
<%@page import="helper.HibernateUtil"%>
<%@page import="entities.Itemtype"%>
<%@page import="java.util.Date"%>
<%@page import="entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="entities.HMSHelper"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Items</title>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

        <script>
            $(document).ready(function() {
                $("#datepicker").datepicker();
            });
  
            $(document).ready(function() {
                $("#datepicker1").datepicker();
            });
        </script>
        <style type="text/css">
            form{
                background-image: url(images/07.jpg);
            }

            body {
                background-color: #FFF;
                background-image: url(images/09.gif);
            }
            #b
            {
                background-color:#D1F0F6;
            }
            .gradientbuttons ul{
                padding: 3px 0;
                margin-left: 0;
                margin-top: 1px;
                margin-bottom: 0;
                font: bold 13px Verdana;
                list-style-type: none;
                text-align: center; /*set to left, center, or right to align the menu as desired*/
            }

            .gradientbuttons li{
                display: inline;
                margin: 0;
            }

            .gradientbuttons li a{
                text-decoration: none;
                padding: 5px 7px;
                margin-right: 5px;
                border: 1px solid #778;
                color: white;
                border:1px solid gray;
                background: #3282c2;
                border-radius: 8px; /*w3c border radius*/
                box-shadow: 3px 3px 4px rgba(0,0,0,.5); /* w3c box shadow */
                -moz-border-radius: 8px; /* mozilla border radius */
                -moz-box-shadow: 3px 3px 4px rgba(0,0,0,.5); /* mozilla box shadow */
                background: -moz-linear-gradient(center top, #a4ccec, #72a6d4 25%, #3282c2 45%, #357cbd 85%, #72a6d4); /* mozilla gradient background */
                -webkit-border-radius: 8px; /* webkit border radius */
                -webkit-box-shadow: 3px 3px 4px rgba(0,0,0,.5); /* webkit box shadow */
                background: -webkit-gradient(linear, center top, center bottom, from(#a4ccec), color-stop(25%, #72a6d4), color-stop(45%, #3282c2), color-stop(85%, #357cbd), to(#72a6d4)); /* webkit gradient background */
            }

            .gradientbuttons li a:hover{
                color: lightyellow;
            }

            .redtheme li a{
                font-size:18px;
                background: darkred;
                background: -moz-linear-gradient(center top, #f5795d, #e55e3f 25%, #d02700 45%, #e55e3f 85%, #f5795d);
                background: -webkit-gradient(linear, center top, center bottom, from(#f5795d), color-stop(25%, #e55e3f), color-stop(45%, #d02700), color-stop(85%, #e55e3f), to(#f5795d)); 
            }

            .greentheme li a{
                font-size:12px;
                background: green;
                background: -moz-linear-gradient(center top, #7ad690, #3ec05c 25%, #298a40 45%, #3ec05c 85%, #7ad690);
                background: -webkit-gradient(linear, center top, center bottom, from(#7ad690), color-stop(25%, #3ec05c), color-stop(45%, #298a40), color-stop(85%, #3ec05c), to(#7ad690)); 
            }

            .blacktheme li a{
                font-size:16px;
                background: black;
                background: -moz-linear-gradient(center top, #9f9f9f, #686868 25%, #2a2a2a 45%, #686868 85%, #9f9f9f);
                background: -webkit-gradient(linear, center top, center bottom, from(#9f9f9f), color-stop(25%, #686868), color-stop(45%, #2a2a2a), color-stop(85%, #686868), to(#9f9f9f)); 
            }

            .orangetheme li a{
                font-size:14px;
                background: #e55e3f;
                background: -moz-linear-gradient(center top, #ecad9a, #e5937c 25%, #cf4c2a 45%, #e5937c 85%, #ecad9a);
                background: -webkit-gradient(linear, center top, center bottom, from(#ecad9a), color-stop(25%, #e5937c), color-stop(45%, #cf4c2a), color-stop(85%, #e5937c), to(#ecad9a)); 
            }

        </style>

    </head>
    <body>
        <div align="right">
            <ul class="gradientbuttons bluetheme">
                <li><a href="addType.jsp">Add New Type</a></li>
                <li><a href="index.jsp">Add Items</a></li>
                <li><a href="addSupplier.jsp">Add Supplier</a></li>
                <li><a href="search_item.jsp" class="selected">Search Item</a></li>
                <li><a href="application.jsp">List Items</a></li>
                <li><a href="check.jsp">Check</a></li>
            </ul>
        </div>

        <h2>Add Items</h2>
        <p> 
        <pre>Complete The Fields Below To Add An Item</pre>
    </p>

    <table border="1"  align="center" >
        <tr>
            <th>
                Item Id
            </th>
            <th>
                Item Name  
            </th>
            <th>
                Quantity
            </th>
            <th>
                Unit
            </th>

            <th >
                Price(¢)
            </th>
            <th>
                Item Supplier
            </th>
            <th>
                Entry Date
            </th>
            <th>
                Expiring Date
            </th>
            <th>
                Item Type
            </th>
        </tr>
        <%

            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

            HMSHelper itm = new HMSHelper();

            List itmss = itm.listSuppliers();
            List type1 = itm.listItemType();



        %>              
        <tbody>
        <form action="addItem.jsp" method="post" onsubmit="return validateForm();" name="items" >
            <tr >


            </tr>
            <tr>
                <td><input type="text" name="code"></td>
                <td><input type="text" name="items"></td>
                <td ><input style="width: 60px;" type="number" name="quantity"></td>
                <td><input type="text" name="unit" ></td>
                <td><input  style="width: 60px;" type="number"  name="price"></td>
                    <%--  <td><input type="text" name="supplier" ></td> --%>
                <td>


                    <select name="supplier">
                        <option>
                            Select Supplier
                        </option>
                        <%   for (int i = 0; i < itmss.size(); i++) {
                            Post itt = (Post) itmss.get(i);

                            String supplier = itt.getFirstName();%>
                        <option>
                            <%=supplier%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <td><input type="date" name="date"  id="datepicker"></td>
                <td><input type="date" name="expDate" id="datepicker1" ></td>
                <td> <select name="type">
                        <option>
                            Select Item Type
                        </option>
                        <%   for (int i = 0; i < type1.size(); i++) {
                                  Itemtype itt = (Itemtype) type1.get(i);

                                  String itemType = itt.getItemType();%>
                        <option>
                            <%= itemType%>
                        </option>
                        <% }%>
                    </select>
                </td>
            </tr>



            </tbody>  
    </table>
    <input type="hidden" name="eq" value="0">
    <input type="hidden" name="rq" value="0">
    <input type="hidden" name="drug" value="Choose Drug Type">
    <input type="hidden" name="locationId" value="Enter Drud Location">
    <input type="submit" name ="action" value="Add Item"  id="b">
</form>


</body>
<script type="text/javascript">
    function validateForm()
    {
        var x=document.forms["items"]["items"].value;
        if (x==null || x=="")
        {
            alert("Item must be filled out");
            return false;
        }


        var x=document.forms["items"]["item_quantity"].value;
        if (x==null || x=="")
        {
            alert("Quantity must be filled out");
            return false;
        }
        var x=document.forms["items"]["price_per_item"].value;
        if (x==null || x=="")
        {
            alert("Price must be filled out");
            return false;
        }
        var x=document.forms["items"]["date"].value;
        if (x==null || x=="")
        {
            alert("Date must be filled out");
            return false;
        }
        var x=document.forms["items"]["exp_date"].value;
        if (x==null || x=="")
        {
            alert("Expiring Date must be filled out");
            return false;
        }
    }


</script>
<script type="text/javascript">
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

</html>