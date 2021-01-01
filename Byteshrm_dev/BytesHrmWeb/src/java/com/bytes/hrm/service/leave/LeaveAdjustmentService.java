/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveAdjustment;
import com.bytes.hrm.dao.entity.LeaveType;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveAdjustmentService {
  
    LeaveAdjustment create(LeaveAdjustment t);

    LeaveAdjustment read(Integer id);

    LeaveAdjustment update(LeaveAdjustment t);

    void delete(Integer id);

    List<LeaveAdjustment> findAll();

}
