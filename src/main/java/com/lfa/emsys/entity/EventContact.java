/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author dell-pc
 */
@Entity
@Table(name = "event_contacts")
@NamedQueries({
    @NamedQuery(name = "EventContact.findAll", query = "SELECT e FROM EventContact e")})
public class EventContact implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "contact")
    private String contact;
    @Column(name = "email")
    private String email;
    @Column(name = "role")
    private String role;
    @Column(name = "stall_no")
    private Integer stallNo;
    @Column(name = "status")
    private Boolean status;
    @JoinColumn(name = "event_id", referencedColumnName = "id")
    @ManyToOne
    private Event eventId;
    @OneToMany(mappedBy = "stallAdminId")
    private List<Stall> stallList;

    public EventContact() {
    }

    public EventContact(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getStallNo() {
        return stallNo;
    }

    public void setStallNo(Integer stallNo) {
        this.stallNo = stallNo;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Event getEventId() {
        return eventId;
    }

    public void setEventId(Event eventId) {
        this.eventId = eventId;
    }

    public List<Stall> getStallList() {
        return stallList;
    }

    public void setStallList(List<Stall> stallList) {
        this.stallList = stallList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EventContact)) {
            return false;
        }
        EventContact other = (EventContact) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lfa.emsys.entity.EventContact[ id=" + id + " ]";
    }
    
     public String toJSON() {
        String json = "{\n";
        json += "\t\"id\":\"" + id + "\",\n";
        json += "\t\"name\":\"" + name + "\",\n";
        json += "\t\"contact\":\"" + contact + "\",\n";
        json += "\t\"email\":\"" + email + "\",\n";
        json += "\t\"role\":\"" + role + "\",\n";
        json += "\t\"status\":\"" + status + "\"\n";
        json += "\n}";
        return json;
    }
}
