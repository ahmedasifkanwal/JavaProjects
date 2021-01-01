/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author naeem
 */
public class PeStatictics implements Serializable {

    private int onlineCount = 0;
    private int gatewayCount = 0;
    private int vlanCount = 0;
    private int activecustomers = 0;

    /**
     * @return the onlineCount
     */
    public int getOnlineCount() {
        return onlineCount;
    }

    /**
     * @param onlineCount the onlineCount to set
     */
    public void setOnlineCount(int onlineCount) {
        this.onlineCount = onlineCount;
    }

    /**
     * @return the gatewayCount
     */
    public int getGatewayCount() {
        return gatewayCount;
    }

    /**
     * @param gatewayCount the gatewayCount to set
     */
    public void setGatewayCount(int gatewayCount) {
        this.gatewayCount = gatewayCount;
    }


    /**
     * @return the vlanCount
     */
    public int getVlanCount() {
        return vlanCount;
    }

    /**
     * @param vlanCount the vlanCount to set
     */
    public void setVlanCount(int vlanCount) {
        this.vlanCount = vlanCount;
    }

    /**
     * @return the activecustomers
     */
    public int getActivecustomers() {
        return activecustomers;
    }

    /**
     * @param activecustomers the activecustomers to set
     */
    public void setActivecustomers(int activecustomers) {
        this.activecustomers = activecustomers;
    }

}
