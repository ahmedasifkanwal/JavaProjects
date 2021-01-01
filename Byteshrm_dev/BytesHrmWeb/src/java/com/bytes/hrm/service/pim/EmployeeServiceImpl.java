/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpContractExtend;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.pim.EmployeeDao;
import com.bytes.hrm.dto.pim.EmployeeDto;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public class EmployeeServiceImpl implements EmployeeService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmployeeDao dao = factory.getEmployeeDao();

    @Override
    public Employee create(Employee t) {
        return dao.create(t);

    }

    @Override
    public Employee read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Employee update(Employee t) {
        return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<Employee> findAll() {
        return dao.findAll();
    }

    @Override
    public Employee updateContactDetails(Employee t) {

        Employee employee = read(t.getEmpNumber());
        employee.setEmpStreet1(t.getEmpStreet1());
        employee.setEmpStreet2(t.getEmpStreet2());
        employee.setCityCode(t.getCityCode());
        employee.setProvinCode(t.getProvinCode());
        employee.setCounCode(t.getCounCode());
        employee.setEmpHmTelephone(t.getEmpHmTelephone());
        employee.setEmpMobile(t.getEmpMobile());
        employee.setEmpWorkTelephone(t.getEmpWorkTelephone());
        employee.setEmpWorkEmail(t.getEmpWorkEmail());
        employee.setEmpOthEmail(t.getEmpOthEmail());
        return update(employee);

    }

    @Override
    public Employee updateJobDetails(Employee t) {
        Employee employee = read(t.getEmpNumber());
        EmpContractExtend empContractExtend = null;
        if (t.getJobTitleCode() == null || t.getJobTitleCode().getId() == null || t.getJobTitleCode().getId() <= 0) {
        } else {
            employee.setJobTitleCode(t.getJobTitleCode());
        }
        if (t.getJoinedDate() != null) {
            employee.setJoinedDate(t.getJoinedDate());
        }
        if (t.getEeoCatCode() != null && t.getEeoCatCode().getId() != null && t.getEeoCatCode().getId() > 0) {
            employee.setEeoCatCode(t.getEeoCatCode());

        }
        if (t.getWorkStation() != null && t.getWorkStation().getId() != null && t.getWorkStation().getId() > 0) {
            employee.setWorkStation(t.getWorkStation());

        }

        if (t.getEmpStatus() != null && t.getEmpStatus().getId() != null && t.getEmpStatus().getId() > 0) {
            employee.setEmpStatus(employee.getEmpStatus());
        }

        //Location location = new Location();
        //  if (t.getLocationCollection() != null && t.getLocationCollection().size() > 0) {
        /// employee.setLocationCollection(t.getLocationCollection());
        // }
        if (t.getEmpContractExtendCollection() != null && t.getEmpContractExtendCollection().size() > 0) {
            empContractExtend = t.getEmpContractExtendCollection().iterator().next();
        }
        tryUpdate(employee, empContractExtend, null);
        return t;

    }

    @Override
    public List tryUpdate(Object t1, Object t2, Object t3) {

        return dao.tryUpdate(t1, t2, t3);

    }

    @Override
    public EmployeeDto populateEmployee(EmployeeDto employeeDto) {

        employeeDto.setEmployee(read(employeeDto.getEmployee().getEmpNumber()));

        //Fill Contract Object to display on UI logic needs to review
        if (!employeeDto.getEmployee().getEmpContractExtendCollection().isEmpty()) {
            employeeDto.setEmpContractExtend(employeeDto.getEmployee()
                    .getEmpContractExtendCollection().iterator().next());
        }

        return employeeDto;
    }

    @Override
    public Collection<Employee> search(Map<String, Object> m) {
        return dao.search(m);
    }

    @Override
    public Employee getEmployee(String empId) {

        EmployeeService employeeService = new EmployeeServiceImpl();
        Map<String, Object> m = new HashMap<>();
        m.put("o.employeeId", empId);
        Collection<  Employee> e = employeeService.search(m);
        if (e.size() == 1) {
            return (Employee) e.toArray()[0];
        }
        return null;
    }

}
