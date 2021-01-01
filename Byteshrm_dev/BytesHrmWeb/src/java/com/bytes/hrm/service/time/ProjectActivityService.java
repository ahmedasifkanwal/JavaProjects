/*
 * To change this license header, choose License Headers in Activity Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.time;

import com.bytes.hrm.dao.entity.ProjectActivity;
import java.util.List;


/**
 *
 * @author Shahid
 */
public interface ProjectActivityService {
  
     ProjectActivity create( ProjectActivity t);

     ProjectActivity read(Integer id);

     ProjectActivity update( ProjectActivity t);

    void delete(Integer id);

    List< ProjectActivity> findAll();

}
