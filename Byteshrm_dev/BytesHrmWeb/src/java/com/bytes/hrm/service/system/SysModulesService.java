package com.bytes.hrm.service.system;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.bytes.hrm.dao.entity.SysModules;
import com.bytes.hrm.dao.entity.SysUserAction;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Shahid
 */
public interface SysModulesService {

    SysModules create(SysModules t);

    SysModules find(BigDecimal id);

    SysModules update(SysModules t);

    SysModules delete(BigDecimal id);

    List<SysModules> findAll();

    List<SysModules> findAssignedModulesMapping(  Collection< SysUserAction> l);
   
    static final Logger LOG = Logger.getLogger(SysModulesService.class.getName());

}
