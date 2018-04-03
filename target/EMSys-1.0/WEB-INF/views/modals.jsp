<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Add Event Modal #HostInfo -->
<div class="modal fade" id="addEventHostModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Add an Event</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Host Information</h3><br>
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="hostName" type="text" placeholder="Host Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="hostContact" type="text" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="hostEmail" type="text" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Address: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input class="form-control" name="address" id="hostAddress" type="text" placeholder="Full Address Line"/>
                        </div>
                    </div>
                    <input type ="checkbox" checked disabled style="display:none"/>
                </form>
            </div>
            <div class="modal-footer">
                <span data-toggle="modal" data-target="#addEventModal">
                    <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Save and Go to Fill Event Info">Save and Go to Fill Event Info</button>
                </span>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>



<!-- Add Event Modal #EventInfo -->
<div class="modal fade" id="addEventModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Add an Event</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Event Information</h3><br>
                <table width="100%">
                    <tr>
                        <td colspan="5"><label>Type of Event: </label></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <select name="type" id="eventType" class="form-control">
                                <c:forEach var="e" items="${events}">
                                    <option value="${e.type}">${e.type}</option>
                                </c:forEach>
                                <option value="" disabled selected>-- Select an Event Type --</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <table width="95%" align="center">
                    <tr>
                        <td colspan="3"></td>
                        <td colspan="2" style="color:#a57d89; font-family: Georgia"><h3>Scheduling</h3></td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Name: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                <input class="form-control" name="name" id="eventName" type="text" placeholder="Name of your Event" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td style="color:white">________</td>
                        <td><label>Start Date:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                <input maxlength="10" class="form-control" name="startDate" id="eventStartDate" type="text" placeholder="Start Date of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Venue:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-star"></i></span>
                                <input class="form-control" name="venue" id="eventVenue" type="text" placeholder="Venue" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>End Date:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                <input maxlength="10" class="form-control" name="endDate" id="eventEndDate" type="text" placeholder="End Date of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Address:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input class="form-control" name="address" id="eventAddress" type="text" placeholder="Full Address Line" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>Starting Time:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                <input maxlength="5" class="form-control" name="startTime" id="eventStartTime" type="text" placeholder="Start Time of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Budget:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"> &#8377;&nbsp;</span>
                                <select name="budget" class="form-control" id="eventBudget">
                                    <option value="">0 - 1,00,000</option>
                                    <option value="">1,00,000 - 5,00,000</option>
                                    <option value="">5,00,000 - 10,00,000</option>
                                    <option value="">10,00,000 - 50,00,0000</option>
                                    <option value="" disabled selected>Select a Budget Range</option>
                                </select>
                                <span class="input-group-addon">.00/-</span>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>Ending Time:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                <input maxlength="5" class="form-control" name="endTime" id="eventEndTime" type="text" placeholder="End Time of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Estimated<br>Number<br> of Guests:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                                <input class="form-control" name="estGuests" id="eventEstGuests" type="text" placeholder="Estimated Number of Guests" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                </table>
                <table width="100%">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Attractions:</label></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <select name="attractionPkgId" class="form-control" id="eventAttractionPkgId">
                                <c:forEach var="ap" items="${ap}">
                                    <option value="${ap.id}">${ap.name}</option>
                                </c:forEach>
                                <option value="" disabled selected>Select an Attraction Package</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div> 

            <div class="modal-footer">
                <button id="hideHost" type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Create Event">Create Event</button>
                <button id="hideHost2" type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<!--Stall Modal-->
<div class="modal fade" id="stallModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Stalls</h2>
            </div>
            <div class="modal-body">
                <img src="${pageContext.request.contextPath}/static/tools.png" width="50" style="display: block;margin-left: auto;margin-right: auto">
                <h3 style="color:#a57d89; font-family: Georgia; text-align:center">This section of the site is under construction.<br> It will be up and running soon.</h3><br>
                <img src="${pageContext.request.contextPath}/static/construction.gif" style="display: block;margin-left: auto;margin-right: auto">
            </div>
            <div class="modal-footer">
                <span data-toggle="modal" data-target="#addEventModal">
                    <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Save Changes">Save Changes</button>
                </span>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>


