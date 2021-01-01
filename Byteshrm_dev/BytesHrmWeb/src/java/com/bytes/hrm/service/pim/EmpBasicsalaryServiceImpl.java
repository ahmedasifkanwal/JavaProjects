/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpBasicsalary;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpBasicsalaryDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpBasicsalaryServiceImpl implements EmpBasicsalaryService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpBasicsalaryDao dao = factory.getEmpBasicsalaryDao();

    @Override
    public EmpBasicsalary read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpBasicsalary update(EmpBasicsalary t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpBasicsalary> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpBasicsalary create(EmpBasicsalary t) {
        return dao.create(t);
    }

    @Override
    public List<EmpBasicsalary> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
