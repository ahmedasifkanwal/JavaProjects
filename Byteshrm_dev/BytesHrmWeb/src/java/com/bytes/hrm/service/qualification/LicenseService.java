/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.License;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LicenseService {
  
    License create(License t);

    License read(Integer id);

    License update(License t);

    void delete(Integer id);

    List<License> findAll();

}
