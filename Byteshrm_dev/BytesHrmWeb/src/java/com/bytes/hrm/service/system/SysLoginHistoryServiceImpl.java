/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.system;

import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.system.SysLoginHistoryDao;
import com.bytes.hrm.dao.entity.SysLoginHistory;

import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Level;

/**
 *
 * @author shahid
 */
public class SysLoginHistoryServiceImpl implements SysLoginHistoryService {

    DAOFactory factory = DAOFactory.getDAOFactory();
    SysLoginHistoryDao dao = factory.getSysLoginHistoryDao();

    @Override
    public com.bytes.hrm.dao.entity.SysLoginHistory create(com.bytes.hrm.dao.entity.SysLoginHistory t) {

        return dao.create(t);

    }

    @Override
    public com.bytes.hrm.dao.entity.SysLoginHistory find(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public com.bytes.hrm.dao.entity.SysLoginHistory update(com.bytes.hrm.dao.entity.SysLoginHistory t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public com.bytes.hrm.dao.entity.SysLoginHistory delete(BigDecimal id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<com.bytes.hrm.dao.entity.SysLoginHistory> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<com.bytes.hrm.dao.entity.SysLoginHistory> findHistory(com.bytes.hrm.dao.entity.SysLoginHistory t, String[] param) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
