/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.system;

import com.bytes.hrm.dao.entity.SysAction;
import com.bytes.hrm.dao.entity.SysModules;
import com.bytes.hrm.dao.entity.SysUserAction;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.system.SysUserActionDao;
import com.bytes.hrm.dto.system.SysUserActionDto;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author shahid
 */
public class SysUserActionServiceImpl implements SysUserActionService {

    DAOFactory factory = DAOFactory.getDAOFactory();
    SysUserActionDao dao = factory.getSysUserActionDao();

    @Override
    public SysUserAction create(SysUserActionDto t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysUserAction find(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysUserAction update(SysUserActionDto t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SysUserAction delete(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SysUserAction> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SysUserAction> findUser(SysUserActionDto t, String[] param) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Collection<SysUserAction> findUserActionByRole(String authority) {
       
        Map<String, Object> m = new HashMap<>();
        m.put("o.authority", authority);
        Collection<  SysUserAction> sysUserAction = dao.search(m);

        return sysUserAction;
    }

    @Override
    public List<SysAction> findAllAction() {
        List<SysAction> target = null;

        try {
            List<SysUserAction> source = dao.findAll();
            target = new ArrayList<SysAction>();
            for (int i = 0; i < source.size(); i++) {
                SysUserAction sysUserAction = new SysUserAction();
                sysUserAction.setId(source.get(i).getId());
                sysUserAction.setAuthority(source.get(i).getAuthority());
                sysUserAction.setStatus(source.get(i).getStatus());
                //Assign Action
                SysAction sysAction = new SysAction();
                sysAction.setActionName(source.get(i).getActionId().getActionName());
                sysAction.setActionType(source.get(i).getActionId().getActionType());
                sysAction.setAuthority(source.get(i).getActionId().getAuthority());
                sysAction.setDescription(source.get(i).getActionId().getDescription());
                sysAction.setId(source.get(i).getActionId().getId());
                //Assign Module
                SysModules sysModules = new SysModules();
                sysModules.setId(source.get(i).getModuleId().getId());
                sysModules.setCssStyle(source.get(i).getModuleId().getCssStyle());
                sysModules.setDescription(source.get(i).getModuleId().getDescription());
                sysModules.setGroupType(source.get(i).getModuleId().getGroupType());
                sysModules.setApplication(source.get(i).getModuleId().getApplication());
                sysAction.setModuleId(sysModules.getId());
                target.add(sysAction);
            }

        } catch (Exception ex) {
            Logger.getLogger(SysUserActionServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return target;
    }

}
