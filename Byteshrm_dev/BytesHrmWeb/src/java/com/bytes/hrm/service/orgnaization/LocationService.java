/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.orgnaization;

import com.bytes.hrm.dao.entity.Location;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LocationService {
  
    Location create(Location t);

    Location read(Integer id);

    Location update(Location t);

    void delete(Integer id);

    List<Location> findAll();

}
