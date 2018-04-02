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
@Table(name = "stall_rates")
@NamedQueries({
    @NamedQuery(name = "StallRate.findAll", query = "SELECT s FROM StallRate s")})
public class StallRate implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "size")
    private String size;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "cost_per_day")
    private Double costPerDay;
    @OneToMany(mappedBy = "stallSize")
    private List<Stall> stallList;

    public StallRate() {
    }

    public StallRate(String size) {
        this.size = size;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Double getCostPerDay() {
        return costPerDay;
    }

    public void setCostPerDay(Double costPerDay) {
        this.costPerDay = costPerDay;
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
        hash += (size != null ? size.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StallRate)) {
            return false;
        }
        StallRate other = (StallRate) object;
        if ((this.size == null && other.size != null) || (this.size != null && !this.size.equals(other.size))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lfa.emsys.entity.StallRate[ size=" + size + " ]";
    }
    
}
