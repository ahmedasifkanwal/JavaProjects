/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;


import com.bytes.hrm.dao.entity.EmpSkill;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpSkillDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpSkillServiceImpl implements EmpSkillService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpSkillDao dao = factory.getEmpSkillDao();

    @Override
    public EmpSkill read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpSkill update(EmpSkill t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpSkill> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpSkill create(EmpSkill t) {
        return dao.create(t);
    }

    @Override
    public List<EmpSkill> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
