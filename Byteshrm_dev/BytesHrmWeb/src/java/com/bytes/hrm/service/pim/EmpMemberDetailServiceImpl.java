/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpMemberDetail;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpMemberDetailDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpMemberDetailServiceImpl implements EmpMemberDetailService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpMemberDetailDao dao = factory.getEmpMemberDetailDao();

    @Override
    public EmpMemberDetail read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpMemberDetail update(EmpMemberDetail t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpMemberDetail> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpMemberDetail create(EmpMemberDetail t) {
        return dao.create(t);
    }

    @Override
    public List<EmpMemberDetail> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
