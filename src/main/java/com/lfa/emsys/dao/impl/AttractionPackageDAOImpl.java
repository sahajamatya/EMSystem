/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao.impl;

import com.lfa.emsys.dao.AttractionPackageDAO;
import com.lfa.emsys.entity.AttractionPackage;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dell-pc
 */
@Repository
public class AttractionPackageDAOImpl implements AttractionPackageDAO{

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;
    
    @Override
    public List<AttractionPackage> getAll() {
        session=sessionFactory.openSession();
        return session.createQuery("Select ap from AttractionPackage ap").list();
    }

    @Override
    public void insertOrUpdate(AttractionPackage t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AttractionPackage getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AttractionPackage> searchFromEntity(AttractionPackage t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
