/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.common;

import com.bytes.hrm.dao.entity.Nationality;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.common.NationalityDao;

import java.util.List;

/**
 *
 * @author Shahid
 */
public class NationalityServiceImpl implements NationalityService {

    // create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    NationalityDao dao = factory.getNationalityDao();

    @Override
    public Nationality create(Nationality t) {
        return dao.create(t);

    }

    @Override
    public Nationality read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Nationality update(Nationality t) {
        return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List< Nationality> findAll() {
        return dao.findAll();
    }

}
