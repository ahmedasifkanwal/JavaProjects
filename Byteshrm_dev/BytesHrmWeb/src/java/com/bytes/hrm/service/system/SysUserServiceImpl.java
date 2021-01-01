/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.system;

import com.bytes.hrm.action.system.LoginAction;
import com.bytes.hrm.dao.entity.SysAction;
import com.bytes.hrm.dao.entity.SysUserAction;
import com.bytes.hrm.dao.entity.SysUser;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.system.SysUserDao;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shahid
 */
public class SysUserServiceImpl implements SysUserService {

    DAOFactory factory = DAOFactory.getDAOFactory();

    SysUserDao dao = factory.getSysUserDao();

    @Override
    public SysUser create(SysUser t) {
        return dao.update(t);
    }

    @Override
    public SysUser find(BigDecimal id) {
        return dao.read(id);
    }
    static final Logger logger = Logger.getLogger(LoginAction.class.getName());

    @Override
    public SysUser update(SysUser t) {
        //To change body of generated methods, choose Tools | Templates.
        SysUser sysUsers = new SysUser();

        try {

            logger.log(Level.INFO, "Updating Time ------------Start:{0}", sysUsers);
            sysUsers.setCreatedBy("Admin");
            sysUsers.setIsEncripted("N");

            sysUsers = dao.update(sysUsers);

            logger.log(Level.INFO, "Updating Time ------------End:{0}", sysUsers);
        } catch (Exception ex) {
            Logger.getLogger(SysAuthoritiesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    @Override
    public SysUser delete(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SysUser> findAll() {
        return dao.findAll();
    }

    @Override
    public List<SysUser> findUser(SysUser t, String[] param) {
        return dao.findUser(t, param);
    }

    @Override
    public SysUser findSysUsers(String userName) {

        try {
            return dao.findSysUsers(userName);
        } catch (Exception ex) {
            Logger.getLogger(SysAuthoritiesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<SysAction> findAssignedModuleActions(Collection<SysUserAction> sysUserActionVoList) {

        try {

            return dao.findAssignedModuleActions(sysUserActionVoList);

        } catch (Exception ex) {
            Logger.getLogger(SysUser.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

}
