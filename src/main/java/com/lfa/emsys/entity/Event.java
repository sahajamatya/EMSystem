/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;

/**
 *
 * @author dell-pc
 */
@Entity
@Table(name = "events")
@NamedQueries({
    @NamedQuery(name = "Event.findAll", query = "SELECT e FROM Event e")})
public class Event implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "type")
    private String type;
    @Column(name = "name")
    private String name;
    @Column(name = "start_date")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date startDate;
    @Column(name = "end_date")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date endDate;
    @Column(name = "start_time")
    private String startTime;
    @Column(name = "end_time")
    private String endTime;
    @Column(name = "venue")
    private String venue;
    @Column(name = "address")
    private String address;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "budget")
    private Double budget;
    @Column(name = "est_guests")
    private Integer estGuests;
    @Column(name = "status")
    private Boolean status;
//    @OneToMany(mappedBy = "eventId")
//    private List<EventContact> eventContactList;
    @JoinColumn(name = "host_id", referencedColumnName = "id")
    @ManyToOne
    private Host hostId;
    @JoinColumn(name = "attraction_pkg_id", referencedColumnName = "id")
    @ManyToOne
    private AttractionPackage attractionPkgId;

    public Event() {
    }

    public Event(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getBudget() {
        return budget;
    }

    public void setBudget(Double budget) {
        this.budget = budget;
    }

    public Integer getEstGuests() {
        return estGuests;
    }

    public void setEstGuests(Integer estGuests) {
        this.estGuests = estGuests;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

//    public List<EventContact> getEventContactList() {
//        return eventContactList;
//    }
//
//    public void setEventContactList(List<EventContact> eventContactList) {
//        this.eventContactList = eventContactList;
//    }

    public Host getHostId() {
        return hostId;
    }

    public void setHostId(Host hostId) {
        this.hostId = hostId;
    }

    public AttractionPackage getAttractionPkgId() {
        return attractionPkgId;
    }

    public void setAttractionPkgId(AttractionPackage attractionPkgId) {
        this.attractionPkgId = attractionPkgId;
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
        if (!(object instanceof Event)) {
            return false;
        }
        Event other = (Event) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    public String toJSON() {
        String json = "{\n";
        json += "\t\"id\":\"" + id + "\",\n";
        json += "\t\"name\":\"" + name + "\",\n";
        json += "\t\"type\":\"" + type + "\",\n";
        json += "\t\"startDate\":\"" + startDate + "\",\n";
        json += "\t\"endDate\":\"" + endDate + "\",\n";
        json += "\t\"startTime\":\"" + startTime + "\",\n";
        json += "\t\"endTime\":\"" + endTime + "\",\n";
        json += "\t\"venue\":\"" + venue + "\",\n";
        json += "\t\"address\":\"" + address + "\",\n";
        json += "\t\"budget\":\"" + budget + "\",\n";
        json += "\t\"estGuests\":\"" + estGuests + "\",\n";
        json += "\t\"status\":\"" + status + "\",\n";
        json += "\t\"attractionPkgId\":" + attractionPkgId.toJSON() + ",\n";
        json += "\t\"hostId\":" + hostId.toJSON() ;
        json += "\n}";
        return json;
    }
}
