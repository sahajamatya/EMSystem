/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.controller;

import com.lfa.emsys.dao.AttractionPackageDAO;
import com.lfa.emsys.dao.ContactDAO;
import com.lfa.emsys.dao.EventContactDAO;
import com.lfa.emsys.dao.EventDAO;
import com.lfa.emsys.dao.EventSearchDAO;
import com.lfa.emsys.dao.HostDAO;
import com.lfa.emsys.entity.AttractionPackage;
import com.lfa.emsys.entity.Contact;
import com.lfa.emsys.entity.Event;
import com.lfa.emsys.entity.EventContact;
import com.lfa.emsys.entity.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    
    @Autowired
    private AttractionPackageDAO attractionPkgDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("events", eventDAO.getAll());
        model.addAttribute("ap", attractionPkgDAO.getAll());
        model.addAttribute("ec", eventContactDAO.getAll());
        return "index";
    }

    @RequestMapping(value = "/addEvent", method = RequestMethod.POST)
    public String addEvent(Event event) {
        eventDAO.insertOrUpdate(event);
        return "redirect:/";
    }

    @RequestMapping(value = "/eventJSON", produces=MediaType.APPLICATION_JSON_VALUE, method=RequestMethod.GET)
    @ResponseBody
    public String eventJSON() {
        String output="";
        for(Event e: eventDAO.getAll()){
            if(output.equals("")){
                output=e.toJSON();
            } else {
                output = output + ",\n" + e.toJSON();
            }
        }
        return "[" + output + "]";
    }
    
    @RequestMapping(value = "/hostJSON", produces=MediaType.APPLICATION_JSON_VALUE, method=RequestMethod.GET)
    @ResponseBody
    public String hostJSON() {
        String output="";
        for(Host h: hostDAO.getAll()){
            if(output.equals("")){
                output=h.toJSON();
            } else {
                output = output + ",\n" + h.toJSON();
            }
        }
        return "[" + output + "]";
    }
    
    @RequestMapping(value = "/contactJSON", produces=MediaType.APPLICATION_JSON_VALUE, method=RequestMethod.GET)
    @ResponseBody
    public String contactJSON() {
        String output="";
        for(Contact c: contactDAO.getAll()){
            if(output.equals("")){
                output=c.toJSON();
            } else {
                output = output + ",\n" + c.toJSON();
            }
        }
        return "[" + output + "]";
    }
    
    @RequestMapping(value = "/eventContactJSON", produces=MediaType.APPLICATION_JSON_VALUE, method=RequestMethod.GET)
    @ResponseBody
    public String eventContactJSON() {
        String output="";
        for(EventContact ec: eventContactDAO.getAll()){
            if(output.equals("")){
                output=ec.toJSON();
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



