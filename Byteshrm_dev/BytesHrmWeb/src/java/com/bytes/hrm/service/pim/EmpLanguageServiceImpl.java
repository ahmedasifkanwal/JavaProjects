/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;


import com.bytes.hrm.dao.entity.EmpLanguage;
import com.bytes.hrm.dao.entity.EmpLanguagePK;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpLanguageDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpLanguageServiceImpl implements EmpLanguageService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpLanguageDao dao = factory.getEmpLanguageDao();

    @Override
    public EmpLanguage read(EmpLanguagePK id) {
        return dao.read(id);
    }

    @Override
    public EmpLanguage update(EmpLanguage t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpLanguage> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpLanguage create(EmpLanguage t) {
        return dao.create(t);
    }

    @Override
    public List<EmpLanguage> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
