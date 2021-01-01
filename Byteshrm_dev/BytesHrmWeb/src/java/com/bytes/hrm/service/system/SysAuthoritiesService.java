/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.system;

import com.bytes.hrm.dao.entity.SysAuthorities;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Shahid
 */
public interface SysAuthoritiesService {

    List<SysAuthorities> findAllRole();

    SysAuthorities find(BigDecimal id);

    SysAuthorities delete(BigDecimal id);

    SysAuthorities create(SysAuthorities b);

    SysAuthorities update(SysAuthorities b);

    SysAuthorities findAuthority(String authority);

    static final Logger LOG = Logger.getLogger(SysAuthoritiesService.class.getName());
}
