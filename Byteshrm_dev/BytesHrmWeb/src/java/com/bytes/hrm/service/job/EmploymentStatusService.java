/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.EmploymentStatus;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmploymentStatusService {
  
    EmploymentStatus create(EmploymentStatus t);

    EmploymentStatus read(Integer id);

    EmploymentStatus update(EmploymentStatus t);

    void delete(Integer id);

    List<EmploymentStatus> findAll();

}
