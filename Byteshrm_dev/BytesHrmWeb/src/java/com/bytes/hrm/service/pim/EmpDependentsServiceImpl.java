/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpChildren;
import com.bytes.hrm.dao.entity.EmpChildrenPK;
import com.bytes.hrm.dao.entity.EmpDependents;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpDependentsDao;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public class EmpDependentsServiceImpl implements EmpDependentsService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpDependentsDao dao = factory.getEmpDependentsDao();

    @Override
    public EmpDependents read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpDependents update(EmpDependents t) {
        if (t.getEdRelationshipType().equals("Child")) {
            EmpChildren child = new EmpChildren();
            child.setEcDateOfBirth(t.getEdDateOfBirth());
            child.setEcName(t.getEdName());
            EmpChildrenPK empChildrenPK = new EmpChildrenPK();
            empChildrenPK.setEmpNumber(t.getEmpDependentsPK().getEmpNumber());
            child.setEmpChildrenPK(empChildrenPK);
            dao.twinUpdate(t, child);
            return t;

        } else {
            return dao.update(t);
        }
     
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpDependents> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpDependents create(EmpDependents t) {
        return dao.create(t);
    }

    @Override
    public Collection<EmpDependents> search(Map<String, Object> m) {
       return dao.search(m);
    }

}
