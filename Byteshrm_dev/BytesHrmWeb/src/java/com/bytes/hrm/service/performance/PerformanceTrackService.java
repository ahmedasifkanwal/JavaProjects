/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceTrack;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface PerformanceTrackService {
  
    PerformanceTrack create(PerformanceTrack t);

    PerformanceTrack read(Integer id);

    PerformanceTrack update(PerformanceTrack t);

    void delete(Integer id);

    List<PerformanceTrack> findAll();

}
