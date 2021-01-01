/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.orgnaization;

import com.bytes.hrm.dao.entity.Subunit;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.orgnaization.SubunitDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class SubunitServiceImpl implements SubunitService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    SubunitDao dao = factory.getSubunitDao();

    @Override
    public Subunit create(Subunit t) {
        return dao.create(t);

    }

    @Override
    public Subunit read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Subunit update(Subunit t) {
        return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<Subunit> findAll() {
        return dao.findAll();
    }

    @Override
    public List<Subunit> getSubunitByLevel(Integer id) {
       return dao.getSubunitByLevel(id);
    }

    @Override
    public List<Subunit> findChild(Integer id) {
         return dao.findChild(id);
    }

    @Override
    public List<Subunit> findParent(Integer id) {
       return dao.findParent(id);
    }

    @Override
    public boolean deleteChild(Integer id) {
       return dao.deleteChild(id);
    }

}
