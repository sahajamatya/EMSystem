<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Add Event Modal #HostInfo -->
<div class="modal fade" id="addEventHostModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Add an Event</h2>
            </div>
<!--            <form method="post" action="${pageContext.request.contextPath}/addHost">-->
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Host Information</h3><br>
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
                <input type ="checkbox" id="hostStatus" checked style="display:none"/>
            </div>
            <div class="modal-footer">
                <span data-toggle="modal" data-target="#addEventModal">
                    <button id="passHostInfo" type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Save and Go to Fill Event Info">Save and Go to Fill Event Info</button>
                </span>
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
            </div>
            <!--            </form>-->
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
            <form method="post" action = "${pageContext.request.contextPath}/addEvent">
                <div style="display:none">
                    <input type="text" id="passHostName" name="passHostName"/>
                    <input type="text" id="passHostContact" name="passHostContact"/>
                    <input type="text" id="passHostEmail" name="passHostEmail"/>
                    <input type="text" id="passHostAddress" name="passHostAddress"/>
                    <input type="checkbox" id="passHostStatus" checked name="passHostStatus"/>
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
                                    <input class="form-control" name="startDate" id="eventStartDate" type="date" placeholder="Start Date of Event" style="width:100%; display:inline-block;"/>
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
                                    <input class="form-control" name="endDate" id="eventEndDate" type="date" placeholder="End Date of Event" style="width:100%; display:inline-block;"/>
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
                                    <input class="form-control" name="budget" id="eventBudget" type="text" placeholder="Budget for your Event" style="width:100%; display:inline-block;"/>
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
                    <input type="checkbox" checked name="status" style="display:none"/>
                </div> 

                <div class="modal-footer">
                    <button id="hideHost" type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Create Event">Create Event</button>
                    <button id="hideHost2" type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
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

                <div id="floor" style="width:600px;height:400px;position:relative;left:269px">
                    <table width="100%" height="100%" style="table-layout:fixed">
                        <tr>
                            <td rowspan="6" width="8.3%" style="border-right:1px solid black;border-bottom:1px solid black">&nbsp;</td>
                            <td width="8.3%" height="12.5%" style="border:1px solid black"><img src="${pageContext.request.contextPath}/static/TOILET.jpg"></td>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td height="12.5%" class="path"></td>
                            <%for (int i = 1; i <= 9; i++) {%>
                            <td id="drop_zone<%=i%>" ondrop="drag_drop(event)" ondragover="return false" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;text-align: center;font-size:50%;border-top:1px solid black;border-right:1px dotted grey;border-left: 1px dotted grey" valign="center"></td>
                            <%}%>
                            <td width="8.3%" style="border-left: 1px solid black"></td>
                        </tr>
                        <tr>
                            <%for (int i = 1; i <= 10; i++) {%>
                            <td class="path" height="12.5%"></td>
                            <%}%>
                            <td style="border-top:1px solid black;border-bottom:1px solid black;border-left:1px solid black"><img src="${pageContext.request.contextPath}/static/ENTRANCE.jpg"></td>
                        </tr>
                        <tr>
                            <td class="path">&nbsp;</td>
                            <%for (int i = 1; i <= 9; i++) {%>
                            <td id="drop_zone<%=i + 9%>" ondrop="drag_drop(event)" ondragover="return false" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;text-align: center;font-size:50%;border-right:1px dotted grey;border-left: 1px dotted grey" valign="center"></td>
                            <%}%>
                            <td rowspan="5" style="border-left:1px solid black">&nbsp;</td>
                        </tr>
                        <tr>
                            <%for (int i = 1; i <= 10; i++) {%>
                            <td class="path" height="12.5%"></td>
                            <%}%>
                        </tr>
                        <tr>
                            <%for (int i = 1; i <= 9; i++) {%>
                            <td height="12.5%" id="drop_zone<%=i + 18%>" ondrop="drag_drop(event)" ondragover="return false" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;text-align: center;font-size:50%;border-right:1px dotted grey;border-left: 1px dotted grey" valign="center"></td>
                            <%}%>
                            <td class="path"></td>
                        </tr>
                        <tr>
                            <td style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black"><img src="${pageContext.request.contextPath}/static/EXIT.jpg"></td>
                                <%for (int i = 1; i <= 10; i++) {%>
                            <td class="path" height="12.5%"></td>
                            <%}%>
                        </tr>
                        <tr>
                            <td height="12.5%" style="border-right:1px solid black"></td>
                            <%for (int i = 1; i <= 10; i++) {%>
                            <td id="drop_zone<%=i + 27%>" ondrop="drag_drop(event)" ondragover="return false" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;text-align: center;font-size:50%;border-bottom:1px solid black;border-right:1px dotted grey;border-left: 1px dotted grey" valign="center"></td>
                            <%}%>
                        </tr>
                    </table>
                </div>
                <div id="legend" style="height:400px;width:256px;position:absolute;top:15px;border-radius:5px">
                    <div id="legendContent" style="position: relative; left:15px">
                        <h4 style="font-family:Georgia">Pick stalls and drop on floor map:</h4>
                        <table style="font-size:80%;position:relative;top:30px">
                            <tr>
                                <td style="text-align: center;cursor:move" valign="top"><img id="food" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/FD.jpg"><br>Food Stall</td>
                                <td>&nbsp;</td>
                                <td style="text-align: center;cursor:move" valign="top"><img id="gaming" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/GM.jpg"><br>Gaming<br>Stall</td>
                                <td>&nbsp;</td>
                                <td style="text-align: center;cursor:move" valign="top"><img id="electronics" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/EL.jpg"><br>Electronics<br>Stall</td>
                            </tr><tr><td>&nbsp;</td></tr>
                            <tr>
                                <td style="text-align: center;cursor:move" valign="top"><img id="edu" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/EDU.jpg"><br>Educational<br>Institute<br>Stall</td>
                                <td>&nbsp;</td>
                                <td style="text-align: center;cursor:move" valign="top"><img id="car" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/CR.jpg"><br>Car Stall</td>
                                <td style="text-align: center;cursor:move">&nbsp;</td>
                                <td style="text-align: center;cursor:move" valign="top"><img id="bike" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/BK.jpg"><br>Bike Stall</td>
                            </tr><tr style="text-align: center;cursor:move"><td>&nbsp;</td></tr>
                            <tr>
                                <td>&nbsp;&nbsp;<img id="other" draggable="true" ondragstart="drag_start(event)" ondragend="drag_end(event)" style="border-radius:4px" src="${pageContext.request.contextPath}/static/Other.jpg"></td>
                            </tr>
                        </table>
                    </div>
                </div>
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
            <form method="post" action="${pageContext.request.contextPath}/insertOrUpdateContact">
                <div class="modal-body">

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
                    <input type ="checkbox" name="status" checked style="display:none"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="addContactBtn" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Add">Add</button>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
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
                            <td><textarea id="body" rows='17' cols='55' style="border-radius:3px;padding:15px;resize:none;border:1px solid #e8e8e8;box-shadow: 1px 1px 1px #e8e8e8" placeholder="Body of Your Email"></textarea></td>
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
            <form method="post" action="${pageContext.request.contextPath}/insertOrUpdateEventContact">
                <div class="modal-body">
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
                        <select name="role" id="eventRole" class="form-control">
                            <c:forEach var="ec" items="${ec}">
                                <option value="${ec.role}">${ec.role}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select a ROLE --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Designated Event: </label>
                        <select name="eventId.id" id="eventRole" class="form-control">
                            <c:forEach var="e" items="${events}">
                                <option value="${e.id}">${e.name}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select an Event --</option>
                        </select>
                    </div>
                    <input type ="checkbox" name="status" checked style="display:none"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Add">Add</button>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
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
            <form method="post" action = "${pageContext.request.contextPath}/editEvent">
                <input id="eventId" type="text" name="id" style="display:none"/>
                <input id="eventHostId" type="text" name="hostId" style="display:none"/>
                <div class="modal-body">
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
                                    <input class="form-control" name="startDate" id="eventStartDate" type="date" placeholder="Start Date of Event" style="width:100%; display:inline-block;"/>
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
                                    <input class="form-control" name="endDate" id="eventEndDate" type="date" placeholder="End Date of Event" style="width:100%; display:inline-block;"/>
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
                                    <input class="form-control" name="budget" id="eventBudget" type="text" placeholder="Budget for your Event" style="width:100%; display:inline-block;"/>
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
                </div> 
                <input type="checkbox" name="status" checked style="display:none"/>
                <div class="modal-footer">
                    <button id="updateEventBtn" type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Save">Update</button>
                    <button id="cancelUpdateEventBtn" type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Delete Event Modal -->
