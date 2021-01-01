/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;



import com.bytes.hrm.dao.entity.EmpLanguage;
import com.bytes.hrm.dao.entity.EmpLanguagePK;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpLanguageService {

    EmpLanguage create(EmpLanguage t);

    EmpLanguage read(EmpLanguagePK id);

    List<EmpLanguage> readByEmpNumber(Integer empNumber);

    EmpLanguage update(EmpLanguage t);

    void delete(Integer id);

    List<EmpLanguage> findAll();

}
