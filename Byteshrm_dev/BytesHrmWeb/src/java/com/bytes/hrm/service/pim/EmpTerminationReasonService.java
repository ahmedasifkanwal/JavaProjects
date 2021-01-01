/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpTerminationReason;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpTerminationReasonService {

    EmpTerminationReason create(EmpTerminationReason t);

    EmpTerminationReason read(Integer id);

    EmpTerminationReason update(EmpTerminationReason t);

    void delete(Integer id);

    List<EmpTerminationReason> findAll();
}
