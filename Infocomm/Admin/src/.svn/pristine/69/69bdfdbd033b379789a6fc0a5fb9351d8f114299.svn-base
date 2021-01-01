/*
 * Name      Date           CR#       Remarks
 * Yaseen    01-Jan-2015              Initial
 * 
 */
package com.info.cms.presentation.entity;

import com.info.cms.helper.DateHelper;
import com.info.cms.helper.UIConstants;
import com.info.wifi.cms.entity.Prepaidbatch;
import com.info.wifi.cms.entity.Prepaidcard;
import com.info.wifi.cms.entity.controller.PrepaidbatchJpaController;
import com.info.wifi.rad.util.StringHelper;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PeWifiAccount extends PeCommon {
    private Prepaidcard prepaidcard = new Prepaidcard();
    private Prepaidbatch prepaidbatch = new Prepaidbatch();
    private List<Prepaidbatch> prepaidbatchList = new ArrayList<Prepaidbatch>();

    public PeWifiAccount(String module, String ADV_AGENCY_ID) {
        super.Pecommon(null, null, ADV_AGENCY_ID);
        try {
            if (!StringHelper.isNullOrEmpty(ADV_AGENCY_ID)) {
                prepaidbatchList = (new PrepaidbatchJpaController()
                        .getActivePlan(UIConstants.PLAN_TYPE.PLAN_TYPE_SINGLE_USER.value,
                                (DateHelper.ddMMyyyyFormat.parse(DateHelper.ddMMyyyyFormat.format(new Date()))),
                                ADV_AGENCY_ID));

            }
        } catch (ParseException ex) {
            Logger.getLogger(PeWifiAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * @return the prepaidcard
     */
    public Prepaidcard getPrepaidcard() {
        return prepaidcard;
    }

    /**
     * @param prepaidcard the prepaidcard to set
     */
    public void setPrepaidcard(Prepaidcard prepaidcard) {
        this.prepaidcard = prepaidcard;
    }

    /**
     * @return the prepaidbatch
     */
    public Prepaidbatch getPrepaidbatch() {
        return prepaidbatch;
    }

    /**
     * @param prepaidbatch the prepaidbatch to set
     */
    public void setPrepaidbatch(Prepaidbatch prepaidbatch) {
        this.prepaidbatch = prepaidbatch;
    }

    /**
     * @return the prepaidbatchList
     */
    public List<Prepaidbatch> getPrepaidbatchList() {
        return prepaidbatchList;
    }

    /**
     * @param prepaidbatchList the prepaidbatchList to set
     */
    public void setPrepaidbatchList(List<Prepaidbatch> prepaidbatchList) {
        this.prepaidbatchList = prepaidbatchList;
    }

}
