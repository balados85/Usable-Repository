<%@page import="entities.*,java.util.List"%>

<div id="dialog" class="hide"  title="New Patient">
    <form id="register" action="action/registrationaction.jsp"  method="POST" class="form-horizontal well">
        <fieldset>
            <div class="pre_first_half">
                <div class="control-group">
                    <label class="control-label" for="input01"><em class="required"></em>Folder Number</label>
                    <div class="controls">
                        <input type="text" class="required" name="patientid"  id="folder_name"/>
                        <p class="help-inline">
                            Patient ID
                        </p>
                    </div>
                </div>

            </div>
            <div class="first_half">
                <div class="control-group">
                    <label class="control-label" for="input01"><em class="required"></em>First Name</label>
                    <div class="controls">
                        <input  type="text" class="required" name="fname"  id="fname"/>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="input01"><em class="required"></em>Last Name</label>
                    <div class="controls">
                        <input type="text" name="lname"  id="lname"/>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="input01"> <em class="required"></em>Middle Name</label>
                    <div class="controls">
                        <input type="text" name="midname"  id="midname"/>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label required" for="input01"><em class="required"></em>Gender</label>
                    <div class="controls">
                        <select class="required" name="gender" id="gender">
                            <option value="Male">Male</option>
                            <option value="Female" >Female</option>
                        </select>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>
                

                <div class="control-group">
                    <label class="control-label" for="inputError"><em class="required"></em>Date of Birth</label>
                    <div class="controls">

                        <select class="input-mini" id="dob_d" name="dob_d">
                            <option value="0"> - Day - </option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                        </select>
                        <select class="input-small" id="dob_m" name="dob_m">
                            <option value="00"> - Month - </option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">August</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>



                        <select class="input-small" id="dob_y" name="dob_y">
                            <option value="0000"> - Year - </option>
                            <option value="2004">2004</option>
                            <option value="2003">2003</option>
                            <option value="2002">2002</option>
                            <option value="2001">2001</option>
                            <option value="2000">2000</option>
                            <option value="1999">1999</option>
                            <option value="1998">1998</option>
                            <option value="1997">1997</option>
                            <option value="1996">1996</option>
                            <option value="1995">1995</option>
                            <option value="1994">1994</option>
                            <option value="1993">1993</option>
                            <option value="1992">1992</option>
                            <option value="1991">1991</option>
                            <option value="1990">1990</option>
                            <option value="1989">1989</option>
                            <option value="1988">1988</option>
                            <option value="1987">1987</option>
                            <option value="1986">1986</option>
                            <option value="1985">1985</option>
                            <option value="1984">1984</option>
                            <option value="1983">1983</option>
                            <option value="1982">1982</option>
                            <option value="1981">1981</option>
                            <option value="1980">1980</option>
                            <option value="1979">1979</option>
                            <option value="1978">1978</option>
                            <option value="1977">1977</option>
                            <option value="1976">1976</option>
                            <option value="1975">1975</option>
                            <option value="1974">1974</option>
                            <option value="1973">1973</option>
                            <option value="1972">1972</option>
                            <option value="1971">1971</option>
                            <option value="1970">1970</option>
                            <option value="1969">1969</option>
                            <option value="1968">1968</option>
                            <option value="1967">1967</option>
                            <option value="1966">1966</option>
                            <option value="1965">1965</option>
                            <option value="1964">1964</option>
                            <option value="1963">1963</option>
                            <option value="1962">1962</option>
                            <option value="1961">1961</option>
                            <option value="1960">1960</option>
                            <option value="1959">1959</option>
                            <option value="1958">1958</option>
                            <option value="1957">1957</option>
                            <option value="1956">1956</option>
                            <option value="1955">1955</option>
                            <option value="1954">1954</option>
                            <option value="1953">1953</option>
                            <option value="1952">1952</option>
                            <option value="1951">1951</option>
                            <option value="1950">1950</option>
                            <option value="1949">1949</option>
                            <option value="1948">1948</option>
                            <option value="1947">1947</option>
                            <option value="1946">1946</option>
                            <option value="1945">1945</option>
                            <option value="1944">1944</option>
                            <option value="1943">1943</option>
                            <option value="1942">1942</option>
                            <option value="1941">1941</option>
                            <option value="1940">1940</option>
                            <option value="1939">1939</option>
                            <option value="1938">1938</option>
                            <option value="1937">1937</option>
                            <option value="1936">1936</option>
                            <option value="1935">1935</option>
                            <option value="1934">1934</option>
                            <option value="1933">1933</option>
                            <option value="1932">1932</option>
                            <option value="1931">1931</option>
                            <option value="1930">1930</option>
                            <option value="1929">1929</option>
                            <option value="1928">1928</option>
                            <option value="1927">1927</option>
                            <option value="1926">1926</option>
                            <option value="1925">1925</option>
                            <option value="1924">1924</option>
                            <option value="1923">1923</option>
                            <option value="1922">1922</option>
                            <option value="1921">1921</option>
                            <option value="1920">1920</option>
                            <option value="1919">1919</option>
                            <option value="1918">1918</option>
                            <option value="1917">1917</option>
                            <option value="1916">1916</option>
                            <option value="1915">1915</option>
                            <option value="1914">1914</option>
                            <option value="1913">1913</option>
                            <option value="1912">1912</option>
                            <option value="1911">1911</option>
                            <option value="1910">1910</option>
                            <option value="1909">1909</option>
                            <option value="1908">1908</option>
                            <option value="1907">1907</option>
                            <option value="1906">1906</option>
                            <option value="1905">1905</option>
                            <option value="1904">1904</option>
                            <option value="1903">1903</option>
                            <option value="1902">1902</option>
                            <option value="1901">1901</option>
                            <option value="1900">1900</option>
                        </select>


                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="form-actions first">
                    <button type="button" class="btn ui-primary continue">
                        <i class="icon-ok"></i> Continue
                    </button>
                    <button type="button" class="btn btn-inverse close_dialog">
                        <i class="icon-off icon-white"></i> Cancel
                    </button>

                </div>

            </div>
            <div class="second_half" style="display: none;">
                <div class="control-group">
                    <label class="control-label" for="inputSuccess">Address</label>
                    <div class="controls">
                        <textarea type="text" name="address" id=address"></textarea>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputSuccess">Telephone No.</label>
                    <div class="controls">
                        <input type="text" name="contact" id="contact"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputSuccess">Emergency Contact.</label>
                    <div class="controls">
                        <input type="text" name="emergencycontact" id="emergencyperson"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputSuccess"><em class="required"></em>Emergency Contacts' No.</label>
                    <div class="controls">
                        <input type="text" name="emergencycontact" id="emergencycontact"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputSuccess"><em class="required email"></em>Email</label>
                    <div class="controls">
                        <input type="text" name="email" id="email"/>
                        <span class="help-inline"></span>
                    </div>
                </div>



                <div class="form-actions second">
                    <button type="button" class="btn ui-primary proceed">
                        <i class="icon-ok"></i> Continue
                    </button>
                    <button type="button" class="btn btn-info back">
                        <i class="icon-arrow-left icon-white"></i> Previous
                    </button>
                    <button type="button" class="btn btn-inverse close_dialog">
                        <i class="icon-off icon-white"></i> Cancel
                    </button>

                </div>
            </div>




            <div style="display: none;" class="third_half">

                <div class="control-group">
                    <label class="control-label"  for="inputSuccess"><em class="required"></em>Employer </label>
                    <div class="controls">
                        <input type="text" name="employer" id="employer"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="selectError"> <em class="required"></em> Sponsorship Method</label>
                    <div class="controls">
                        <select id="select_payment" name="type">
                            <option value="">Please Select</option>
                            <option value="nhis">National Health Insurance</option>
                            <option value="cash">Out of Pocket </option>
                            <option value="private">Private Health Insurance</option>
                            <option value="cooperate">Corporate</option>
                        </select>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div id="payment" class="hide">
                    <div class="control-group">
                        <label class="control-label" for="selectError"> Sponsors</label>
                        <div class="controls">
                            <select  name="sponsorid" id="sponsorid">
                                <%

                                    List Sponsors = mgr.listSponsors();
                                    for (int i = 0; i < Sponsors.size(); i++) {
                                        Sponsorship sponsor = (Sponsorship) Sponsors.get(i);
                                %>
                                <option value="<%=sponsor.getSponshorshipid()%>"><%=sponsor.getSponsorname()%></option> 
                                <% }

                                %>


                            </select>
                            <span class="help-inline"></span>
                        </div>
                    </div>


                    <div class="control-group">
                        <label class="control-label"  for="inputSuccess"> Membership ID</label>
                        <div class="controls">
                            <input type="text" name="membershipid" id="membershipid"/>
                            <span class="help-inline"></span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label required"  for="inputSuccess"> Benefit Plan</label>
                        <div class="controls">
                            <input type="text" name="benefitplan"  id="benefitplan"/>
                            <span class="help-inline"></span>
                        </div>
                    </div>

                </div> 


                <div class="form-actions">
                    <button type="submit" value="patient" name="action" class="btn ui-primary register_save">
                        <i class="icon-ok"></i> Save changes
                    </button>
                    <button type="button" class="btn btn-info previous">
                        <i class="icon-arrow-left icon-white"></i> Previous
                    </button>
                    <button type="button" class="btn btn-inverse close_dialog">
                        <i class="icon-off icon-white"></i> Cancel
                    </button>

                </div>

            </div>
        </fieldset>
    </form>
</div>