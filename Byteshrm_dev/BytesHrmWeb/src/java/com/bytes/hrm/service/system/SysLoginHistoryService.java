package com.bytes.hrm.service.system;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.bytes.hrm.dao.entity.SysLoginHistory;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Shahid
 */
public interface SysLoginHistoryService {

     SysLoginHistory create(SysLoginHistory t);

    SysLoginHistory find(BigDecimal id);

    SysLoginHistory update(SysLoginHistory t);

    SysLoginHistory delete(BigDecimal id);

    List<SysLoginHistory> findAll();

    List<SysLoginHistory> findHistory(SysLoginHistory t, String[] param);

    static final Logger LOG = Logger.getLogger(SysLoginHistory.class.getName());

}
