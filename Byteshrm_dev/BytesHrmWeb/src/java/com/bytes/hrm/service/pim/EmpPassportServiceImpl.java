/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpPassport;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpPassportDao;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public class EmpPassportServiceImpl implements EmpPassportService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpPassportDao dao = factory.getEmpPassportDao();

    @Override
    public EmpPassport read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpPassport update(EmpPassport t) {

        return dao.update(t);

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpPassport> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpPassport create(EmpPassport t) {
        return dao.create(t);
    }

    @Override
    public Collection<EmpPassport> search(Map<String, Object> m) {
       return dao.search(m);
    }

}
