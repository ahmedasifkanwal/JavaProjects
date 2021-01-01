/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;



import com.bytes.hrm.dao.entity.EmpLicense;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpLicenseService {

    EmpLicense create(EmpLicense t);

    EmpLicense read(Integer id);

    List<EmpLicense> readByEmpNumber(Integer empNumber);

    EmpLicense update(EmpLicense t);

    void delete(Integer id);

    List<EmpLicense> findAll();

}
