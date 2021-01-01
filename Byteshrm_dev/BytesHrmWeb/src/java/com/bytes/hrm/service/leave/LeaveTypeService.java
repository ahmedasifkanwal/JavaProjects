/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveType;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveTypeService {
  
    LeaveType create(LeaveType t);

    LeaveType read(Integer id);

    LeaveType update(LeaveType t);

    void delete(Integer id);

    List<LeaveType> findAll();

}
