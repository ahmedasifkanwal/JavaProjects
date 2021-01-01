/*
 * Name      Date           CR#       Remarks
 * Yaseen    01-Jan-2015              Initial
 * 
 
package com.info.cms.facade;

import com.info.cms.action.MyActionSupport;
import com.info.cms.campaign.facade.CustomerFacade;
import com.info.cms.presentation.entity.PeAdvertiserAgency;
import com.info.cms.report.graph.UIDataTable;
import com.info.wifi.ilas.entity.AdvAgency;
import com.info.wifi.ilas.entity.ReportConfiguration;
import com.info.wifi.ilas.entity.controller.AdvAgencyJpaController;
import com.info.wifi.ilas.util.SqlResult;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdvertiserAgencyFacade extends MyActionSupport {

    public static final Logger logger = Logger.getLogger(CustomerFacade.class.getName());
    public boolean isAdvertiserAgency = false;

    public boolean saveAdvertiserAgency(PeAdvertiserAgency peAdvertiserAgency) throws Exception {
        try {
            
            AdvAgencyJpaController controller = new AdvAgencyJpaController();
            AdvAgency advAgency = peAdvertiserAgency.getAdvAgency();
            advAgency.setStatus(peAdvertiserAgency.getStatus());
            advAgency.setCreatedOn(new Date());
            controller.create(advAgency);
            isAdvertiserAgency = true;
        } catch (Exception e) {
            logger.log(Level.INFO, "saveAdvertiserAgency:", e.getMessage());
        }
        return isAdvertiserAgency;
    }

    public boolean editAdvertiserAgency(PeAdvertiserAgency peAdvertiserAgency) throws Exception {
        boolean isEditAdvertiserAgency = false;
        AdvAgency persistentAdvAgency;
        try {
            AdvAgencyJpaController controller = new AdvAgencyJpaController();
            AdvAgency advAgency = peAdvertiserAgency.getAdvAgency();
            advAgency.setId(peAdvertiserAgency.getAdvAgency().getId());
            advAgency.setStatus(peAdvertiserAgency.getStatus());
            //rest value find from table and merge in edit peAdvertiserAgency.
             persistentAdvAgency = controller.findAdvAgency(advAgency.getId());
             persistentAdvAgency.setAdvName(advAgency.getAdvName());
             persistentAdvAgency.setAdvDetails(advAgency.getAdvDetails());
             persistentAdvAgency.setContactAddress(advAgency.getContactAddress());
             persistentAdvAgency.setMailingAddress(advAgency.getMailingAddress());
             persistentAdvAgency.setPoBoxNo(advAgency.getPoBoxNo());
             persistentAdvAgency.setCity(advAgency.getCity());
             persistentAdvAgency.setContactPerson(advAgency.getContactPerson());
             persistentAdvAgency.setEmail(advAgency.getEmail());
             persistentAdvAgency.setMobileNo(advAgency.getMobileNo());
             persistentAdvAgency.setStatus(advAgency.getStatus());
             persistentAdvAgency.setModifiedOn(new Date());
             persistentAdvAgency.setModifiedBy(advAgency.getModifiedBy());
            controller.editAdvAgency(persistentAdvAgency);
            isEditAdvertiserAgency = true;
        } catch (Exception ex) {
            logger.log(Level.INFO, "editAdvertiserAgency:", ex.getMessage());
            
        }
        return isEditAdvertiserAgency;

    }

    public SqlResult getAdvertiserAgency(PeAdvertiserAgency peAdvertiserAgency) {
        SqlResult result = null;
        try {
            result = new SqlResult();
            ReportConfiguration reportCon = ReferenceData.getReportConfiguration(
                    "SEARCH_ADVERTISER_AGENCY_SQL");
            List list = new AdvAgencyJpaController().searchAdvertiserAgency(peAdvertiserAgency.getStatus(),
                    reportCon.getSelectSql(), peAdvertiserAgency.getFilterCode(),
                    peAdvertiserAgency.getFilterText());
            String data = UIDataTable.getFormattedTable(list, reportCon.getSelectColumn(),
                    reportCon.getColumnFormat(), reportCon.getReportRequire());
            result.setData(data);
        } catch (Exception ex) {
            logger.log(Level.INFO, "getAdvertiserAgency:", ex.getMessage());
        }

        return result;
    }

    public void getAdvertiserAgencyById(PeAdvertiserAgency peAdvertiserAgency) {
        try {
            AdvAgency advAgency = new AdvAgencyJpaController().findAdvAgency(
                    peAdvertiserAgency.getAdvAgency().getId());
            peAdvertiserAgency.setAdvAgency(advAgency);
            peAdvertiserAgency.setStatus(advAgency.getStatus());
        } catch (Exception ex) {
            logger.log(Level.INFO, "getAdvertiserAgencyById:", ex.getMessage());
        }

    }

}*/
