/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.system;

import com.bytes.hrm.dao.entity.SysAuthorities;
import com.bytes.hrm.dao.entity.SysUser;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class SysUserDto {

    /**
     * @return the employeeId
     */
    public String getEmployeeId() {
        return employeeId;
    }

    /**
     * @param employeeId the employeeId to set
     */
    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * @return the sysUser
     */
    public SysUser getSysUser() {
        return sysUser;
    }

    /**
     * @param sysUser the sysUser to set
     */
    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    /**
     * @return the sysUserList
     */
    public List<SysUser> getSysUserList() {
        return sysUserList;
    }

    /**
     * @param sysUserList the sysUserList to set
     */
    public void setSysUserList(List<SysUser> sysUserList) {
        this.sysUserList = sysUserList;
    }

   
    private String employeeId=null;
    private SysUser  sysUser=new SysUser();
    private List<SysUser> sysUserList=new ArrayList<>();
    
}
