/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceTrackerLog;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface PerformanceTrackerLogService {
  
    PerformanceTrackerLog create(PerformanceTrackerLog t);

    PerformanceTrackerLog read(Integer id);

    PerformanceTrackerLog update(PerformanceTrackerLog t);

    void delete(Integer id);

    List<PerformanceTrackerLog> findAll();

}