<div class="modal fade" id="deleteEventModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Delete Event</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Are you sure you want to delete the event with the following specifications?</h3><br><br>
                <table width="80%" align="center">
                    <tr>
                        <td><label>Name: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" id="eventName" class="form-control" disabled/>
                            </div>
                        </td><td width="10%">&nbsp;</td>
                        <td><label>Venue: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-star"></i></span>
                                <input type="text" id="eventVenue" class="form-control" disabled/>
                            </div>
                        </td>
                    </tr><tr><td>&nbsp;</td></tr>
                    <tr>
                        <td><label>Type: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-glass"></i></span>
                                <input type="text" id="eventType" class="form-control" disabled/>
                            </div>
                        </td><td>&nbsp;</td>
                        <td><label>Address: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input type="text" id="eventAddress" class="form-control" disabled/>
                            </div>
                        </td>
                    </tr><tr><td>&nbsp;</td></tr>
                    <tr>
                        <td><label>Host: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-sunglasses"></i></span>
                                <input type="text" class="form-control" id="eventHostName" disabled/>
                            </div>
                        </td><td>&nbsp;</td>
                        <td><label>Status: </label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <form method="post" action="${pageContext.request.contextPath}/deleteEvent">
                    <input name="id" id="eventId" style="display:none"/>
                    <input name="hostId" id="hostId" style="display:none"/>
                    <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Delete">Yes</button>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">No</button>
                </form>
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
            <form method="post" action="${pageContext.request.contextPath}/updateHost">
                <div class="modal-body">
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
                    <input type ="checkbox" name="status" checked style="display:none"/>
                    <input name="id" id="hostId" type="text" style="display:none"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Update">Update</button>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
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
            <form method="post" action="${pageContext.request.contextPath}/insertOrUpdateContact">
                <div class="modal-body">
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
                    <div>
                        <label>Status: </label>

                    </div>
                    <input id="contactId" type="text" name="id" style="display:none"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Update">Update</button>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--Delete Contact Modal-->
