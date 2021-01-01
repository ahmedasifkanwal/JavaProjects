/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;

import com.bytes.hrm.dao.entity.LeaveEntitlement;
import com.bytes.hrm.dao.entity.LeaveEntitlementType;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveEntitlementTypeService {

    LeaveEntitlementType create(LeaveEntitlementType t);

    LeaveEntitlementType read(Integer id);

    LeaveEntitlementType update(LeaveEntitlementType t);

    void delete(Integer id);

    List<LeaveEntitlementType> findAll();

}
