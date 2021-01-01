/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpReportingMethod;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpReportingMethodDao;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public class EmpReportingMethodServiceImpl implements EmpReportingMethodService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpReportingMethodDao dao = factory.getEmpReportingMethodDao();

    @Override
    public EmpReportingMethod read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpReportingMethod update(EmpReportingMethod t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpReportingMethod> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpReportingMethod create(EmpReportingMethod t) {
        return dao.create(t);
    }

    @Override
    public long searchCount(Map<String, Object> params) {

        return dao.searchCount(params);
    }

    @Override
    public List<EmpReportingMethod> search(Map<String, Object> params) {
        return dao.search(params);
    }

}
