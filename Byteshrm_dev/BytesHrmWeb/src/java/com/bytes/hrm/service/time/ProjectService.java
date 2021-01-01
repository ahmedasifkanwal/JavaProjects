/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.time;

import com.bytes.hrm.dao.entity.Project;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface ProjectService {
  
    Project create(Project t);

    Project read(Integer id);

    Project update(Project t);

    void delete(Integer id);

    List<Project> findAll();

}
