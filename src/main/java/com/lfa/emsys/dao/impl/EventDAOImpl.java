/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao.impl;

import com.lfa.emsys.dao.EventDAO;
import com.lfa.emsys.entity.Event;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dell-pc
 */
@Repository
public class EventDAOImpl implements EventDAO{

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;
    
    @Override
    public List<Event> getAll() {
        session = sessionFactory.openSession();
        return session.createQuery("Select e from Event e").list();
    }
    
    @Override
    public void insertOrUpdate(Event event) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.saveOrUpdate(event);
        trans.commit();
    }
    
    @Override
    public boolean delete(int id) {
        Event event = getById(id);
        if(event!=null){
            session = sessionFactory.openSession();
            trans=session.beginTransaction();
            session.delete(event);
            trans.commit();
            return true;
        }
        return false;
    }

    @Override
    public Event getById(int id) {
        session= sessionFactory.openSession();
        return (Event)session.get(Event.class, id);
    }

    @Override
    public List<Event> searchFromEntity(Event t) {
        session = sessionFactory.openSession();
        System.out.println(t.getType()+t.getName()+" check is working");
        return session.createCriteria(Event.class).add(Restrictions
                .and(Restrictions.like("type", "%"+t.getType()+"%"),
                        Restrictions.like("name", "%"+t.getName()+"%")))
                .list();
    }

    

    

}
