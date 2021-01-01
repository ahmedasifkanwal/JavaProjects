/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;

import com.bytes.hrm.common.helper.DateHelper;
import com.bytes.hrm.dao.entity.LeaveEntitlement;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveEntitlementDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveEntitlementServiceImpl implements LeaveEntitlementService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveEntitlementDao dao = factory.getLeaveEntitlementDao();

    @Override
    public LeaveEntitlement create(LeaveEntitlement t) {
        t.setNoOfDays(new BigDecimal(DateHelper.getNoOfDays(t.getFromDate(), t.getToDate())));
        t.setDaysUsed(new BigDecimal(0));
        //When Creted the Days used will be zero.
        return dao.create(t);
    }

    @Override
    public LeaveEntitlement read(Integer id) {

        return dao.read(id);
    }

    @Override
    public LeaveEntitlement update(LeaveEntitlement t) {

        t.setNoOfDays(new BigDecimal(DateHelper.getNoOfDays(t.getFromDate(), t.getToDate())));
        return dao.update(t);

    }

    @Override
    public void delete(Integer id) {

        dao.delete(id);
    }

    @Override
    public List<LeaveEntitlement> findAll() {
        return dao.findAll();
    }

    @Override
    public List<LeaveEntitlement> readByEmpNumber(Integer empNumber) {
        return dao.readByEmpNumber(empNumber);
    }

}
