/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;


import com.bytes.hrm.dao.entity.AstStatus;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface AstStatusService {
  
    AstStatus create(AstStatus t);

    AstStatus read(Integer id);

    AstStatus update(AstStatus t);

    void delete(Integer id);

    List<AstStatus> findAll();

}
