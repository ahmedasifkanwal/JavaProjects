package com.bytes.hrm.service.system;

import com.bytes.hrm.dao.entity.SysModules;
import com.bytes.hrm.dao.entity.SysUserAction;
import com.bytes.hrm.dao.entity.SysUser;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.system.SysModulesDao;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.beanutils.BeanUtils;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Shahid
 */
public class SysModulesServiceImpl implements SysModulesService {

    DAOFactory factory = DAOFactory.getDAOFactory();
    SysModulesDao dao = factory.getSysModulesDao();

    @Override
    public SysModules create(SysModules t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysModules find(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysModules update(SysModules t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysModules delete(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

     @Override
    public List<SysModules> findAll() {
        List<SysModules> listOrigin = dao.findAll();
        List<SysModules> listDestination = new ArrayList<SysModules>();

        for (SysModules source : listOrigin) {
            SysModules target = new SysModules();
            try {
                BeanUtils.copyProperties(target, source);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(SysAuthoritiesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(SysAuthoritiesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            listDestination.add(target);
        }
        return listDestination;
    }

    @Override
    public List<SysModules> findAssignedModulesMapping(Collection<SysUserAction> l) {

      
        try {
         
            List<SysModules> sysModules = dao.findAssignedModulesMapping(l);
            return sysModules;
          
        } catch (Exception ex) {
            Logger.getLogger(SysUserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

//To change body of generated methods, choose Tools | Templates.
    }

   
   

}
