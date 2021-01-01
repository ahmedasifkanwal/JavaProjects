/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpEmergencyContacts;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public interface EmpEmergencyContactsService {

    EmpEmergencyContacts create(EmpEmergencyContacts t);

    EmpEmergencyContacts read(Integer id);

    EmpEmergencyContacts update(EmpEmergencyContacts t);

    void delete(Integer id);

    List<EmpEmergencyContacts> findAll();
    
    Collection<EmpEmergencyContacts> search( Map<String, Object> m);

}
