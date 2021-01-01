/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceReview;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface PerformanceReviewService {
  
    PerformanceReview create(PerformanceReview t);

    PerformanceReview read(Integer id);

    PerformanceReview update(PerformanceReview t);

    void delete(Integer id);

    List<PerformanceReview> findAll();

}
