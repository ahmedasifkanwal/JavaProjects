/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.LeavePeriodHistory;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeavePeriodHistoryService {
  
    LeavePeriodHistory create(LeavePeriodHistory t);

    LeavePeriodHistory read(Integer id);

    LeavePeriodHistory update(LeavePeriodHistory t);

    void delete(Integer id);

    List<LeavePeriodHistory> findAll();

}
