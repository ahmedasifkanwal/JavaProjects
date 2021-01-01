/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.orgnaization;

import com.bytes.hrm.dao.entity.OrganizationGenInfo;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface OrganizationGenInfoService {
  
    OrganizationGenInfo create(OrganizationGenInfo t);

    OrganizationGenInfo read(Integer id);

    OrganizationGenInfo update(OrganizationGenInfo t);

    void delete(Integer id);

    List<OrganizationGenInfo> findAll();

}
