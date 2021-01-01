/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;


import com.bytes.hrm.dao.entity.EmpWorkExperience;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpWorkExperienceDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpWorkExperienceServiceImpl implements EmpWorkExperienceService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpWorkExperienceDao dao = factory.getEmpWorkExperienceDao();

    @Override
    public EmpWorkExperience read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpWorkExperience update(EmpWorkExperience t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpWorkExperience> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpWorkExperience create(EmpWorkExperience t) {
        return dao.create(t);
    }

    @Override
    public List<EmpWorkExperience> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
