/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveRequest;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveRequestService {
  
    LeaveRequest create(LeaveRequest t);

    LeaveRequest read(Integer id);

    LeaveRequest update(LeaveRequest t);

    void delete(Integer id);

    List<LeaveRequest> findAll();

}