<!-- Add Contact Modal -->
<div class="modal fade" id="addContactModal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Add a Contact</h2>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="contactName" type="text" placeholder="Contact Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="contactContact" type="text" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="contactEmail" type="text" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Organization: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                            <input class="form-control" name="organization" id="contactOrganization" type="text" placeholder="Name of Organization"/>
                        </div>
                    </div>
                    <input type ="checkbox" checked disabled style="display:none"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Add">Add</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>



<!-- Send Invitation(s) modal -->
<div class="modal fade" id="mailModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Send Invitations</h2>
            </div>
            <div class="modal-body">
                <form>
                    <table width="45%" style="float:left;position:relative;top:80px;left:10px">
                        <tr>
                            <td><label>To: </label></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input class="form-control" name="email" id="to" type="text" placeholder="example@example.com" value=""/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <select name="mailTemplates" id="mailTemplates" class="form-control">
                                        <c:forEach var="e" items="${events}">
                                            <option value="${e.name}">${e.name}</option>
                                        </c:forEach>
                                        <option value="" disabled selected>Select an Event</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Subject: </label></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-tag"></span></span>
                                    <input class="form-control" name="subject" id="subject" type="text" placeholder="Subject of your email"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table width="50%" style="position:relative;left:30px">
                        <tr>
                            <td><label>Body: </label></td>
                        </tr>
                        <tr>
                            <td><textarea rows='17' cols='55' style="border-radius:3px;padding:15px;resize:none;border:1px solid #e8e8e8;box-shadow: 1px 1px 1px #e8e8e8" placeholder="Body of Your Email"></textarea></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-lg" style="background-color:#89a57d;color:white;width: 100%" data-toggle="tooltip" title="Send Mail">
                    <span class="glyphicon glyphicon-send"></span> Send</button>
            </div>
        </div>
    </div>
</div>



<!-- Add Event Contact Modal -->
<div class="modal fade" id="eventContactModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Add an Event Contact</h2>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="eventContactName" type="text" placeholder="Event Contact Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="contactContact" type="text" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="eventContactEmail" type="text" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Role: </label>
                        <select name="type" id="eventRole" class="form-control">
                            <c:forEach var="ec" items="${ec}">
                                <option value="${ec.role}">${ec.role}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select a ROLE --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Designated Event: </label>
                        <select name="type" id="eventRole" class="form-control">
                            <c:forEach var="e" items="${events}">
                                <option value="${e.id}">${e.name}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select an Event --</option>
                        </select>
                    </div>
                    <input type ="checkbox" checked disabled style="display:none"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Add">Add</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>



