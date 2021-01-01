/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpReportto;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpReporttoDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpReporttoServiceImpl implements EmpReporttoService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpReporttoDao dao = factory.getEmpReporttoDao();

    @Override
    public EmpReportto read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpReportto update(EmpReportto t) {

        return dao.update(t);

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpReportto> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpReportto create(EmpReportto t) {
        return dao.create(t);
    }

}
