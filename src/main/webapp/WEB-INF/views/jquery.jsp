<script>
    function _(id) {
        return document.getElementById(id);
    }
    var droppedIn = false;
    function drag_start(event) {
        event.dataTransfer.effectAllowed = "copy";
        event.dataTransfer.setData("text", event.target.getAttribute('id'));
        _(elem_id).style.cursor = "move";
    }
    function drag_drop(event) {
        event.preventDefault(); /* Prevent undesirable default behavior while dropping */
        var elem_id = event.dataTransfer.getData("text");
        var nodeCopy = document.getElementById(elem_id).cloneNode(true);
        nodeCopy.id = "newId";
        event.target.appendChild(nodeCopy);
        _(elem_id).removeAttribute("draggable");
        _(elem_id).style.cursor = "default";
        droppedIn = true;
    }
    function drag_end(event) {
        droppedIn = false;
    }
    function readDropZone() {
        for (var i = 0; i < _("drop_zone").children.length; i++) {
            alert(_("drop_zone").children[i].id + " is in the drop zone");
        }
        /* Run Ajax request to pass any data to your server */
    }
    $(document).ready(function () {
        function eventTable() {
            $("#tableHeader").html("Events");
            $("#hostTable").hide();
            $("#contactTable").hide();
            $("#eventContactTable").hide();
            $("#eventHeader").show();
            $("#eventTableDiv").show();
            $("#contactTableDiv").hide();
            $("#eventContactTableDiv").hide();
            $("#eventTable").show();
            $.getJSON("${pageContext.request.contextPath}/eventJSON", function (data) {
                var $table = $("#eventTable");
                $.each(data, function (i, e) {
                    if (e.status === "true") {
                        e.status = "<label class=\"label\" style=\"background-color: #b2c4aa;color:white\">Upcoming</label>";
                    } else {
                        e.status = "<label class=\"label\" style=\"background-color: #FF8668;color:white\">Past Event</label>";
                    }
                    var $tr = $("<tr/>").attr('style', 'font-size:90%');
                    $("<td/>").html(e.id).css('vertical-align', 'middle').appendTo($tr);
                    $("<td/>").html(e.name).css('vertical-align', 'middle').appendTo($tr);
                    $("<td/>").html(e.type).attr('style', 'text-align:center').css('vertical-align', 'middle').appendTo($tr);
                    $("<td/>").html(e.hostId.name + " <span style=\"float:right\" class=\"expandHostBtn\" data-toggle=\"modal\" data-target=\"#hostExpand\""
                            + " data-host-name=\"" + e.hostId.name + "\""
                            + " data-host-contact=\"" + e.hostId.contact + "\""
                            + " data-host-email=\"" + e.hostId.email + "\""
                            + " data-host-address=\"" + e.hostId.address + "\">"
                            + "<button class=\"btn btn-xs\"><span class=\"glyphicon glyphicon-fullscreen\"></span></button>"
                            + "</span>").attr('style', 'text-align:center').css('vertical-align', 'middle').appendTo($tr);
                    $("<td/>").html(" &nbsp;<span class=\"expandDateBtn\" data-toggle=\"modal\" data-target=\"#dateExpand\"\n\""
                            + " data-event-startDate=\"" + e.startDate + "\""
                            + " data-event-endDate=\"" + e.endDate + "\""
                            + " data-event-startTime=\"" + e.startTime + "\""
                            + " data-event-endTime=\"" + e.endTime + "\"><button class=\"btn btn-xs\"> <span id=\"expandBtn\" class=\"glyphicon glyphicon-calendar\"></span></button></span>").css('vertical-align', 'middle').css('text-align', 'center').appendTo($tr);
                    $("<td/>").html(e.venue + ",<br>" + e.address).attr('style', 'text-align:center').css('vertical-align', 'middle').appendTo($tr);
                    $("<td/>").html(e.status).attr('style', 'text-align:center').css('vertical-align', 'middle').appendTo($tr);
                    $("<td/>").html("<span class=\"eventEditBtn\" data-event-name=\"" + e.name
                            + "\" data-event-type=\"" + e.type
                            + "\" data-event-startDate=\"" + e.startDate
                            + "\" data-event-endDate=\"" + e.endDate
                            + "\" data-event-startTime=\"" + e.startTime
                            + "\" data-event-endTime=\"" + e.endTime
                            + "\" data-event-venue=\"" + e.venue
                            + "\" data-event-address=\"" + e.address
                            + "\" data-event-estGuests=\"" + e.estGuests
                            + "\" data-event-budget=\"" + e.budget
                            + "\" data-event-attractionPkg=\"" + e.attractionPkgId.id
                            + "\" data-toggle=\"modal\" data-target=\"#editEventModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span></button></span>"

                            + " <span class=\"eventDeleteBtn\" data-event-name=\"" + e.name
                            + "\" data-event-type=\"" + e.type
                            + "\" data-event-venue=\"" + e.venue
                            + "\" data-event-address=\"" + e.address
                            + "\" data-event-hostName=\"" + e.hostId.name
                            + "\" data-toggle=\"modal\" data-target=\"#deleteEventModal\"><button class=\"btn btn-xs\" style=\"background-color:#FF8668;color:white\" data-toggle=\"tooltip\" title=\"Delete\"><span class=\"glyphicon glyphicon-trash\"></span></button></span>"
                            + " <span data-toggle=\"modal\" data-target=\"#stallModal\"><button class=\"btn btn-xs\" style=\"background-color:#7d89a5;color:white\" data-toggle=\"tooltip\" title=\"Add Stalls\"><span class=\"glyphicon glyphicon-home\"></span> Stalls</button></span>"

                            + " <span class=\"eventMailBtn\" data-event-name=\"" + e.name
                            + "\" data-event-hostName=\"" + e.hostId.name
                            + "\" data-event-hostContact=\"" + e.hostId.contact
                            + "\" data-event-hostAddress=\"" + e.hostId.address
                            + "\" data-event-hostEmail=\"" + e.hostId.email
                            + "\" data-event-venue=\"" + e.venue
                            + "\" data-event-address=\"" + e.address
                            + "\" data-event-startDate=\"" + e.startDate
                            + "\" data-event-endDate=\"" + e.endDate
                            + "\" data-event-startTime=\"" + e.startTime
                            + "\" data-event-endTime=\"" + e.endTime
                            + "\" data-toggle=\"modal\" data-target=\"#eventMailMultiModal\"><button type=\"button\" class=\"btn btn-xs\" style=\"background-color:#6896ff;color:white\"><span class=\"glyphicon glyphicon-envelope\"></span></button></span>").attr('style', 'text-align:center').css('vertical-align', 'middle').appendTo($tr);
                    $tr.appendTo($table);
                });
                $(".expandHostBtn").on('click', function () {
                    $("#hostExpand #hostNameEx").val($(this).attr("data-host-name"));
                    $("#hostExpand #hostContactEx").val($(this).attr("data-host-contact"));
                    $("#hostExpand #hostEmailEx").val($(this).attr("data-host-email"));
                    $("#hostExpand #hostAddressEx").val($(this).attr("data-host-address"));
                });
                $(".expandDateBtn").on('click', function () {
                    $("#dateExpand #startDateEx").val($(this).attr("data-event-startDate"));
                    $("#dateExpand #endDateEx").val($(this).attr("data-event-endDate"));
                    $("#dateExpand #startTimeEx").val($(this).attr("data-event-startTime"));
                    $("#dateExpand #endTimeEx").val($(this).attr("data-event-endTime"));
                });
                $(".eventEditBtn").on('click', function () {
                    $("#editEventModal #eventType").val($(this).attr('data-event-type'));
                    $("#editEventModal #eventName").val($(this).attr('data-event-name'));
                    $("#editEventModal #eventVenue").val($(this).attr('data-event-venue'));
                    $("#editEventModal #eventAddress").val($(this).attr('data-event-address'));
                    $("#editEventModal #eventBudget").val($(this).attr('data-event-budget'));
                    $("#editEventModal #eventEstGuests").val($(this).attr('data-event-estGuests'));
                    $("#editEventModal #eventStartDate").val($(this).attr('data-event-startDate'));
                    $("#editEventModal #eventEndDate").val($(this).attr('data-event-endDate'));
                    $("#editEventModal #eventStartTime").val($(this).attr('data-event-startTime'));
                    $("#editEventModal #eventEndTime").val($(this).attr('data-event-endTime'));
                    $("#editEventModal #eventAttractionPkgId").val($(this).attr('data-event-attractionPkg'));
                });
                $(".eventDeleteBtn").on('click', function () {
                    $("#deleteEventModal #eventName").val($(this).attr('data-event-name'));
                    $("#deleteEventModal #eventType").val($(this).attr('data-event-type'));
                    $("#deleteEventModal #eventVenue").val($(this).attr('data-event-venue'));
                    $("#deleteEventModal #eventAddress").val($(this).attr('data-event-address'));
                    $("#deleteEventModal #eventHostName").val($(this).attr('data-event-hostName'));
                });
                $(".eventMailBtn").on('click', function () {
                    $("#eventMailMultiModal #eventNameMail").html($(this).attr("data-event-name"));
                    $("#eventMailMultiModal #eventMultiMailTemplates").val($(this).attr("data-event-name"));
                    $("#eventMailMultiModal #eventMultiSubject").val("Invitation for " + $(this).attr("data-event-name"));
                    var eventName = $(this).attr("data-event-name");
                    var eventHostName = $(this).attr("data-event-hostName");
                    var eventHostContact = $(this).attr("data-event-hostContact");
                    var eventHostAddress = $(this).attr("data-event-hostAddress");
                    var eventHostEmail = $(this).attr("data-event-hostEmail");
                    var eventVenue = $(this).attr("data-event-venue");
                    var eventAddress = $(this).attr("data-event-address");
                    var eventStartDate = $(this).attr("data-event-startDate");
                    var eventEndDate = $(this).attr("data-event-endDate");
                    var eventStartTime = $(this).attr("data-event-startTime");
                    var eventEndTime = $(this).attr("data-event-endTime");
                    var data = "Dear Sir/Madam,\n\nIt is my immense pleasure to invite you to " + eventName
                            + ". This event is hosted by " + eventHostName
                            + ".\n\nWe would be very delighted to have the pleasure of your presence at the event. So please consider accepting our sincere invitation."
                            + "\n\nThe specifications of the event are as follows:\n\n\t\tEvent Name: " + eventName
                            + "\n\t\tVenue: " + eventVenue + ", " + eventAddress
                            + "\n\t\tStart Date: " + eventStartDate
                            + "\n\t\tEnd Date: " + eventEndDate
                            + "\n\t\tStart Time: " + eventStartTime
                            + "\n\t\tEnd Time: " + eventEndTime
                            + "\n\n\nYours truly,\n\n" + eventHostName + "\n" + eventHostAddress + "\nContact: " + eventHostContact + "\nEmail: " + eventHostEmail;
                    $("#eventMailMultiModal #eventMultiBody").html(data);
                });
            });
        }
        function hostTable() {
            $("#tableHeader").html("Hosts");
            $("#eventTable").hide();
            $("#contactTable").hide();
            $("#contactTableDiv").hide();
            $("#eventContactTableDiv").hide();
            $("#eventContactTable").hide();
            $("#eventTableDiv").hide();
            $("#hostHeader").show();
            $("#hostTable").show();
            $.getJSON("${pageContext.request.contextPath}/hostJSON", function (data) {
                var $table = $("#hostTable");
                $.each(data, function (i, h) {
                    if (h.status === "true") {
                        h.status = "<label class=\"label\" style=\"background-color: #b2c4aa;color:white\">Waiting</label>";
                    } else {
                        h.status = "<label class=\"label\" style=\"background-color: #FF8668;color:white\">Done</label>";
                    }
                    var $tr = $("<tr/>").attr('style', 'font-size:90%');
                    $("<td/>").html(h.id).appendTo($tr);
                    $("<td/>").html(h.name).appendTo($tr);
                    $("<td/>").html(h.contact).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(h.email).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(h.address).appendTo($tr);
                    $("<td/>").html(h.status).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html("<span class=\"hostEditBtn\" data-host-name=\"" + h.name
                            + "\" data-host-id=\"" + h.id
                            + "\" data-host-contact=\"" + h.contact
                            + "\" data-host-email=\"" + h.email
                            + "\" data-host-address=\"" + h.address
                            + "\" data-toggle=\"modal\" data-target=\"#editEventHostModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span> Edit</button></span>")
                            .attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });
                $(".hostEditBtn").on('click', function () {
                    $("#editEventHostModal #hostId").val($(this).attr('data-host-id'));
                    $("#editEventHostModal #hostName").val($(this).attr('data-host-name'));
                    $("#editEventHostModal #hostContact").val($(this).attr('data-host-contact'));
                    $("#editEventHostModal #hostEmail").val($(this).attr('data-host-email'));
                    $("#editEventHostModal #hostAddress").val($(this).attr('data-host-address'));
                });
            });
        }
        function contactTable() {
            $("#tableHeader").html("Contacts");
            $("#eventTable").hide();
            $("#hostTable").hide();
            $("#eventContactTable").hide();
            $("#contactTableDiv").show();
            $("#eventTableDiv").hide();
            $("#eventContactTableDiv").hide();
            $("#contactTable").show();
            $("#contactHeader").show();
            $.getJSON("${pageContext.request.contextPath}/contactJSON", function (data) {
                var $table = $("#contactTable");
                $.each(data, function (i, c) {
                    if (c.status === "true") {
                        c.status = "<label class=\"label\" style=\"background-color: #b2c4aa;color:white\">Active</label>";
                    } else {
                        c.status = "<label class=\"label\" style=\"background-color: #FF8668;color:white\">Inactive</label>";
                    }
                    var $tr = $("<tr/>").attr('style', 'font-size:90%');
                    $("<td/>").html(c.id).appendTo($tr);
                    $("<td/>").html(c.name).appendTo($tr);
                    $("<td/>").html(c.organization).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(c.email).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(c.contact).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(c.status).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html("<span class=\"contactEditBtn\" data-contact-name=\"" + c.name
                            + "\" data-contact-id=\"" + c.id
                            + "\" data-contact-contact=\"" + c.contact
                            + "\" data-contact-email=\"" + c.email
                            + "\" data-contact-organization=\"" + c.organization
                            + "\" data-toggle=\"modal\" data-target=\"#editContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span></button></span>"


                            + " <span class=\"contactDeleteBtn\" data-contact-name=\"" + c.name
                            + "\" data-contact-id=\"" + c.id
                            + "\" data-contact-contact=\"" + c.contact
                            + "\" data-contact-email=\"" + c.email
                            + "\" data-contact-org=\"" + c.organization
                            + "\" data-toggle=\"modal\" data-target=\"#deleteContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#FF8668;color:white\" data-toggle=\"tooltip\" title=\"Delete\"><span class=\"glyphicon glyphicon-trash\"></span></button></span>"
                            + " <span class=\"contactMail\" data-contact-email=\"" + c.email
                            + "\" data-contact-name=\"" + c.name
                            + "\" data-toggle=\"modal\" data-target=\"#mailModal\"><button class=\"btn btn-xs\" style=\"background-color:#6896ff;color:white\" data-toggle=\"tooltip\" title=\"Send Invites\"><span class=\"glyphicon glyphicon-envelope\"></span></button></span>").attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });
                $(".contactEditBtn").on('click', function () {
                    $("#editContactModal #contactId").val($(this).attr('data-contact-id'));
                    $("#editContactModal #contactName").val($(this).attr('data-contact-name'));
                    $("#editContactModal #contactContact").val($(this).attr('data-contact-contact'));
                    $("#editContactModal #contactEmail").val($(this).attr('data-contact-email'));
                    $("#editContactModal #contactOrganization").val($(this).attr('data-contact-organization'));
                });
                $(".contactDeleteBtn").on('click', function () {
                    $("#deleteContactModal #delId").val($(this).attr('data-contact-id'));
                    $("#deleteContactModal #delName").val($(this).attr('data-contact-name'));
                    $("#deleteContactModal #delContact").val($(this).attr('data-contact-contact'));
                    $("#deleteContactModal #delEmail").val($(this).attr('data-contact-email'));
                    $("#deleteContactModal #delOrg").val($(this).attr('data-contact-org'));
                });
                $(".contactMail").on('click', function () {
                    $("#mailModal #body").html("");
                    $("#mailModal #subject").val("");
                    $("#mailModal #mailTemplates").val("");
                    var $this = $(this);
                    $("#to").val($(this).attr('data-contact-email'));
                    $("#mailTemplates").on('change', function () {
                        var $eventName = $(this).val();
                        $("#mailModal #subject").val("Invitation for " + $(this).val());
                        $.getJSON("${pageContext.request.contextPath}/eventJSON", function (data) {
                            $.each(data, function (i, e) {
                                if (e.name === $eventName) {
                                    $("#mailModal #body").html("Dear " + $this.attr("data-contact-name") + ",\n\nIt is our immense pleasure to request the honor of your presence at the " + e.name
                                            + ". This event is hosted by " + e.hostId.name + ".\n\nWe would be absolutely delighted to have you as our guest, so please accept our invitation.\n\n"
                                            + "The specifications of the event are as follows:\n\n"
                                            + "\t\tEvent Name: " + e.name
                                            + "\n\t\tVenue: " + e.venue + ", " + e.address
                                            + "\n\t\tStart Date: " + e.startDate
                                            + "\n\t\tEnd Date: " + e.endDate
                                            + "\n\t\tStart Time: " + e.startTime
                                            + "\n\t\tEnd Time: " + e.endTime
                                            + "\n\nYours truly,\n\n" + e.hostId.name + "\n" + e.hostId.address + "\nContact: " + e.hostId.contact + "\nEmail: " + e.hostId.email);
                                }
                            });
                        });
                    });
                });
            });
        }
        function eventContactTable() {
            $("#tableHeader").html("Event Contacts");
            $("#eventTable").hide();
            $("#hostTable").hide();
            $("#contactTable").hide();
            $("#eventContactTableDiv").show();
            $("#eventTableDiv").hide();
            $("#contactTableDiv").hide();
            $("#eventContactTable").show();
            $("#eventContactHeader").show();
            $.getJSON("${pageContext.request.contextPath}/eventContactJSON", function (data) {
                var $table = $("#eventContactTable");
                $.each(data, function (i, ec) {
                    if (ec.status === "true") {
                        ec.status = "<label class=\"label\" style=\"background-color: #b2c4aa;color:white\">Deployed</label>";
                    } else {
                        ec.status = "<label class=\"label\" style=\"background-color: #FF8668;color:white\">Undeployed</label>";
                    }
                    var $tr = $("<tr/>").attr('style', 'font-size:90%');
                    $("<td/>").html(ec.id).appendTo($tr);
                    $("<td/>").html(ec.name).appendTo($tr);
                    $("<td/>").html(ec.contact).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(ec.email).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(ec.role).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(ec.status).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html("<span class=\"eventContactEditBtn\" data-ec-name=\"" + ec.name
                            + "\" data-ec-id=\"" + ec.id
                            + "\" data-ec-contact=\"" + ec.contact
                            + "\" data-ec-email=\"" + ec.email
                            + "\" data-ec-role=\"" + ec.role
                            + "\" data-toggle=\"modal\" data-target=\"#editEventContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span></button></span>"

                            + " <span class=\"eventContactDeleteBtn\" data-ec-name=\"" + ec.name
                            + "\" data-ec-id=\"" + ec.id
                            + "\" data-ec-contact=\"" + ec.contact
                            + "\" data-ec-email=\"" + ec.email
                            + "\" data-ec-role=\"" + ec.role
                            + "\" data-toggle=\"modal\" data-target=\"#deleteEventContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#FF8668;color:white\" data-toggle=\"tooltip\" title=\"Delete\"><span class=\"glyphicon glyphicon-trash\"></span></button></span>").attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });
                $(".eventContactEditBtn").on('click', function () {
                    $("#editEventContactModal #eventContactId").val($(this).attr('data-ec-id'));
                    $("#editEventContactModal #eventContactName").val($(this).attr('data-ec-name'));
                    $("#editEventContactModal #eventContactContact").val($(this).attr('data-ec-contact'));
                    $("#editEventContactModal #eventContactEmail").val($(this).attr('data-ec-email'));
                    $("#editEventContactModal #eventRole").val($(this).attr('data-ec-role'));
                });
                $(".eventContactDeleteBtn").on('click', function () {
                    $("#deleteEventContactModal #delEcId").val($(this).attr('data-ec-id'));
                    $("#deleteEventContactModal #delEcName").val($(this).attr('data-ec-name'));
                    $("#deleteEventContactModal #delEcContact").val($(this).attr('data-ec-contact'));
                    $("#deleteEventContactModal #delEcEmail").val($(this).attr('data-ec-email'));
                    $("#deleteEventContactModal #delEcRole").val($(this).attr('data-ec-role'));
                });
            });
        }
        $("#searchByEntity").on('change', function () {
            switch ($(this).val()) {
                case "eventSearchTable":
                    $("#eventSearchTable").show();
                    $("#hostSearchTable").hide();
                    $("#contactSearchTable").hide();
                    $("#eventContactSearchTable").hide();
                    eventTable();
                    break;
                case "hostSearchTable":
                    $("#hostSearchTable").show();
                    $("#eventSearchTable").hide();
                    $("#contactSearchTable").hide();
                    $("#eventContactSearchTable").hide();
                    hostTable();
                    break;
                case "contactSearchTable":
                    $("#contactSearchTable").show();
                    $("#eventSearchTable").hide();
                    $("#hostSearchTable").hide();
                    $("#eventContactSearchTable").hide();
                    contactTable();
                    break;
                case "eventContactSearchTable":
                    $("#eventContactSearchTable").show();
                    $("#eventSearchTable").hide();
                    $("#hostSearchTable").hide();
                    $("#contactSearchTable").hide();
                    eventContactTable();
                    break;
            }
        });
        $("#passHostInfo").on('click', function () {
            $("#addEventModal #passHostName").val($("#addEventHostModal #hostName").val());
            $("#addEventModal #passHostContact").val($("#addEventHostModal #hostContact").val());
            $("#addEventModal #passHostEmail").val($("#addEventHostModal #hostEmail").val());
            $("#addEventModal #passHostAddress").val($("#addEventHostModal #hostAddress").val());
            $("#addEventModal #passHostStatus").val($("#addEventHostModal #hostStatus").val());
        });
        $("#addContactBtn").on('click', function () {
            alert('Contact has been added to your contact list successfully.');
        });
        $("#hideHost").on('click', function () {
            $("#addEventHostModal").modal('hide');
        });
        $("#hideHost2").on('click', function () {
            $("#addEventHostModal").modal('hide');
        });
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>