<div class="modal fade" id="deleteContactModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Delete Contact</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Are you sure you want to delete the contact with the following specifications?</h3><br><br>
                <table width="80%" align="center">
                    <div class="form-group">
                        <tr>
                            <td><label>Name: </label></td>
                            <td><div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input class="form-control" name="name" id="delName" type="text" disabled/>
                                </div>
                            </td><td>&nbsp;</td>
                            <td><label>Contact: </label></td>
                            <td>
                                <div class="input-group"> 
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                    <input disabled maxlength="10" class="form-control" id="delContact" name="contact" type="text"/>
                                </div>
                            </td>
                        </tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
                    </div>
                    <div class="form-group">
                        <tr>
                            <td><label>Email: </label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input disabled class="form-control" id="delEmail" name="email" type="text"/>
                                </div>
                            </td><td width="10%">&nbsp;</td>
                            <td><label>Organization: </label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    <input disabled class="form-control" id="delOrg" name="organization" type="text"/>
                                </div>
                            </td>
                        </tr>
                    </div> 
                </table><br>
            </div>
            <div class="modal-footer">
                <form method="post" action="${pageContext.request.contextPath}/deleteContact">
                    <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Delete">Yes</button>
                    <input name="id" id="delId" type="text" style="display:none"/>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">No</button>
                </form>
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
            <form method="post" action="${pageContext.request.contextPath}/insertOrUpdateEventContact">
                <div class="modal-body">
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
                        <select name="role" id="eventRole" class="form-control">
                            <c:forEach var="ec" items="${ec}">
                                <option value="${ec.role}">${ec.role}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select a ROLE --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Designated Event: </label>
                        <select name="//eventId" id="eventNameEC" class="form-control">
                            <c:forEach var="e" items="${events}">
                                <option value="${e.name}">${e.name}</option> 
                            </c:forEach>
                            <option value="" disabled selected>-- Select an Event --</option>
                        </select>
                    </div>
                    <div>
                        <label>Status: </label>
                    </div>
                    <input name="id" id="eventContactId" type="text" style="display:none"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Update">Update</button>
                    <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--Delete Event Contact Modal-->
