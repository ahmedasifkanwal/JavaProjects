/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpReportto;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpReporttoService {

    EmpReportto create(EmpReportto t);

    EmpReportto read(Integer id);

    EmpReportto update(EmpReportto t);

    void delete(Integer id);

    List<EmpReportto> findAll();

}
