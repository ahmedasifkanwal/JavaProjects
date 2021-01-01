/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.cms.presentation.entity.PeAlert;
import com.info.wifi.cms.entity.controller.GenericJpaController;
import java.text.ParseException;

/**
 *
 * @author naeem
 */
public class SystemAlertFacade {

    /**
     *
     * @param peAuditLog
     * @return
     * @throws ParseException
     */
    public PeAlert getSystemAlerts() {
        PeAlert peAlert = new PeAlert();
        PeAlert pe = new PeAlert();
       
        pe.setIconColor("color: #0066ad;");
        pe.setIconName(ReferenceData.getSetting("CURRENCY_ICON").getSystemValue());
        if (true) {
            // pe.setMessage("Invoice on " + peBillInvoice.getLastBillDate() + " is pending.");
            pe.setType("Invoice");
            pe.setTypeClass("class=\"label label-danger\"");
        }
        if (true) {
           // pe.setMessage("Invoiced on " + peBillInvoice.getLastBillDate());
            //  pe.setType("Invoice(" + peBillInvoice.getLastBillCount() + ")");
            pe.setTypeClass("class=\"label label-success\"");
        }
        peAlert.getPeAlertList().add(pe);

        //
        pe = new PeAlert();
        int logcount = new GenericJpaController().getCount("select  count(*) from  audit_log  where (action_on > (now() - interval 1 month))");
        pe.setIconColor("color: #0066ad;");
        pe.setIconName("fa fa-magic");
        pe.setMessage("Last Month Logs " + logcount);
        pe.setType("Audit");
        pe.setTypeClass("class=\"label label-success\"");

        peAlert.getPeAlertList().add(pe);

        pe = new PeAlert();
        int errocount = new GenericJpaController().getCount("select count(*)  from sys_error_log  where (created_on > (now() - interval 1 month)) ");
        pe.setIconColor("color: #E4151D;");
        pe.setIconName("fa fa-bug");
        pe.setMessage("Last Month Errors " + errocount);
        pe.setType("Errors");
        pe.setTypeClass("class=\"label label-danger\"");

        peAlert.getPeAlertList().add(pe);

        return peAlert;

    }

}
