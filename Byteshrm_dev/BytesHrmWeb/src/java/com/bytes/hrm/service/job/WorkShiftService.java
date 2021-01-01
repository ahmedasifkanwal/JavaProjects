/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.WorkShift;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface WorkShiftService {
  
    WorkShift create(WorkShift t);

    WorkShift read(Integer id);

    WorkShift update(WorkShift t);

    void delete(Integer id);

    List<WorkShift> findAll();

}
