/*
 * Name      Date           CR#       Remarks
 * Yaseen    01-Jan-2015              Initial
 * 
 */
package com.info.cms.presentation.entity;

import com.info.wifi.cms.entity.Complaint;

 
public class PeComplaint extends PeCommon {
   
    private Complaint complaint = new Complaint();
    public PeComplaint(String module, String ADV_AGENCY_ID) {
        super.Pecommon(null, null, ADV_AGENCY_ID);
    }

    /**
     * @return the complaint
     */
    public Complaint getComplaint() {
        return complaint;
    }

    /**
     * @param complaint the complaint to set
     */
    public void setComplaint(Complaint complaint) {
        this.complaint = complaint;
    }

 
}
