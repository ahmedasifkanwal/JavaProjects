/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceTrackerReviewer;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface PerformanceTrackerReviewerService {
  
    PerformanceTrackerReviewer create(PerformanceTrackerReviewer t);

    PerformanceTrackerReviewer read(Integer id);

    PerformanceTrackerReviewer update(PerformanceTrackerReviewer t);

    void delete(Integer id);

    List<PerformanceTrackerReviewer> findAll();

}
