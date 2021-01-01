/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Education;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EducationService {
  
    Education create(Education t);

    Education read(Integer id);

    Education update(Education t);

    void delete(Integer id);

    List<Education> findAll();

}
