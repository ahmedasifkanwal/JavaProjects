/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpTerminationReason;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmpTerminationReasonDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpTerminationReasonServiceImpl implements EmpTerminationReasonService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmpTerminationReasonDao dao = factory.getEmpTerminationReasonDao();

    @Override
    public EmpTerminationReason read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmpTerminationReason update(EmpTerminationReason t) {

        dao.update(t);
        return t;

    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<EmpTerminationReason> findAll() {
        return dao.findAll();
    }

    @Override
    public EmpTerminationReason create(EmpTerminationReason t) {
        return dao.create(t);
    }

}
