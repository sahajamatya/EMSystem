/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.controller;

import com.lfa.emsys.dao.ContactDAO;
import com.lfa.emsys.dao.EventContactDAO;
import com.lfa.emsys.dao.EventDAO;
import com.lfa.emsys.dao.EventSearchDAO;
import com.lfa.emsys.dao.HostDAO;
import com.lfa.emsys.entity.Contact;
import com.lfa.emsys.entity.Event;
import com.lfa.emsys.entity.EventContact;
import com.lfa.emsys.entity.Host;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author dell-pc
 */
@Controller
@RequestMapping(value = "/")
public class DefaultController {

    @Autowired
    private EventDAO eventDAO;

    @Autowired
    private EventSearchDAO eventSearchDAO;

    @Autowired
    private HostDAO hostDAO;

    @Autowired
    private ContactDAO contactDAO;

    @Autowired
    private EventContactDAO eventContactDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("events", eventDAO.getAll());
        model.addAttribute("ec", eventContactDAO.getAll());
        return "index";
    }

    @RequestMapping(value = "/addHost", method = RequestMethod.GET)
    @ResponseBody
    public String addHost(Host host) {
        String output = "";
        if (output.equals("")) {
            output = host.toJSON();
        } else {
            output = output + ",\n" + host.toJSON();
        }
        return "[" + output + "]";
    }

    @RequestMapping(value = "/addEvent", method = RequestMethod.POST)
    public String addEvent(@RequestParam("passHostName") String hostName,
            @RequestParam("passHostContact") String hostContact,
            @RequestParam("passHostEmail") String hostEmail,
            @RequestParam("passHostAddress") String hostAddress,
            @RequestParam("passHostStatus") boolean hostStatus,
            //EVENT:
            @RequestParam("type") String eventType,
            @RequestParam("name") String eventName,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam("startTime") String startTime,
            @RequestParam("endTime") String endTime,
            @RequestParam("venue") String eventVenue,
            @RequestParam("address") String eventAddress,
            @RequestParam("budget") int eventBudget,
            @RequestParam("estGuests") int eventEstGuests,
            @RequestParam("status") boolean eventStatus) {
        Host host = new Host();
        host.setName(hostName);
        host.setContact(hostContact);
        host.setEmail(hostEmail);
        host.setAddress(hostAddress);
        host.setStatus(hostStatus);
        hostDAO.insertOrUpdate(host);

        //DATE PARSER
        Date finalStartDate=null;
        Date finalEndDate=null;
        String startDateParser = startDate;
        String endDateParser = endDate;
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try{
        finalStartDate = format.parse(startDateParser);
        finalEndDate = format.parse(endDateParser);
        } catch(ParseException ex){
            System.out.println(ex.getMessage());
        }
        
        Event event = new Event();
        event.setType(eventType);
        event.setName(eventName);
        event.setStartDate(finalStartDate);
        event.setEndDate(finalEndDate);
        event.setStartTime(startTime);
        event.setEndTime(endTime);
        event.setVenue(eventVenue);
        event.setAddress(eventAddress);
        event.setBudget(eventBudget);
        event.setEstGuests(eventEstGuests);
        event.setStatus(eventStatus);
        event.setHostId(host);
        eventDAO.insertOrUpdate(event);
        return "redirect:/";
    }
    
    @RequestMapping(value = "/editEvent", method = RequestMethod.POST)
    public String editEvent(@RequestParam("id") int eventId,
            @RequestParam("type") String eventType,
            @RequestParam("name") String eventName,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam("startTime") String startTime,
            @RequestParam("endTime") String endTime,
            @RequestParam("venue") String eventVenue,
            @RequestParam("address") String eventAddress,
            @RequestParam("budget") int eventBudget,
            @RequestParam("estGuests") int eventEstGuests,
            @RequestParam("hostId") int hostId,
            @RequestParam("status") boolean eventStatus) {
        
        //DATE PARSER:
        Date finalStartDate=null;
        Date finalEndDate=null; 
        String startDateParser = startDate;
        String endDateParser = endDate;
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try{
        finalStartDate = format.parse(startDateParser);
        finalEndDate = format.parse(endDateParser);
        } catch(ParseException ex){
            System.out.println(ex.getMessage());
        }
        //EVENT MAPPER:
        Event event = new Event();
        event.setId(eventId);
        event.setType(eventType);
        event.setName(eventName);
        event.setStartDate(finalStartDate);
        event.setEndDate(finalEndDate);
        event.setStartTime(startTime); 
        event.setEndTime(endTime);
        event.setVenue(eventVenue);
        event.setAddress(eventAddress);
        event.setBudget(eventBudget);
        event.setEstGuests(eventEstGuests);
        event.setStatus(eventStatus);
        event.setHostId(hostDAO.getById(hostId));
        eventDAO.insertOrUpdate(event);
        return "redirect:/";
    }
    
    @RequestMapping(value="/deleteEvent", method = RequestMethod.POST)
    public String deleteEvent(@RequestParam("id") int eventId, @RequestParam("hostId") int hostId){
        eventDAO.delete(eventId);
        hostDAO.delete(hostId); 
        return "redirect:/";
    }

    @RequestMapping(value = "/insertOrUpdateContact", method = RequestMethod.POST)
    public String addContact(Contact contact) {
        contactDAO.insertOrUpdate(contact);
        return "redirect:/";
    }

    @RequestMapping(value = "/updateHost", method = RequestMethod.POST)
    public String updateHost(Host host) {
        hostDAO.insertOrUpdate(host);
        return "redirect:/";
    }

    @RequestMapping(value = "/deleteContact", method = RequestMethod.POST)
    public String deleteContact(@RequestParam("id") int id) {
        contactDAO.delete(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/insertOrUpdateEventContact", method = RequestMethod.POST)
    public String addEventContact(EventContact eventContact) {
        eventContactDAO.insertOrUpdate(eventContact);
        return "redirect:/";
    }

    @RequestMapping(value = "/deleteEventContact", method = RequestMethod.POST)
    public String deleteEventContact(@RequestParam("id") int id) {
        eventContactDAO.delete(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/eventJSON", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public String eventJSON() {
        String output = "";
        for (Event e : eventDAO.getAll()) {
            if (output.equals("")) {
                output = e.toJSON();
            } else {
                output = output + ",\n" + e.toJSON();
            }
        }
        return "[" + output + "]";
    }

    @RequestMapping(value = "/hostJSON", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public String hostJSON() {
        String output = "";
        for (Host h : hostDAO.getAll()) {
            if (output.equals("")) {
                output = h.toJSON();
            } else {
                output = output + ",\n" + h.toJSON();
            }
        }
        return "[" + output + "]";
    }

    @RequestMapping(value = "/contactJSON", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public String contactJSON() {
        String output = "";
        for (Contact c : contactDAO.getAll()) {
            if (output.equals("")) {
                output = c.toJSON();
            } else {
                output = output + ",\n" + c.toJSON();
            }
        }
        return "[" + output + "]";
    }

    @RequestMapping(value = "/eventContactJSON", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public String eventContactJSON() {
        String output = "";
        for (EventContact ec : eventContactDAO.getAll()) {
            if (output.equals("")) {
                output = ec.toJSON();
            } else {
                output = output + ",\n" + ec.toJSON();
            }
        }
        return "[" + output + "]";
    }

    @RequestMapping(value = "/searchEvent", method = RequestMethod.POST)
    public String searchEvent(Event event, Model model) {
        model.addAttribute("check", eventSearchDAO.getAll(event));
        return "eventSearchResult";
    }
}
