/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;


import com.bytes.hrm.dao.entity.Leaves;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LeavesService {
  
    Leaves create(Leaves t);

    Leaves read(Integer id);

    Leaves update(Leaves t);

    void delete(Integer id);

    List<Leaves> findAll();

}
