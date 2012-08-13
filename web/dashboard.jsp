<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>

<!DOCTYPE html>
<html>
    <head>


        <%@include file="widgets/stylesheets.jsp" %>
        <%@include file="widgets/javascripts.jsp" %>
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


                        <!--Statistic-->
                        <div class="grid-1">
                            <div class="title-grid">Statistics Summary</div>
                            <div class="content-gird">
                                <div class="reports">
                                    <div class="report">
                                        <p class="report-title">Number of Patients</p>
                                        <p class="report-figures">933,273 </p>
                                        <div class="clear"></div>
                                        <div class="headway"><div class="advance" style="width:100%;"></div></div>
                                    </div>

                                    <div class="report">
                                        <p class="report-title">Most Prevalent Diagnosis (Tuberculosis) </p>
                                        <p class="report-figures">933,273 </p>
                                        <div class="clear"></div>
                                        <div class="headway"><div class="advance" style="width:70%;"></div></div>
                                    </div>
                                    <div class="report-2">
                                        <p class="report-title">In-Patients</p>
                                        <p class="report-figures">912</p>
                                        <div class="clear"></div>
                                        <div class="headway"><div class="advance" style="width:80%;"></div></div>
                                    </div>

                                    <div class="report-2 report-last">
                                        <p class="report-title">Out-Patients</p>
                                        <p class="report-figures">35%</p>
                                        <div class="clear"></div>
                                        <div class="headway"><div class="advance" style="width:35%;"></div></div>
                                    </div>


                                </div>
                                <div class="chart chart-main"></div>  
                                <div class="clear"></div>
                            </div>
                        </div>  
                        <!--Statistic end--> 



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



                        <div class="grid-1">
                            <div class="title-grid">Staff List</div>
                            <div class="content-gird">

                                <div id="slider-contact">
                                    <div class="slider-content">
                                        <ul>
                                            <li id="a"><a name="a" class="title">A</a>
                                                <ul>
                                                    <li><a href="/">Adam</a></li>
                                                    <li><a href="/">Alex</a></li>
                                                    <li><a href="/">Ali</a></li>
                                                    <li><a href="/">Apple</a></li>
                                                    <li><a href="/">Arthur</a></li>
                                                    <li><a href="/">Ashley</a></li>
                                                </ul>
                                            </li>
                                            <li id="b"><a name="b" class="title">B</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="c"><a name="c" class="title">c</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="d"><a name="d" class="title">d</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="e"><a name="e" class="title">E</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="f"><a name="f" class="title">f</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="g"><a name="g" class="title">g</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="h"><a name="h" class="title">h</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="i"><a name="i" class="title">i</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="j"><a name="j" class="title">j</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="k"><a name="k" class="title">k</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="l"><a name="l" class="title">l</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="m"><a name="m" class="title">m</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="n"><a name="n" class="title">n</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="o"><a name="o" class="title">o</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="p"><a name="p" class="title">p</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="q"><a name="q" class="title">q</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="r"><a name="r" class="title">r</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="s"><a name="s" class="title">s</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="t"><a name="t" class="title">t</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="u"><a name="u" class="title">u</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="v"><a name="v" class="title">v</a>
                                                <ul>
                                                    <li><a href="/">Barry</a></li>
                                                    <li><a href="/">Becky</a></li>
                                                    <li><a href="/">Biff</a></li>
                                                    <li><a href="/">Billy</a></li>
                                                    <li><a href="/">Bozarking</a></li>
                                                    <li><a href="/">Bryan</a></li>
                                                </ul>
                                            </li>
                                            <li id="w"><a name="w" class="title">w</a>
                                                <ul>
                                                    <li><a href="/">Calista</a></li>
                                                    <li><a href="/">Cathy</a></li>
                                                    <li><a href="/">Chris</a></li>
                                                    <li><a href="/">Cinderella</a></li>
                                                    <li><a href="/">Corky</a></li>
                                                    <li><a href="/">Cypher</a></li>
                                                </ul>
                                            </li>
                                            <li id="x"><a name="x" class="title">x</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="y"><a name="y" class="title">y</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                            <li id="z"><a name="z" class="title">z</a>
                                                <ul>
                                                    <li><a href="/">damien</a></li>
                                                    <li><a href="/">danny</a></li>
                                                    <li><a href="/">denver</a></li>
                                                    <li><a href="/">devon</a></li>
                                                    <li><a href="/">doug</a></li>
                                                    <li><a href="/">dustin</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>


                            </div>
                        </div>  
                        <!--Contacts end-->

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