/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Membership;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface MembershipService {
  
    Membership create(Membership t);

    Membership read(Integer id);

    Membership update(Membership t);

    void delete(Integer id);

    List<Membership> findAll();

}
