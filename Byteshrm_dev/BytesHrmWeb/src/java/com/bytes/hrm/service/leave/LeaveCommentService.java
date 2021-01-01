/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeaveComment;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeaveCommentService {
  
    LeaveComment create(LeaveComment t);

    LeaveComment read(Integer id);

    LeaveComment update(LeaveComment t);

    void delete(Integer id);

    List<LeaveComment> findAll();

}
