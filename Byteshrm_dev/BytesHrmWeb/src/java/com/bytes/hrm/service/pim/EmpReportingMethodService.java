/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpReportingMethod;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public interface EmpReportingMethodService {

    EmpReportingMethod create(EmpReportingMethod t);

    EmpReportingMethod read(Integer id);

    EmpReportingMethod update(EmpReportingMethod t);

    void delete(Integer id);

    List<EmpReportingMethod> findAll();

    long searchCount(Map<String, Object> params);

    List<EmpReportingMethod> search(Map<String, Object> params);

}
