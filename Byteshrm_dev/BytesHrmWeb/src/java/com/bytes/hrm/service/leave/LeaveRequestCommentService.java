/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveRequestComment;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveRequestCommentService {
  
    LeaveRequestComment create(LeaveRequestComment t);

    LeaveRequestComment read(Integer id);

    LeaveRequestComment update(LeaveRequestComment t);

    void delete(Integer id);

    List<LeaveRequestComment> findAll();

}
