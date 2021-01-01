/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveLeaveEntitlement;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveLeaveEntitlementService {
  
    LeaveLeaveEntitlement create(LeaveLeaveEntitlement t);

    LeaveLeaveEntitlement read(Integer id);

    LeaveLeaveEntitlement update(LeaveLeaveEntitlement t);

    void delete(Integer id);

    List<LeaveLeaveEntitlement> findAll();

}
