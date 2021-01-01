/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

import com.info.cms.presentation.entity.PeReportInputValue;

/**
 *
 * @author mohd rehan
 */
public class ReportRequest {

    public PeReportInputValue getAdminReport(PeReportInputValue peReportInput) {


     if (peReportInput.getReportId().equalsIgnoreCase("SEARCH_SYS_USER_SQL")) {
            //new SysUsersFacade().printSysUser(peReportInput);
        } else if (peReportInput.getReportId().equalsIgnoreCase("SEARCH_BILL_PAYMENT_METHOD_SQL")) {
           // new BillPaymentMethodFacade().printSessionLog(peReportInput);
        }  else if (peReportInput.getReportId().equalsIgnoreCase("SEARCH_BILL_PACKAGE_SQL")) {
     
        } else if (peReportInput.getReportId().equalsIgnoreCase("SEARCH_BILL_STATUS_INVOICE_SQL")) {
            //new BillStatusInvoiceFacade().printBillInvoice(peReportInput);
        }




        return peReportInput;
    }
}
