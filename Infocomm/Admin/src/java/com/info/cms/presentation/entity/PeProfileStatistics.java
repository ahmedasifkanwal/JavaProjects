/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

/**
 *
 * @author SALEEM
 */
public class PeProfileStatistics {

    public String deviceManufacturer = "0";
    public String deviceType = "0";
    public String male = "0";
    public String female = "0";
    public String profile = "0";
    public String activeCampaign = "0";
    private String activeSmsCampaign = "0";

    /**
     * @return the activeSmsCampaign
     */
    public String getActiveSmsCampaign() {
        return activeSmsCampaign;
    }

    /**
     * @param activeSmsCampaign the activeSmsCampaign to set
     */
    public void setActiveSmsCampaign(String activeSmsCampaign) {
        this.activeSmsCampaign = activeSmsCampaign;
    }

}
