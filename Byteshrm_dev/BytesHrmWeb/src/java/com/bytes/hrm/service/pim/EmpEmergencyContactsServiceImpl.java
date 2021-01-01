/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpEmergencyContacts;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpEmergencyContactsDao;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public class EmpEmergencyContactsServiceImpl implements EmpEmergencyContactsService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpEmergencyContactsDao dao = factory.getEmpEmergencyContactsDao();

    @Override
    public EmpEmergencyContacts read(Integer id) {
        return dao.read(id);
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpEmergencyContacts> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpEmergencyContacts create(EmpEmergencyContacts t) {
        return dao.create(t);
    }

    @Override
    public EmpEmergencyContacts update(EmpEmergencyContacts t) {

        return dao.update(t);
    }

    @Override
    public Collection<EmpEmergencyContacts> search(Map<String, Object> m) {
        return dao.search(m);
    }

}
