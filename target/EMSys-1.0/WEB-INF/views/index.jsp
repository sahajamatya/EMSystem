<%@include file="../shared/header.jsp"%>
<h1 style="font-family: Georgia">Control Panel: <span style="color: #99C68E">EMSys <u>v1.0</u></span></h1>
<hr>
<div class="panel panel-success">
    <div class="panel panel-heading" style="color:#25383C"><h4>Search Parameters</h4></div> 
    <div class="panel panel-body">
        <table>
            <tr>
                <td><label>Search data from: &nbsp;</label></td> 
                <td>
                    <select class="form-control" id="searchByEntity" style="width:auto; display:inline-block;">
                        <option value="eventSearchTable">Events</option>
                        <option value="hostSearchTable">Hosts</option>
                        <option value="contactSearchTable">Contacts</option>
                        <option value="eventContactSearchTable">Event Contacts</option>
                        <option value="" disabled selected>Click to see available parameters</option>
                    </select>
                </td>
            </tr>
        </table>
        <table id="eventSearchTable" width="89%" style="display:none">
            <form id="eventSearchForm" method="POST" action="${pageContext.request.contextPath}/searchEvent">
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width:128px"><label>Type: </label></td>
                    <td style="width:301px">  
                        <select name="type" id="searchByEventType" class="form-control" style="width:auto; display:inline-block;">
                            <c:forEach var="e" items="${events}">
                                <option value="${e.type}">${e.type}</option>
                            </c:forEach>
                            <option value="" disabled selected>-- Select an Event Type --</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td><label>Name: </label></td>
                    <td><input class="form-control" name="name" style="width:300px; display:inline-block;" placeholder="Name of Event"/></td>
                    <td style="width:88px">&nbsp;</td>
                    <td style="width:74px"><label>Budget: </label></td>
                    <td>
                        <div class="input-group">
                            <span class="input-group-addon"> &#8377;&nbsp;</span>
                            <select name="budget" class="form-control" id="searchByBudget" style="width:300px; display:inline-block;">
                                <option value="">0 - 1,00,000</option>
                                <option value="">1,00,000 - 5,00,000</option>
                                <option value="">5,00,000 - 10,00,000</option>
                                <option value="">10,00,000 - 50,00,0000</option>
                                <option value="" disabled selected>Select a Budget Range</option>
                            </select>
                            <span class="input-group-addon">.00/-</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td><label>Venue: </label></td>
                    <td><input class="form-control" name="venue" style="width:300px; display:inline-block;" placeholder="Venue"/></td>
                    <td>&nbsp;</td>
                    <td><label>Status: </label></td>
                    <td>
                        <div class="onoffswitch3">
                            <input type="checkbox" name="status" class="onoffswitch3-checkbox" id="myonoffswitch3" checked>
                            <label class="onoffswitch3-label" for="myonoffswitch3">
                                <span class="onoffswitch3-inner">
                                    <span class="onoffswitch3-active"><span class="onoffswitch3-switch">Upcoming</span></span>
                                    <span class="onoffswitch3-inactive"><span class="onoffswitch3-switch">Past Event</span></span>
                                </span>
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                    <td>
                        <button type="submit" class="btn" style="position:relative;left:305px; background-color:#b2c4aa; color:white">
                            <span class="glyphicon glyphicon-search"></span> Search
                        </button>
                    </td>
                </tr>
            </form>
        </table>
        <table id="hostSearchTable" style="display:none">
            <form>
                <tr>
                    <td style="color:white"><label>Search data from: &nbsp;</label></td>
                    <td>&nbsp;</td> 
                    <td style="color:white"><label>__________________ &nbsp;</label></td>
                </tr>  
                <tr>
                    <td>
                        <label>Show all hosts<br> who have: </label>  
                    </td>
                    <td>
                        <input type="radio" name="status"/> Upcoming Events<br>
                        <input type="radio" name="status"/> Previously Hosted
                    </td> 
                    <td>
                        <button type="button" class="btn" style="background-color:#b2c4aa; float:right;color:white" id="hostSearch">
                            <span class="glyphicon glyphicon-search" style="color:white"></span> Search
                        </button>
                    </td>
                </tr>
            </form>
        </table>
        <table id="contactSearchTable" style="display:none">
            <form class="form-group">
                <tr>
                    <td style="color:white"><label>Search data from: &nbsp;</label></td>
                    <td>&nbsp;</td>
                    <td style="color:white"><label>______________</label></td>
                    <td style="color:white"><label>__________</label></td>
                </tr>
                <tr>
                    <td><label>Name: </label></td>
                    <td><input class="form-control" name="name" style="width:300px; display:inline-block;" placeholder="Name of Contact"/></td>
                    <td>&nbsp;</td>
                    <td><label>Status: </label></td>
                    <td>
                        <div class="onoffswitch4">
                            <input type="checkbox" name="status" class="onoffswitch4-checkbox" id="myonoffswitch4" checked>
                            <label class="onoffswitch4-label" for="myonoffswitch4">
                                <span class="onoffswitch4-inner"></span>
                                <span class="onoffswitch4-switch"></span>
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label>Organization: </label></td>
                    <td><input class="form-control" name="org" style="width:300px; display:inline-block;" placeholder="Name of Organization"/></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><button type="button" class="btn" style="background-color:#b2c4aa;position:relative;left:2px"><span class="glyphicon glyphicon-search" style="color:white"></span> <span style="color:white">Search</span></button></td>
                </tr>
            </form>
        </table>
        <table id="eventContactSearchTable" style="display:none">
            <form class="form-group">
                <tr>
                    <td style="color:white">____________________</td>
                    <td style="color:white">&nbsp;</td>
                    <td style="color:white">_________</td>
                    <td style="color:white">_________</td>
                </tr>
                <tr>
                    <td><label>Event Name: </label></td>
                    <td><input class="form-control"  style="width:300px; display:inline-block;" type ="text" name="name" placeholder="Name of the Event"/></td>
                    <td>&nbsp;</td>
                    <td><label>Role: </label></td>
                    <td>
                        <select name="type" id="eventRole" class="form-control" style="width:auto; display:inline-block;">
                            <c:forEach var="ec" items="${ec}">
                                <option value="${ec.role}">${ec.role}</option>
                            </c:forEach>
                            <option value="" disabled selected>-- Select a ROLE --</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><label>Name of Person: </label></td>
                    <td><input class="form-control"  style="width:300px; display:inline-block;" type ="text" placeholder="Name of the Person"/></td>
                    <td>&nbsp;</td>
                    <td><label>Status: </label></td>
                    <td>
                        <div class="onoffswitch5">
                            <input type="checkbox" name="status" class="onoffswitch5-checkbox" id="myonoffswitch5" checked>
                            <label class="onoffswitch5-label" for="myonoffswitch5">
                                <span class="onoffswitch5-inner"></span>
                                <span class="onoffswitch5-switch"></span>
                            </label>
                        </div>
                    </td>
                    <td><button type="button" class="btn" style="background-color:#b2c4aa; position:relative; left:30px"><span class="glyphicon glyphicon-search" style="color:white"></span> <span style="color:white">Search</span></button></td>
                </tr>
            </form>
        </table>
    </div>
