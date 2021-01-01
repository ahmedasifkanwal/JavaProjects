/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.common;

import com.bytes.hrm.dao.entity.Country;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.common.CountryDao;

import java.util.List;

/**
 *
 * @author Shahid
 */
public class CountryServiceImpl implements CountryService {

    // create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    CountryDao dao = factory.getCountryDao();

    @Override
    public Country create(Country t) {
        return dao.create(t);

    }

    @Override
    public Country read(String id) {
        return dao.read(id);
    }

    @Override
    public Country update(Country t) {
        return dao.update(t);
    }

    @Override
    public void delete(String id) {
        dao.delete(id);
    }

    @Override
    public List< Country> findAll() {
        return dao.findAll();
    }

}
