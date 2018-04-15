/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao.impl;

import com.lfa.emsys.dao.EventContactDAO;
import com.lfa.emsys.entity.EventContact;
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
public class EventContactDAOImpl implements EventContactDAO{

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;
    
    @Override
    public List<EventContact> getAll() {
        session=sessionFactory.openSession();
        return session.createQuery("Select ec from EventContact ec").list();
    }

    @Override
    public void insertOrUpdate(EventContact t) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.saveOrUpdate(t);
        trans.commit();
    }

    @Override
    public boolean delete(int id) {
        EventContact ec = getById(id);
        if(ec!=null){
            session = sessionFactory.openSession();
            trans = session.beginTransaction();
            session.delete(ec);
            trans.commit();
            return true;
        }
        return false;
    }

    @Override
    public EventContact getById(int id) {
        session = sessionFactory.openSession();
        return (EventContact)session.get(EventContact.class, id);
    }

    @Override
    public List<EventContact> searchFromEntity(EventContact t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