<!-- Edit Event Modal -->
<div class="modal fade" id="editEventModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Edit Event Event:</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Event Information</h3><br>
                <table width="100%">
                    <tr>
                        <td colspan="5"><label>Type of Event: </label></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <select name="type" id="eventType" class="form-control">
                                <c:forEach var="e" items="${events}">
                                    <option value="${e.type}">${e.type}</option>
                                </c:forEach>
                                <option value="" disabled selected>-- Select an Event Type --</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <table width="95%" align="center">
                    <tr>
                        <td colspan="3"></td>
                        <td colspan="2" style="color:#a57d89; font-family: Georgia"><h3>Scheduling</h3></td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Name: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                <input class="form-control" name="name" id="eventName" type="text" placeholder="Name of your Event" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td style="color:white">________</td>
                        <td><label>Start Date:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                <input maxlength="10" class="form-control" name="startDate" id="eventStartDate" type="text" placeholder="Start Date of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Venue:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-star"></i></span>
                                <input class="form-control" name="venue" id="eventVenue" type="text" placeholder="Venue" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>End Date:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                <input maxlength="10" class="form-control" name="endDate" id="eventEndDate" type="text" placeholder="End Date of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Address:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input class="form-control" name="address" id="eventAddress" type="text" placeholder="Full Address Line" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>Starting Time:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                <input maxlength="5" class="form-control" name="startTime" id="eventStartTime" type="text" placeholder="Start Time of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Budget:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"> &#8377;&nbsp;</span>
                                <select name="budget" class="form-control" id="eventBudget">
                                    <option value="">0 - 1,00,000</option>
                                    <option value="">1,00,000 - 5,00,000</option>
                                    <option value="">5,00,000 - 10,00,000</option>
                                    <option value="">10,00,000 - 50,00,0000</option>
                                    <option value="" disabled selected>Select a Budget Range</option>
                                </select>
                                <span class="input-group-addon">.00/-</span>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>Ending Time:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                <input maxlength="5" class="form-control" name="endTime" id="eventEndTime" type="text" placeholder="End Time of Event" style="width:100%; display:inline-block;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Estimated<br>Number<br> of Guests:</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                                <input class="form-control" name="estGuests" id="eventEstGuests" type="text" placeholder="Estimated Number of Guests" style="width:80%; display:inline-block;"/>
                            </div>
                        </td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                </table>
                <table width="100%">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label>Attractions:</label></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <select name="attractionPkgId" class="form-control" id="eventAttractionPkgId">
                                <c:forEach var="ap" items="${ap}">
                                    <option value="${ap.id}">${ap.name}</option>
                                </c:forEach>
                                <option value="" disabled selected>Select an Attraction Package</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div> 

            <div class="modal-footer">
                <button id="hideHost" type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Save">Update</button>
                <button id="hideHost2" type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>



<!-- Delete Event Modal -->
<div class="modal fade" id="deleteEventModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Delete and Event</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Are you sure you want to delete the event with the following specifications?</h3><br><br>
                <table width="70%">
                    <tr style="color:#a57d89">
                        <td><label>Event Name: </label></td>
                        <td><span type="text" class="eventName" style="font-weight:bold;color:black"/></td>
                    </tr>
                    <tr style="color:#a57d89">
                        <td><label>Type: </label></td>
                        <td><span type="text" class="eventType" style="font-weight:bold;color:black"></td>
                    </tr>
                    <tr style="color:#a57d89">
                        <td><label>Host: </label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="color:#a57d89">
                        <td><label>Venue: </label></td>
                        <td><span type="text" class="eventVenue" style="font-weight:bold;color:black"/></td>
                    </tr>
                    <tr style="color:#a57d89">
                        <td><label>Address: </label></td>
                        <td><span type="text" class="eventAddress" style="font-weight:bold;color:black"/></td>
                    </tr>
                    <tr style="color:#a57d89">
                        <td><label>Status: </label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Delete">Yes</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>


<!--Edit Host Modal-->
<div class="modal fade" id="editEventHostModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Edit Host Information</h2>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="hostName" type="text" placeholder="Host Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="hostContact" type="text" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="hostEmail" type="text" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Address: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input class="form-control" name="address" id="hostAddress" type="text" placeholder="Full Address Line"/>
                        </div>
                    </div>
                    <input type ="checkbox" checked disabled style="display:none"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Update">Update</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<!--Delete Host Modal-->
<!--Host Information will be deleted when Event will be deleted since they are interlinked-->


<!--Edit Contact Modal-->
<div class="modal fade" id="editContactModal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Edit Contact</h2>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="contactName" type="text" placeholder="Contact Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="contactContact" type="text" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="contactEmail" type="text" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Organization: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                            <input class="form-control" name="organization" id="contactOrganization" type="text" placeholder="Name of Organization"/>
                        </div>
                    </div>
                    <input type ="checkbox" checked disabled style="display:none"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Update">Update</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<!--Delete Contact Modal-->
