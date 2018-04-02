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
@Table(name = "stalls")
@NamedQueries({
    @NamedQuery(name = "Stall.findAll", query = "SELECT s FROM Stall s")})
public class Stall implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "stall_name")
    private String stallName;
    @Column(name = "status")
    private Boolean status;
    @OneToMany(mappedBy = "stallNo")
    private List<Item> itemList;
    @JoinColumn(name = "stall_admin_id", referencedColumnName = "id")
    @ManyToOne
    private EventContact stallAdminId;
    @OneToMany(mappedBy = "stallNo")
    private List<Stall> stallList;
    @JoinColumn(name = "stall_no", referencedColumnName = "id")
    @ManyToOne
    private Stall stallNo;
    @JoinColumn(name = "type_code", referencedColumnName = "code")
    @ManyToOne
    private StallType typeCode;
    @JoinColumn(name = "stall_size", referencedColumnName = "size")
    @ManyToOne
    private StallRate stallSize;

    public Stall() {
    }

    public Stall(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStallName() {
        return stallName;
    }

    public void setStallName(String stallName) {
        this.stallName = stallName;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    public EventContact getStallAdminId() {
        return stallAdminId;
    }

    public void setStallAdminId(EventContact stallAdminId) {
        this.stallAdminId = stallAdminId;
    }

    public List<Stall> getStallList() {
        return stallList;
    }

    public void setStallList(List<Stall> stallList) {
        this.stallList = stallList;
    }

    public Stall getStallNo() {
        return stallNo;
    }

    public void setStallNo(Stall stallNo) {
        this.stallNo = stallNo;
    }

    public StallType getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(StallType typeCode) {
        this.typeCode = typeCode;
    }

    public StallRate getStallSize() {
        return stallSize;
    }

    public void setStallSize(StallRate stallSize) {
        this.stallSize = stallSize;
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
        if (!(object instanceof Stall)) {
            return false;
        }
        Stall other = (Stall) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lfa.emsys.entity.Stall[ id=" + id + " ]";
    }
    
}
