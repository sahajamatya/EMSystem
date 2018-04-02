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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author dell-pc
 */
@Entity
@Table(name = "hosts")
@NamedQueries({
    @NamedQuery(name = "Host.findAll", query = "SELECT h FROM Host h")})
public class Host implements Serializable {

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
    @Column(name = "address")
    private String address;
    @Column(name = "status")
    private Boolean status;
    @OneToMany(mappedBy = "hostId")
    private List<Event> eventList;

    public Host() {
    }

    public Host(Integer id) {
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public List<Event> getEventList() {
        return eventList;
    }

    public void setEventList(List<Event> eventList) {
        this.eventList = eventList;
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
        if (!(object instanceof Host)) {
            return false;
        }
        Host other = (Host) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lfa.emsys.entity.Host[ id=" + id + " ]";
    }
    
    public String toJSON() {
        String json = "{\n";
        json += "\t\"id\":\"" + id + "\",\n";
        json += "\t\"name\":\"" + name + "\",\n";
        json += "\t\"contact\":\"" + contact + "\",\n";
        json += "\t\"email\":\"" + email + "\",\n";
        json += "\t\"address\":\"" + address + "\",\n";
        json += "\t\"status\":\"" + status + "\"\n";
        json += "\n}";
        return json;
    }
}
