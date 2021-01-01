/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;


import com.bytes.hrm.service.leave.*;
import com.bytes.hrm.dao.entity.AstCategory;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface AstCategoryService {
  
    AstCategory create(AstCategory t);

    AstCategory read(Integer id);

    AstCategory update(AstCategory t);

    void delete(Integer id);

    List<AstCategory> findAll();

}
