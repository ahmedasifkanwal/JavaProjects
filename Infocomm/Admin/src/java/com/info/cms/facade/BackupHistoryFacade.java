/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;


import com.info.wifi.cms.entity.BackupHistory;
import com.info.wifi.cms.entity.controller.BackupHistoryJpaController;
import java.text.ParseException;
import java.util.List;


/**
 *
 * @author naeem
 */
public class BackupHistoryFacade {

    /**
     *
     * @param 
     * @return
     * @throws ParseException
     */
  
    public List<BackupHistory> search() {
        List<BackupHistory> backupList ;
        
            backupList = new BackupHistoryJpaController().findBackupHistoryEntities();
        
        return backupList;
    }
    
}
