/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.system;

import com.bytes.hrm.dao.entity.SysAuthorities;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.system.SysAuthoritiesDao;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author Shahid
 */
public class SysAuthoritiesServiceImpl implements SysAuthoritiesService {
// create the required DAO Factory

    DAOFactory factory = DAOFactory.getDAOFactory();
    SysAuthoritiesDao dao = factory.getSysAuthoritiesDao();

    @Override    
     public List<SysAuthorities> findAllRole() {
        List<SysAuthorities> listOrigin = dao.findAll();
      
        return listOrigin;
    }

    @Override
    public SysAuthorities find(BigDecimal id) {
             
         return  dao.read(id);
       
    }

    @Override
    public SysAuthorities delete(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysAuthorities create(SysAuthorities b) {

        try {

            SysAuthorities authorities = new SysAuthorities();
            authorities.setAuthority(b.getAuthority());
            authorities.setCreatedBy(b.getCreatedBy());
            authorities.setCreatedDate(new Date());
            authorities.setDescription(b.getDescription());
            authorities.setParentAuthority(b.getParentAuthority());
            authorities.setStatus("A");
            authorities = dao.create(authorities);
            BeanUtils.copyProperties(authorities, b);
        } catch (Exception ex) {
            LOG.log(Level.OFF, ex.getMessage());

        }
        return b;
    }

    @Override
    public SysAuthorities update(SysAuthorities b) {
        SysAuthorities authorities = dao.read(b.getId());
        authorities.setDescription(b.getDescription());
        authorities.setParentAuthority(b.getParentAuthority());
        authorities = dao.update(authorities);
        try {
            BeanUtils.copyProperties(b, authorities);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SysAuthoritiesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(SysAuthoritiesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;

    }

    @Override
    public SysAuthorities findAuthority(String authority) {
       return  dao.findAuthority(authority);
               

    }

}
