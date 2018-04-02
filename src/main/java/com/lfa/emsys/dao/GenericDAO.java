/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao;

import java.util.List;

/**
 *
 * @author dell-pc
 */
public interface GenericDAO<T> {
    List<T> getAll();
    void  insertOrUpdate(T t);
    boolean delete(int id);
    T getById(int id);
    List<T> searchFromEntity(T t);
}
