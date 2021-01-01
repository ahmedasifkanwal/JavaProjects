/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpMemberDetail;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpMemberDetailService {

    EmpMemberDetail create(EmpMemberDetail t);

    EmpMemberDetail read(Integer id);
    
    List<EmpMemberDetail> readByEmpNumber(Integer empNumber);

    EmpMemberDetail update(EmpMemberDetail t);

    void delete(Integer id);

    List<EmpMemberDetail> findAll();

}
