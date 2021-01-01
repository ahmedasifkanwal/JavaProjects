package com.bytes.hrm.service.system;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.bytes.hrm.dao.entity.SysAction;
import com.bytes.hrm.dao.entity.SysUser;
import com.bytes.hrm.dao.entity.SysUserAction;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Shahid
 */
public interface SysUserService {

    SysUser create(SysUser t);

    SysUser find(BigDecimal id);

    SysUser update(SysUser t);

    SysUser delete(BigDecimal id);

    List<SysUser> findAll();

    List<SysUser> findUser(SysUser t, String[] param);

    SysUser findSysUsers(String userName);

    List<SysAction> findAssignedModuleActions(Collection< SysUserAction> sysUserActionList);
    static final Logger LOG = Logger.getLogger(SysUser.class.getName());

}
