/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.common;

import com.bytes.hrm.dao.entity.Country;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface CountryService {

    Country create(Country t);

    Country read(String id);

    Country update(Country t);

    void delete(String id);

    List<Country> findAll();

}
