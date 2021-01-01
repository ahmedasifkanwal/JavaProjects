/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.pim.EmployeeDto;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public interface EmployeeService {

    Employee create(Employee t);

    Employee read(Integer id);

    EmployeeDto populateEmployee(EmployeeDto employeeDto);

    Employee update(Employee t);

    Employee updateContactDetails(Employee t);

    Employee updateJobDetails(Employee t);

    void delete(Integer id);

    List tryUpdate(Object t1, Object t2, Object t3);

    List<Employee> findAll();

    Collection<Employee> search(Map<String, Object> m);

    Employee getEmployee(String empId);
}
