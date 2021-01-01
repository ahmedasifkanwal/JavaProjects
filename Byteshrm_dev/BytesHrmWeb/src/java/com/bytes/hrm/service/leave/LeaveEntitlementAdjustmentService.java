/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveEntitlementAdjustment;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveEntitlementAdjustmentService {
  
    LeaveEntitlementAdjustment create(LeaveEntitlementAdjustment t);

    LeaveEntitlementAdjustment read(Integer id);

    LeaveEntitlementAdjustment update(LeaveEntitlementAdjustment t);

    void delete(Integer id);

    List<LeaveEntitlementAdjustment> findAll();

}