<div class="modal fade" id="deleteContactModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Delete Contact</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Are you sure you want to delete the contact with the following specifications?</h3><br><br>
                <table width="50%" align="center">
                    <form>
                        <div class="form-group">
                            <tr>
                                <td><label>Name: </label></td>
                            </tr>
                            <tr>
                                <td><div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input class="form-control" name="name" id="delName" type="text" disabled/>
                                    </div>
                                </td>
                            </tr><tr><td>&nbsp;</td></tr>
                        </div>
                        <div class="form-group">
                            <tr>
                                <td><label>Contact: </label></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                        <input disabled maxlength="10" class="form-control" id="delContact" name="contact" type="text"/>
                                    </div>
                                </td>
                            </tr><tr><td>&nbsp;</td></tr>
                        </div>
                        <div class="form-group">
                            <tr>
                                <td><label>Email: </label></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-addon">@</span>
                                        <input disabled class="form-control" id="delEmail" name="email" type="text"/>
                                    </div>
                                </td>
                            </tr><tr><td>&nbsp;</td></tr>
                        </div>
                        <div class="form-group">
                            <tr>
                                <td><label>Organization: </label></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                        <input disabled class="form-control" id="delOrg" name="organization" type="text"/>
                                    </div>
                                </td>
                            </tr><tr><td>&nbsp;</td></tr>
                        </div>
                        <input type ="checkbox" checked disabled style="display:none"/>
                    </form>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Delete">Yes</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>

<!--Edit Event Contact Modal-->
<div class="modal fade" id="editEventContactModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Edit Event Contact</h2>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="eventContactName" type="text" placeholder="Event Contact Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="eventContactContact" type="text" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="eventContactEmail" type="text" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Role: </label>
                        <select name="type" id="eventRole" class="form-control">
                            <c:forEach var="ec" items="${ec}">
                                <option value="${ec.role}">${ec.role}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select a ROLE --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Designated Event: </label>
                        <select name="type" id="eventRole" class="form-control">
                            <c:forEach var="e" items="${events}">
                                <option value="${e.id}">${e.name}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select an Event --</option>
                        </select>
                    </div>
                    <input type ="checkbox" checked disabled style="display:none"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Update">Update</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<!--Delete Event Contact Modal-->
<div class="modal fade" id="deleteEventContactModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Delete Event Contact</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Are you sure you want to delete the Event Contact with the following specifications?</h3><br><br>
                <form>
                    <div class="form-group">
                        <label>Name: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" name="name" id="delEcName" type="text" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input maxlength="10" class="form-control" name="contact" id="delEcContact" type="text" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" id="delEcEmail" type="text" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Role: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-sunglasses"></span></span>
                            <input class="form-control" name="role" id="delEcRole" type="text" disabled/>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Delete">Yes</button>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>


<!-- Send Multiple Invitation(s) modal -->
<div class="modal fade" id="mailMultiModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Send Invitations</h2>
            </div>
            <div class="modal-body">
                <form>
                    <table width="45%" style="float:left;position:relative;top:80px;left:10px">
                        <tr>
                            <td><label>To: </label></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input class="form-control" name="email" id="multiTo" type="text" placeholder="example@example.com" value=""/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <select name="mailTemplates" id="multiMailTemplates" class="form-control">
                                        <c:forEach var="e" items="${events}">
                                            <option value="${e.name}">${e.name}</option>
                                        </c:forEach>
                                        <option value="" disabled selected>Select an Event</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Subject: </label></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-tag"></span></span>
                                    <input class="form-control" name="subject" id="multiSubject" type="text" placeholder="Subject of your email"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table width="50%" style="position:relative;left:30px">
                        <tr>
                            <td><label>Body: </label></td>
                        </tr>
                        <tr>
                            <td><textarea rows='17' cols='55' style="border-radius:3px;padding:15px;resize:none;border:1px solid #e8e8e8;box-shadow: 1px 1px 1px #e8e8e8" placeholder="Body of Your Email"></textarea></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-lg" style="background-color:#89a57d;color:white;width: 100%" data-toggle="tooltip" title="Send Mail">
                    <span class="glyphicon glyphicon-send"></span> Send</button>
            </div>
        </div>
    </div>
</div>