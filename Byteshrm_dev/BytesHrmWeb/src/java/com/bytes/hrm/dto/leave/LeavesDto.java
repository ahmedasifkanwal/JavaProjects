/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.leave;

import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dao.entity.Leaves;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeavesDto implements Serializable {

    /**
     * @return the leavesList
     */
    public List<Leaves> getLeavesList() {
        return leavesList;
    }

    /**
     * @param leavesList the leavesList to set
     */
    public void setLeavesList(List<Leaves> leavesList) {
        this.leavesList = leavesList;
    }

    /**
     * @return the leaves
     */
    public Leaves getLeaves() {
        return leaves;
    }

    /**
     * @param leaves the leaves to set
     */
    public void setLeaves(Leaves leaves) {
        this.leaves = leaves;
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

 

  
    private Leaves leaves = new Leaves();
    private List<Leaves> leavesList = new ArrayList<>();
     private Employee employee = new Employee();

}
