/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.system;

import com.bytes.hrm.dao.entity.SysAuthorities;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class SysAuthoritiesDto {

    /**
     * @return the sysAuthoritiesVo
     */
    public SysAuthorities getSysAuthoritiesVo() {
        return sysAuthoritiesVo;
    }

    /**
     * @param sysAuthoritiesVo the sysAuthoritiesVo to set
     */
    public void setSysAuthoritiesVo(SysAuthorities sysAuthoritiesVo) {
        this.sysAuthoritiesVo = sysAuthoritiesVo;
    }

    /**
     * @return the sysAuthoritiesList
     */
    public List<SysAuthorities> getSysAuthoritiesList() {
        return sysAuthoritiesList;
    }

    /**
     * @param sysAuthoritiesList the sysAuthoritiesList to set
     */
    public void setSysAuthoritiesList(List<SysAuthorities> sysAuthoritiesList) {
        this.sysAuthoritiesList = sysAuthoritiesList;
    }

    private SysAuthorities  sysAuthoritiesVo=new SysAuthorities();
    private List<SysAuthorities> sysAuthoritiesList=new ArrayList<>();
    
}
