/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;


import com.bytes.hrm.service.leave.*;
import com.bytes.hrm.dao.entity.AstBrand;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface AstBrandService {
  
    AstBrand create(AstBrand t);

    AstBrand read(Integer id);

    AstBrand update(AstBrand t);

    void delete(Integer id);

    List<AstBrand> findAll();

}
