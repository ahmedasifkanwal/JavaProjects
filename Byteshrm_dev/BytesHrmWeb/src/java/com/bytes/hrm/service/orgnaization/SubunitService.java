/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.orgnaization;

import com.bytes.hrm.dao.entity.Subunit;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface SubunitService {

    Subunit create(Subunit t);

    Subunit read(Integer id);

    Subunit update(Subunit t);

    void delete(Integer id);

    List< Subunit> findAll();

    List<Subunit> getSubunitByLevel(Integer id);

    List<Subunit> findChild(Integer id);

    List<Subunit> findParent(Integer id);
    boolean deleteChild(Integer id);

}
