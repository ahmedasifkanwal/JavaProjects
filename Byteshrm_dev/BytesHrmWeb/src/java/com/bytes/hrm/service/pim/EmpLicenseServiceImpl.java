/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;


import com.bytes.hrm.dao.entity.EmpLicense;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpLicenseDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpLicenseServiceImpl implements EmpLicenseService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpLicenseDao dao = factory.getEmpLicenseDao();

    @Override
    public EmpLicense read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpLicense update(EmpLicense t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpLicense> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpLicense create(EmpLicense t) {
        return dao.create(t);
    }

    @Override
    public List<EmpLicense> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