</div>

<div class="panel panel-success">
    <div class="panel panel-heading" style="color:#25383C"><h4 id="tableHeader">Table Data</h4></div>
    <div class="panel panel-body">
        <div id="eventTableDiv" style="display:none">
            <div class="pull-right">
                <span data-toggle="modal" data-target="#addEventHostModal">
                    <button class="btn btn-sm" style="background-color:#b2c4aa;color:white" title="Add Event" id="addEventBtn" data-toggle="tooltip">
                        <span class="glyphicon glyphicon-plus-sign"></span> Add Event
                    </button>
                </span>
            </div><br><br>
            <table class="table table-bordered table-striped table-hover table-condensed" id="eventTable" style="display:none">
                <tr class="success" style="display:none" id="eventHeader">
                    <th>#</th>
                    <th>Name</th>
                    <th style="text-align: center">Type</th>
                    <th style="text-align: center">Host</th>
                    <th style="text-align: center">Dates</th>
                    <th style="text-align: center">Venue</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Actions</th>
                </tr>
            </table>
        </div>
        <div id="hostTableDiv">
            <table class="table table-bordered table-striped table-hover table-condensed" id="hostTable" style="display:none">
                <tr class="success" style="display:none" id="hostHeader">
                    <th>#</th>
                    <th>Name</th>
                    <th style="text-align: center">Contact</th>
                    <th style="text-align: center">Email</th>
                    <th style="text-align: center">Address</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Actions</th>
                </tr>
            </table>
        </div>
        <div id="contactTableDiv" style="display:none">
            <div class="pull-right">
                <span data-toggle="modal" data-target="#addContactModal">
                    <button class="btn btn-sm" style="background-color:#b2c4aa;color:white" data-toggle="tooltip" title="Add Contact">
                        <span class="glyphicon glyphicon-plus-sign"></span> Add Contact
                    </button>
                </span>
                <span data-toggle="modal" data-target="#mailMultiModal">
                    <button class="btn btn-sm" style="background-color:#b2c4aa;color:white" data-toggle="tooltip" title="Send Invitations">
                        <span class="glyphicon glyphicon-envelope"></span> Send Invitations
                    </button>
                </span> 
            </div><br><br>
            <table class="table table-bordered table-striped table-hover table-condensed" id="contactTable" style="display:none">
                <tr class="success" style="display:none" id="contactHeader">
                    <th>#</th>
                    <th>Name</th>
                    <th style="text-align: center">Organization</th>
                    <th style="text-align: center">Email</th>
                    <th style="text-align: center">Contact</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Actions</th>
                </tr>
            </table>
        </div>
        <div id="eventContactTableDiv" style="display:none">
            <div class="pull-right">
                <span data-toggle="modal" data-target="#eventContactModal">
                    <button class="btn btn-sm" style="background-color:#b2c4aa;color:white" data-toggle="tooltip" title="Add Event Contact">
                        <span class="glyphicon glyphicon-plus-sign"></span> Add Event Contact
                    </button>
                </span>
            </div><br><br>
            <table class="table table-bordered table-striped table-hover table-condensed" id="eventContactTable" style="display:none">
                <tr class="success" style="display:none" id="eventContactHeader">
                    <th>#</th>
                    <th>Name</th>
                    <th style="text-align: center">Contact</th>
                    <th style="text-align: center">Email</th>
                    <th style="text-align: center">ROLE</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Actions</th>
                </tr>
            </table>
        </div>
    </div>
</div>

<%@include file="modals.jsp"%>
<%@include file="jquery.jsp"%>
<%@include file="../shared/footer.jsp"%>