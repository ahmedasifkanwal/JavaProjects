/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpBasicsalary;
import com.bytes.hrm.dao.entity.EmpContractExtend;
import com.bytes.hrm.dao.entity.EmpDependents;
import com.bytes.hrm.dao.entity.EmpEmergencyContacts;
import com.bytes.hrm.dao.entity.EmpPassport;
import com.bytes.hrm.dao.entity.EmpReportto;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dao.entity.SysUser;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmployeeDto implements Serializable {

    /**
     * @return the empBasicsalaryList
     */
    public List<EmpBasicsalary> getEmpBasicsalaryList() {
        return empBasicsalaryList;
    }

    /**
     * @param empBasicsalaryList the empBasicsalaryList to set
     */
    public void setEmpBasicsalaryList(List<EmpBasicsalary> empBasicsalaryList) {
        this.empBasicsalaryList = empBasicsalaryList;
    }


    /**
     * @return the empBasicsalary
     */
    public EmpBasicsalary getEmpBasicsalary() {
        return empBasicsalary;
    }

    /**
     * @param empBasicsalary the empBasicsalary to set
     */
    public void setEmpBasicsalary(EmpBasicsalary empBasicsalary) {
        this.empBasicsalary = empBasicsalary;
    }

    /**
     * @return the empContractExtend
     */
    public EmpContractExtend getEmpContractExtend() {
        return empContractExtend;
    }

    /**
     * @param empContractExtend the empContractExtend to set
     */
    public void setEmpContractExtend(EmpContractExtend empContractExtend) {
        this.empContractExtend = empContractExtend;
    }

    /**
     * @return the empReportto
     */
    public EmpReportto getEmpReportto() {
        return empReportto;
    }

    /**
     * @param empReportto the empReportto to set
     */
    public void setEmpReportto(EmpReportto empReportto) {
        this.empReportto = empReportto;
    }

    /**
     * @return the empPassport
     */
    public EmpPassport getEmpPassport() {
        return empPassport;
    }

    /**
     * @param empPassport the empPassport to set
     */
    public void setEmpPassport(EmpPassport empPassport) {
        this.empPassport = empPassport;
    }

    /**
     * @return the empEmergencyContacts
     */
    public EmpEmergencyContacts getEmpEmergencyContacts() {
        return empEmergencyContacts;
    }

    /**
     * @param empEmergencyContacts the empEmergencyContacts to set
     */
    public void setEmpEmergencyContacts(EmpEmergencyContacts empEmergencyContacts) {
        this.empEmergencyContacts = empEmergencyContacts;
    }

    /**
     * @return the empDependents
     */
    public EmpDependents getEmpDependents() {
        return empDependents;
    }

    /**
     * @param empDependents the empDependents to set
     */
    public void setEmpDependents(EmpDependents empDependents) {
        this.empDependents = empDependents;
    }

    /**
     * @return the isLoginRequired
     */
    public String getIsLoginRequired() {
        return isLoginRequired;
    }

    /**
     * @param isLoginRequired the isLoginRequired to set
     */
    public void setIsLoginRequired(String isLoginRequired) {
        this.isLoginRequired = isLoginRequired;
    }

    /**
     * @return the sysUsers
     */
    public SysUser getSysUser() {
        return sysUsers;
    }

    /**
     * @param sysUsers the sysUsers to set
     */
    public void setSysUsers(SysUser sysUsers) {
        this.sysUsers = sysUsers;
    }

    /**
     * @return the rePassword
     */
    public String getRePassword() {
        return rePassword;
    }

    /**
     * @param rePassword the rePassword to set
     */
    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    /**
     * @return the employee
     */
    public Employee getEmployee() {
        return employee;
    }

    /**
     * @param employee the employee to set
     */
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    /**
     * @return the employeeList
     */
    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    /**
     * @param employeeList the employeeList to set
     */
    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    private EmpEmergencyContacts empEmergencyContacts = new EmpEmergencyContacts();
    private Employee employee = new Employee();
    private List<Employee> employeeList = new ArrayList<>();
    private EmpDependents empDependents = new EmpDependents();
    private EmpPassport empPassport = new EmpPassport();
    private EmpContractExtend empContractExtend = new EmpContractExtend();
    private EmpReportto empReportto = new EmpReportto();  
    private EmpBasicsalary empBasicsalary = new EmpBasicsalary();
    private List<EmpBasicsalary> empBasicsalaryList = new ArrayList<>();
    private SysUser sysUsers = new SysUser();
    private String rePassword;
    private String isLoginRequired;
}
