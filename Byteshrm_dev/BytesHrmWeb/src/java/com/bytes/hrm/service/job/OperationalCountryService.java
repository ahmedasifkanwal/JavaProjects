/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.OperationalCountry;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface OperationalCountryService {
  
    OperationalCountry create(OperationalCountry t);

    OperationalCountry read(Integer id);

    OperationalCountry update(OperationalCountry t);

    void delete(Integer id);

    List<OperationalCountry> findAll();

}
