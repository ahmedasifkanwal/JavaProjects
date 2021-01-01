/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.common;

import com.bytes.hrm.dao.entity.Nationality;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface NationalityService {

    Nationality create(Nationality t);

    Nationality read(Integer id);

    Nationality update(Nationality t);

    void delete(Integer id);

    List<Nationality> findAll();

}
