<%-- 
    Document   : search_item
    Created on : Jun 25, 2012, 10:31:32 AM
    Author     : Lisandro
--%>

<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Search Item</title>
        <script type="text/javascript" src="jquery-1.4.2.js"></script>

        <style type="text/css">
            body {
                font-family: Helvetica;
                font-size: 13px;
                color: #000;
            }
            h3 {
                margin: 0px;
                padding: 0px;
            }
            .suggestionsBox {
                position: relative;
                left: 260px;
                margin: 0px 0px 0px 0px;
                width: 200px;
                background-color: #7845DD;
                -moz-border-radius: 7px;
                -webkit-border-radius: 7px;
                border: 2px solid #000;
                color: #fff;
            }
            .suggestionList {
                margin: 0px;
                padding: 0px;
            }
            .suggestionList li {




                margin: 0px 0px 3px 0px;
                padding: 3px;
                cursor: pointer;
            }
            .suggestionList li:hover {
                background-color: #DD45CD;
            }

            form{

            }

            body {
                background-color: #FFF;
                background-image: url(images/09.gif);
            }
            #b
            {
                background-color:#8BC500;
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
                <li><a href="addType.jsp">Add New Types</a></li>
                <li><a href="index.jsp">Add Items</a></li>
                <li><a href="search_item.jsp" class="selected">Search Item</a></li>
                <li><a href="application.jsp">List Items</a></li>
                <li><a href="check.jsp">Check</a></li>
            </ul>
        </div>
        <p align="center"><h3>Complete The Field Below To Search For An Item</h3></p>
        <form action="item_search.jsp" method="post" name="frm" >
            <fieldset>
                <legend>Search By Item Name</legend>
                <label>Search Item :</label>
                <input type="text" name="items"></input>
                <input type="submit" value="search"></input>
            </fieldset>
        </form>

        <form action="category_Search.jsp" method="post" name="frm1" >
            <fieldset>
                <legend>Search By Category Name</legend>
                <select name="type">
                    <option>
                        Choose Item Type
                    </option>
                    <option>
                        Laboratory Items
                    </option>
                    <option>
                        Cleaning And Detergents
                    </option>
                    <option>
                        Stationary
                    </option>
                    <option>
                        Dressing And Injection
                    </option>
                    <option>
                        Drug
                    </option>
                </select>
                <input type="submit" value="search"></input>
            </fieldset>
        </form>

    </body>
</html>
