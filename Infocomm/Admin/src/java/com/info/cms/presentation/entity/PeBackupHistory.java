/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import com.info.wifi.cms.entity.BackupHistory;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author naeem
 */
public class PeBackupHistory extends PeCommon implements Serializable {

    private List<BackupHistory> backupHistoryList = new ArrayList<BackupHistory>();
    private String fromDate;
    private String toDate;

    /**
     * @return the backupHistoryList
     */
    public List<BackupHistory> getBackupHistoryList() {
        return backupHistoryList;
    }

    /**
     * @param backupHistoryList the backupHistoryList to set
     */
    public void setBackupHistoryList(List<BackupHistory> backupHistoryList) {
        this.backupHistoryList = backupHistoryList;
    }

    /**
     * @return the fromDate
     */
    public String getFromDate() {
        return fromDate;
    }

    /**
     * @param fromDate the fromDate to set
     */
    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    /**
     * @return the toDate
     */
    public String getToDate() {
        return toDate;
    }

    /**
     * @param toDate the toDate to set
     */
    public void setToDate(String toDate) {
        this.toDate = toDate;
    }
  
    
    
}
