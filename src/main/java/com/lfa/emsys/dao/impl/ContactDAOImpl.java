/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao.impl;

import com.lfa.emsys.dao.ContactDAO;
import com.lfa.emsys.entity.Contact;
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
public class ContactDAOImpl implements ContactDAO{

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;
    
    @Override
    public List<Contact> getAll() {
        session=sessionFactory.openSession();
        return session.createQuery("Select c from Contact c").list();
    }

    @Override
    public void insertOrUpdate(Contact t) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.saveOrUpdate(t);
        trans.commit();
    }

    @Override
    public boolean delete(int id) {
        Contact contact = getById(id);
        if(contact!=null){
            session = sessionFactory.openSession();
            trans = session.beginTransaction();
            session.delete(contact);
            trans.commit();
            return true;
        }
        return false;
    }

    @Override
    public Contact getById(int id) {
        session = sessionFactory.openSession();
        return (Contact)session.get(Contact.class, id);
    }

    @Override
    public List<Contact> searchFromEntity(Contact t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
