/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.emsys.dao;

import com.lfa.emsys.entity.AttractionPackage;
import java.util.List;

/**
 *
 * @author dell-pc
 */
public interface AttractionPackageDAO extends GenericDAO<AttractionPackage>{
    List<AttractionPackage> getAll();
}
