<%@page import="entities.*,java.util.List"%>

<div id="dialog" style="display: none;" title="New Patient">
    <form action="action/registrationaction.jsp" method="POST" class="form-horizontal well">
        <fieldset>
            <div class="pre_first_half">
                <div class="control-group">
                    <label class="control-label" for="input01">Folder Number</label>
                    <div class="controls">
                        <input type="text" name="patientid"  id="input01"/>
                        <p class="help-inline">
                            Patient ID
                        </p>
                    </div>
                </div>

            </div>
            <div class="first_half">
                <div class="control-group">
                    <label class="control-label" for="input01">First Name</label>
                    <div class="controls">
                        <input  type="text" name="fname"  id="input01"/>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="input01">Last Name</label>
                    <div class="controls">
                        <input type="text" name="lname"  id="input01"/>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="input01">Middle Name</label>
                    <div class="controls">
                        <input type="text" name="midname"  id="input01"/>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="input01">Gender</label>
                    <div class="controls">
                        <select name="gender" id="select01">
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                        <p class="help-inline">

                        </p>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputError">Date of Birth</label>
                    <div class="controls">
                        <input name="dob" class="input-mini">
                        <input name="dob" class="input-mini">
                        <input name="dob" class="input-mini">
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
                        <textarea type="text" name="address" id="inputSuccess"></textarea>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputSuccess">Telephone No.</label>
                    <div class="controls">
                        <input type="text" name="contact" id="inputSuccess"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputSuccess">Emergency Telephone No.</label>
                    <div class="controls">
                        <input type="text" name="emergencycontact" id="inputSuccess"/>
                        <span class="help-inline"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputSuccess">Email</label>
                    <div class="controls">
                        <input type="text" name="email" id="inputSuccess"/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="selectError">Sponsorship Method</label>
                    <div class="controls">
                        <select name="type">
                            <option value="nhis">National Health Insurance</option>
                            <option value="cash">Out of Pocket </option>
                            <option value="private">Private Health Insurance</option>
                            <option value="cooperate">Corperate</option>
                        </select>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="selectError">Sponsors</label>
                    <div class="controls">
                        <select name="sponsorid">
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
                    <label class="control-label" name="membershipid" for="inputSuccess">Membership ID</label>
                    <div class="controls">
                        <input type="text" id="inputSuccess"/>
                        <span class="help-inline"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" name="benefitplan" for="inputSuccess">Benefit Plan</label>
                    <div class="controls">
                        <input type="text" id="inputSuccess"/>
                        <span class="help-inline"></span>
                    </div>
                </div>


                <div class="form-actions">
                    <button type="submit" value="patient" class="btn ui-primary ">
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