/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.common;

import com.bytes.hrm.dao.entity.CurrencyType;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.common.CurrencyTypeDao;

import java.util.List;

/**
 *
 * @author Shahid
 */
public class CurrencyTypeServiceImpl implements CurrencyTypeService {

    // create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    CurrencyTypeDao dao = factory.getCurrencyTypeDao();

    @Override
    public CurrencyType create(CurrencyType t) {
        return dao.create(t);

    }

    @Override
    public CurrencyType read(String id) {
        return dao.read(id);
    }

    @Override
    public CurrencyType update(CurrencyType t) {
        return dao.update(t);
    }

    @Override
    public void delete(String id) {
        dao.delete(id);
    }

    @Override
    public List< CurrencyType> findAll() {
        return dao.findAll();
    }

}
