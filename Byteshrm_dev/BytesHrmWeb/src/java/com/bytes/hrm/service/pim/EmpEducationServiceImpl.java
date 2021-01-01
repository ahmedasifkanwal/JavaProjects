/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpEducation;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpEducationDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpEducationServiceImpl implements EmpEducationService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpEducationDao dao = factory.getEmpEducationDao();

    @Override
    public EmpEducation read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpEducation update(EmpEducation t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpEducation> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpEducation create(EmpEducation t) {
        return dao.create(t);
    }

    @Override
    public List<EmpEducation> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