<div class="modal fade" id="deleteEventContactModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Delete Event Contact</h2>
            </div>
            <div class="modal-body">
                <h3 style="color:#a57d89; font-family: Georgia">Are you sure you want to delete the Event Contact with the following specs?</h3><br>
                <table width="80%" align="center">
                    <tr>
                    <div class="form-group">
                        <td>
                            <label>Name: </label>
                        </td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input class="form-control" name="name" id="delEcName" type="text" disabled/>
                            </div>
                        </td><td width="10%">&nbsp;</td>
                    </div>
                    <div class="form-group">
                        <td>
                            <label>Contact: </label>
                        </td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <input maxlength="10" class="form-control" name="contact" id="delEcContact" type="text" disabled/>
                            </div>
                        </td>
                    </div>
                </tr><tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
            <tr>
            <div class="form-group">
                <td>
                    <label>Email: </label>
                </td>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input class="form-control" name="email" id="delEcEmail" type="text" disabled/>
                    </div>
                </td><td>&nbsp;</td>
            </div>
            <div class="form-group">
                <td>
                    <label>Role: </label>
                </td>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-sunglasses"></span></span>
                        <input class="form-control" name="role" id="delEcRole" type="text" disabled/>
                    </div>
                </td>
            </div>
            </tr>
        </table><br>
    </div>
    <div class="modal-footer">
        <form method="post" action="${pageContext.request.contextPath}/deleteEventContact">
            <input name="id" id="delEcId" type="text" style="display:none"/>
            <button type="submit" class="btn" style="background-color:#89a57d;color:white" data-toggle="tooltip" title="Delete">Yes</button>
            <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">No</button>
        </form>
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
                                    <input class="form-control" name="subject" id="multiS ubject" type="text" placeholder="Subject of your email"/>
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

<!--Date Expansion-->
<div class="modal fade" id="dateExpand" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Date and Time Specifics</h2>
            </div>
            <div class="modal-body">
                <br><br><br><br><br><br>
                <table width="80%" align="center">
                    <tr>
                        <td><label>Start Date: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                <input class="form-control" name="startDate" id="startDateEx" disabled/>
                            </div>
                        </td>
                        <td width="10%">&nbsp;</td>
                        <td><label>Start Time: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                <input class="form-control" name="startTime" id="startTimeEx" disabled/>
                            </div>
                        </td>
                    </tr><tr><td>&nbsp;</td></tr>
                    <tr>
                        <td><label>End Date: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                <input class="form-control" name="endDate" id="endDateEx" disabled/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>End Time: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                <input class="form-control" name="endTime" id="endTimeEx" disabled/>
                            </div>
                        </td>
                    </tr>
                </table>
                <br><br><br><br><br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<!--Host Expansion-->
<div class="modal fade" id="hostExpand" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89; font-family: Georgia">Host Information</h2>
            </div>
            <div class="modal-body">
                <br><br><br>
                <table width="80%" align="center">
                    <tr>
                        <td><label>Name: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                <input class="form-control" name="name" id="hostNameEx" disabled/>
                            </div>
                        </td>
                        <td width="10%">&nbsp;</td>
                        <td><label>Contact: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                <input class="form-control" name="contact" id="hostContactEx" disabled/>
                            </div>
                        </td>
                    </tr><tr><td>&nbsp;</td></tr>
                    <tr>
                        <td><label>Address: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                <input class="form-control" name="address" id="hostAddressEx" disabled/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td><label>Email: </label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                <input class="form-control" name="email" id="hostEmailEx" disabled/>
                            </div>
                        </td>
                    </tr>
                </table>
                <br><br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color:#a57d89; color:white" data-toggle="tooltip" title="Cancel" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- EVENT: Send Multiple Invitation(s) modal -->
<div class="modal fade" id="eventMailMultiModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title" style="color:#a57d89;font-family: Georgia">Send Invites for <span id="eventNameMail" style="color:black"></span></h2>
            </div>
            <div class="modal-body">
                <form>
                    <table width="45%" style="float:left;position:relative;top:80px;left:10px">
                        <tr>
                            <td><label>Select Recipient(s): </label></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input class="form-control" name="email" id="eventTo" type="text" placeholder="example@example.com" value=""/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label>Name of Event: </label><br>
                                    <select name="mailTemplates" id="eventMultiMailTemplates" class="form-control">
                                        <c:forEach var="e" items="${events}">
                                            <option value="${e.name}" disabled>${e.name}</option>
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
                                    <input class="form-control" name="subject" id="eventMultiSubject" type="text"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table width="50%" style="position:relative;left:30px">
                        <tr>
                            <td><label>Body: </label></td>
                        </tr>
                        <tr>
                            <td><textarea id="eventMultiBody" rows='17' cols='55' style="border-radius:3px;padding:15px;resize:none;border:1px solid #e8e8e8;box-shadow: 1px 1px 1px #e8e8e8" placeholder="Body of Your Email"></textarea></td>
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