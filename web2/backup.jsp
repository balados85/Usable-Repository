<%-- 
    Document   : home
    Created on : Jun 26, 2012, 10:23:18 AM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <%@include file="widgets/subhead.jsp" %>

            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <div style="height: 100%; position: fixed;" class="span3">
                        <ul style="display: none; " class="menu">
                            <li class="item1">
                                <a  href="#"><i class="icon-folder-open"></i> Patient Management <span>340</span></a>

                            </li>
                            <li class="item2">
                                <a href="#"><i class=" icon-user"></i> Staff Management <span>147</span></a>

                            </li>
                            <li class="item3">
                                <a href="#"><i class="icon-share"></i> Sponsorship <span>340</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="#">Cute Kittens <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="#">Strange “Stuff” <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="#">Automatic Fails <span>2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item4">
                                <a href="#"><i class="icon-check"></i> Podcasts <span>222</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="#">Cute Kittens <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="#">Strange “Stuff” <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="#">Automatic Fails <span>2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item5">
                                <a href="#"> <i class="icon-move"></i> Robots <span>16</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="#">Cute Kittens <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="#">Strange “Stuff” <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="#">Automatic Fails <span>2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item1">
                                <a href="#"><i class="icon-user"></i> Friends <span>340</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="#">Cute Kittens <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="#">Strange “Stuff” <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="#">Automatic Fails <span>2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item2">
                                <a href="#"><i class="icon-search"></i> Videos <span>147</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="#">Cute Kittens <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="#">Strange “Stuff” <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="#">Automatic Fails <span>2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item3">
                                <a href="#"><i class="icon-share"></i> Galleries <span>340</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="#">Cute Kittens <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="#">Strange “Stuff” <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="#">Automatic Fails <span>2</span></a>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>

                    <div style="display: none;" class="span9 offset3 thumbnail well content">

                        <ul style="margin-left: 0px;" class="breadcrumb span4">
                            <li>
                                <a >Patient Management</a>
                            </li>
                        </ul>
                        <div style="margin-bottom: 20px;" class="btn-group pull-right">
                            <button  id="dialog_link" class="btn btn-large ">
                                <i class="icon-pencil "></i> New
                            </button>
                            <button id="view_user" class="btn btn-large">
                                <i class="icon-edit"> </i> View
                            </button>
                            <button  id="modal_link" class="btn btn-large">
                                <i class="icon-edit"> </i> Edit
                            </button>
                            <button id="dialog_link"  class="btn btn-large">
                                <i class="icon-remove"> </i> Delete
                            </button>
                            <div class="clearfix"></div>
                        </div>

                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>
                                <tr>
                                    <th>Member ID </th>
                                    <th>Name </th>
                                    <th>Sponsor</th>
                                    <th>Policy Number</th>
                                    <th>Contact Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> Emmanuel Addo-Yirenkyi </h5> <h5><b> Date of Birth :</b> 15th April, 2012 </h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender </td> <td> Male </td> </tr>  <tr> <td> Employer </td> <td> Claimsync </td> </tr>  <tr> <td> Sponsor </td> <td> Company </td> </tr> <tr>
                                        <td> Policy Number </td> <td> MOM1342 </td> </tr> <tr> <td> Benefit Plan </td> <td> Gold </td> </tr>  </table> "><a href="#" class="normal">MOM1235 </a></td><td>Kwasi Nkwasah Aboagye
                                        Explorer 4.0</td><td>Win 95+</td><td class="center"> 4</td><td class="center">X</td> </a>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>

            </section>

            <%@include file="widgets/footer.jsp" %>

        </div><!-- /container -->



        <%@include file="widgets/javascripts.jsp" %>



        <%@include file="widgets/loaded.jsp" %>
    </body>
</html>
