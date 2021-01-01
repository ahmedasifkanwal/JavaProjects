/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;


import com.bytes.hrm.service.leave.*;
import com.bytes.hrm.dao.entity.AstAsset;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface AstAssetService {
  
    AstAsset create(AstAsset t);

    AstAsset read(Integer id);

    AstAsset update(AstAsset t);

    void delete(Integer id);

    List<AstAsset> findAll();

}
