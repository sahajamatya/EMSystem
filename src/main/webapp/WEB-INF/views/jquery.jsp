<script>
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
                    $("<td/>").html(e.id).appendTo($tr);
                    $("<td/>").html(e.name).appendTo($tr);
                    $("<td/>").html(e.type).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html("&nbsp;").attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(e.startDate + " <button class=\"btn btn-xs\"> <span class=\"glyphicon glyphicon-fullscreen\"></span></button>").attr({style: "text-align:center", valign: "center"}).appendTo($tr);
                    $("<td/>").html(e.venue).attr('style', 'text-align:center').appendTo($tr);
                    $("<td/>").html(e.address).appendTo($tr);
                    $("<td/>").html(e.status).attr('style', 'text-align:center').appendTo($tr);
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
                            + "\" data-toggle=\"modal\" data-target=\"#editEventModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span></button></span>"

                            + " <span class=\"eventDeleteBtn\" data-event-name=\"" + e.name
                            + "\" data-event-type=\"" + e.type
                            + "\" data-event-venue=\"" + e.venue
                            + "\" data-event-address=\"" + e.address
                            + "\" data-toggle=\"modal\" data-target=\"#deleteEventModal\"><button class=\"btn btn-xs\" style=\"background-color:#FF8668;color:white\" data-toggle=\"tooltip\" title=\"Delete\"><span class=\"glyphicon glyphicon-trash\"></span></button></span>"
                            + " <span data-toggle=\"modal\" data-target=\"#stallModal\"><button class=\"btn btn-xs\" style=\"background-color:#7d89a5;color:white\" data-toggle=\"tooltip\" title=\"Add Stalls\"><span class=\"glyphicon glyphicon-home\"></span> Stalls</button><span>").attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });

                $(".eventEditBtn").on('click', function () {
                    $("#editEventModal #eventName").val($(this).attr('data-event-name'));
                    $("#editEventModal #eventVenue").val($(this).attr('data-event-venue'));
                    $("#editEventModal #eventAddress").val($(this).attr('data-event-address'));
                    $("#editEventModal #eventBudget").val($(this).attr('data-event-budget'));
                    $("#editEventModal #eventEstGuests").val($(this).attr('data-event-estGuests'));
                    $("#editEventModal #eventStartDate").val($(this).attr('data-event-startDate'));
                    $("#editEventModal #eventEndDate").val($(this).attr('data-event-endDate'));
                    $("#editEventModal #eventStartTime").val($(this).attr('data-event-startTime'));
                    $("#editEventModal #eventEndTime").val($(this).attr('data-event-endTime'));
                });

                $(".eventDeleteBtn").on('click', function () {
                    $("#deleteEventModal .eventName").html($(this).attr('data-event-name'));
                    $("#deleteEventModal .eventType").html($(this).attr('data-event-type'));
                    $("#deleteEventModal .eventVenue").html($(this).attr('data-event-venue'));
                    $("#deleteEventModal .eventAddress").html($(this).attr('data-event-address'));
                });
            });
        }
        function hostTable() {
            $("#tableHeader").html("Hosts");
            $("#eventTable").hide();
            $("#contactTable").hide();
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
                            + "\" data-host-contact=\"" + h.contact
                            + "\" data-host-email=\"" + h.email
                            + "\" data-host-address=\"" + h.address
                            + "\" data-toggle=\"modal\" data-target=\"#editEventHostModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span> Edit</button></span>")
                            .attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });

                $(".hostEditBtn").on('click', function () {
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
                            + "\" data-contact-contact=\"" + c.contact
                            + "\" data-contact-email=\"" + c.email
                            + "\" data-contact-organization=\"" + c.organization
                            + "\" data-toggle=\"modal\" data-target=\"#editContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span></button></span>"


                            + " <span class=\"contactDeleteBtn\" data-contact-name=\"" + c.name
                            + "\" data-contact-contact=\"" + c.contact
                            + "\" data-contact-email=\"" + c.email
                            + "\" data-contact-org=\"" + c.organization
                            + "\" data-toggle=\"modal\" data-target=\"#deleteContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#FF8668;color:white\" data-toggle=\"tooltip\" title=\"Delete\"><span class=\"glyphicon glyphicon-trash\"></span></button></span>"
                            + " <span class=\"contactMail\" data-contact-email=\"" + c.email + "\" data-toggle=\"modal\" data-target=\"#mailModal\"><button class=\"btn btn-xs\" style=\"background-color:#6896ff;color:white\" data-toggle=\"tooltip\" title=\"Send Invites\"><span class=\"glyphicon glyphicon-envelope\"></span></button></span>").attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });
                $(".contactEditBtn").on('click', function () {
                    $("#editContactModal #contactName").val($(this).attr('data-contact-name'));
                    $("#editContactModal #contactContact").val($(this).attr('data-contact-contact'));
                    $("#editContactModal #contactEmail").val($(this).attr('data-contact-email'));
                    $("#editContactModal #contactOrganization").val($(this).attr('data-contact-organization'));
                });

                $(".contactDeleteBtn").on('click', function () {
                    $("#deleteContactModal #delName").val($(this).attr('data-contact-name'));
                    $("#deleteContactModal #delContact").val($(this).attr('data-contact-contact'));
                    $("#deleteContactModal #delEmail").val($(this).attr('data-contact-email'));
                    $("#deleteContactModal #delOrg").val($(this).attr('data-contact-org'));
                });

                $(".contactMail").on('click', function () {
                    $("#to").val($(this).attr('data-contact-email'));
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
                            + "\" data-ec-contact=\"" + ec.contact
                            + "\" data-ec-email=\"" + ec.email
                            + "\" data-ec-role=\"" + ec.role
                            + "\" data-toggle=\"modal\" data-target=\"#editEventContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#b2c4aa;color:white\" data-toggle=\"tooltip\" title=\"Edit\"><span class=\"glyphicon glyphicon-pencil\"></span></button></span>"

                            + " <span class=\"eventContactDeleteBtn\" data-ec-name=\"" + ec.name
                            + "\" data-ec-contact=\"" + ec.contact
                            + "\" data-ec-email=\"" + ec.email
                            + "\" data-ec-role=\"" + ec.role
                            + "\" data-toggle=\"modal\" data-target=\"#deleteEventContactModal\"><button class=\"btn btn-xs\" style=\"background-color:#FF8668;color:white\" data-toggle=\"tooltip\" title=\"Delete\"><span class=\"glyphicon glyphicon-trash\"></span></button></span>").attr('style', 'text-align:center').appendTo($tr);
                    $tr.appendTo($table);
                });
                $(".eventContactEditBtn").on('click', function () {
                    $("#editEventContactModal #eventContactName").val($(this).attr('data-ec-name'));
                    $("#editEventContactModal #eventContactContact").val($(this).attr('data-ec-contact'));
                    $("#editEventContactModal #eventContactEmail").val($(this).attr('data-ec-email'));
                });
                $(".eventContactDeleteBtn").on('click', function () {
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

        $("#hideHost").on('click', function () {
            $("#addEventHostModal").modal('hide');
        });
        $("#hideHost2").on('click', function () {
            $("#addEventHostModal").modal('hide');
        });
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>