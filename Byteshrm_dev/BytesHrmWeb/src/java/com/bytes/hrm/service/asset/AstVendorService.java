/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;


import com.bytes.hrm.dao.entity.AstVendor;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface AstVendorService {
  
    AstVendor create(AstVendor t);

    AstVendor read(Integer id);

    AstVendor update(AstVendor t);

    void delete(Integer id);

    List<AstVendor> findAll();

}
