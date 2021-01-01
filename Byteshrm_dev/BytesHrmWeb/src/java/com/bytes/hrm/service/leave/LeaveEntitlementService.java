/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveEntitlement;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveEntitlementService {
  
    LeaveEntitlement create(LeaveEntitlement t);

    LeaveEntitlement read(Integer id);

    LeaveEntitlement update(LeaveEntitlement t);

    void delete(Integer id);

    List<LeaveEntitlement> findAll();
    List<LeaveEntitlement> readByEmpNumber(Integer empNumber);
}
