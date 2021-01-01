/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.WorkWeek;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface WorkWeekService {
  
    WorkWeek create(WorkWeek t);

    WorkWeek read(Integer id);

    WorkWeek update(WorkWeek t);

    void delete(Integer id);

    List<WorkWeek> findAll();

}
