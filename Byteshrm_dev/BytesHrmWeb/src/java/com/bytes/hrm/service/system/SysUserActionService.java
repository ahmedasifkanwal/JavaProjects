package com.bytes.hrm.service.system;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.bytes.hrm.dao.entity.SysAction;
import com.bytes.hrm.dao.entity.SysUserAction;
import com.bytes.hrm.dto.system.SysUserActionDto;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Shahid
 */
public interface SysUserActionService {

    SysUserAction create(SysUserActionDto t);

    SysUserAction find(BigDecimal id);

    SysUserAction update(SysUserActionDto t);

    SysUserAction delete(BigDecimal id);

    List<SysUserAction> findAll();
    List<SysAction> findAllAction(); 
    List<SysUserAction> findUser(SysUserActionDto t, String[] param);
    Collection< SysUserAction>  findUserActionByRole(String authority);
    static final Logger LOG = Logger.getLogger(SysUserAction.class.getName());

}
