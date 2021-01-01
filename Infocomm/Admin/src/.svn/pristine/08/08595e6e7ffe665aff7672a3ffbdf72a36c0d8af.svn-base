/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import com.info.wifi.cms.entity.KioskTerminal;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author naeem
 */
public class PeKiosk extends PeCommon implements Serializable {

    /**
     * @return the peTerminalStatus
     */
    public PeTerminalStatus getPeTerminalStatus() {
        return peTerminalStatus;
    }

    /**
     * @param peTerminalStatus the peTerminalStatus to set
     */
    public void setPeTerminalStatus(PeTerminalStatus peTerminalStatus) {
        this.peTerminalStatus = peTerminalStatus;
    }

    private List<KioskTerminal> kioskTerminalList = new ArrayList<KioskTerminal>();
    private String fromDate;
    private String toDate;
    private String actionBy;
    private PeTerminalStatus peTerminalStatus =new PeTerminalStatus();

    /**
     * @return the kioskTerminalList
     */
    public List<KioskTerminal> getKioskTerminalList() {
        return kioskTerminalList;
    }

    /**
     * @param kioskTerminalList the kioskTerminalList to set
     */
    public void setKioskTerminalList(List<KioskTerminal> kioskTerminalList) {
        this.kioskTerminalList = kioskTerminalList;
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

    /**
     * @return the actionBy
     */
    public String getActionBy() {
        return actionBy;
    }

    /**
     * @param actionBy the actionBy to set
     */
    public void setActionBy(String actionBy) {
        this.actionBy = actionBy;
    }

}
