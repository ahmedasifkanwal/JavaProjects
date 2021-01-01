/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;

import com.bytes.hrm.dao.entity.LeaveEntitlementType;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveEntitlementTypeDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveEntitlementTypeServiceImpl implements LeaveEntitlementTypeService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveEntitlementTypeDao dao = factory.getLeaveEntitlementTypeDao();

    @Override
    public LeaveEntitlementType create(LeaveEntitlementType t) {
        return dao.create(t);
    }

    @Override
    public LeaveEntitlementType read(Integer id) {

        return dao.read(id);
    }

    @Override
    public LeaveEntitlementType update(LeaveEntitlementType t) {

        return dao.update(t);

    }

    @Override
    public void delete(Integer id) {

        dao.delete(id);
    }

    @Override
    public List<LeaveEntitlementType> findAll() {
        return dao.findAll();

    }
}
