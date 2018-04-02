/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lfa.emsys.dao.EventSearchDAO;
import com.lfa.emsys.entity.Event;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dell-pc
 */
@Repository
public class EventSearchDAOImpl implements EventSearchDAO<Event> {
    
    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Event> getAll(Event event) {
        session = sessionFactory.openSession();
        System.out.println(event.getType()+event.getName()+" check is working");
        return session.createCriteria(Event.class).add(Restrictions
                .and(Restrictions.like("name", "%"+event.getName()+"%")))
                .list();
    }
}


