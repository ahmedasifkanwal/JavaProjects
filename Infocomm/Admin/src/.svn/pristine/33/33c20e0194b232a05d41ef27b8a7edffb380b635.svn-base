/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.cms.presentation.entity.PeAuditLog;
import com.info.cms.report.graph.UIDataTable;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.controller.AuditLogJpaController;
import com.info.wifi.cms.util.SqlResult;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author naeem
 */
public class AuditLogFacade {

    /**
     *
     * @param peAuditLog
     * @return
     * @throws ParseException
     */
    public static final Logger logger = Logger.getLogger(AuditLogFacade.class.getName());


    public SqlResult getAuditLog(PeAuditLog peAuditLog) {
        ReportConfiguration reportCon = ReferenceData.getReportConfiguration("AUDIT_LOG_SQL");
        SqlResult result = new AuditLogJpaController().getAllAuditLog(reportCon.getSelectSql(),
                peAuditLog.getFromToDateBetween(), peAuditLog.getActionBy(), peAuditLog.getAdvAgencyId());

        result.setData(UIDataTable.getFormattedTable((List) result.getData(), reportCon.getSelectColumn(), reportCon.getColumnFormat(),reportCon.getReportRequire()));
        return result;
    }


    public SqlResult getSystemErrorLog(PeAuditLog peAuditLog) {
        ReportConfiguration reportCon = ReferenceData.getReportConfiguration("SYSTEM_ERROR_LOG_SQL");
        SqlResult result = new AuditLogJpaController().searchSysteErrorLog(reportCon.getSelectSql(), peAuditLog.getFromToDateBetween());

        result.setData(UIDataTable.getFormattedTable((List) result.getData(), reportCon.getSelectColumn(), reportCon.getColumnFormat(),reportCon.getReportRequire()));
        return result;
    }

    


}
