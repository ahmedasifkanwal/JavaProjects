package com.info.cms.action;

import com.info.cms.facade.AuditLogFacade;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeAuditLog;
import com.info.wifi.cms.util.SqlResult;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;

public final class AuditLogAction extends MyActionSupport
        implements ModelDriven<PeAuditLog>, IOperations {

    private PeAuditLog peAuditLog = new PeAuditLog(null, ADV_AGENCY_ID);

    public AuditLogAction() {
        super();
        initialize();
    }

    @Override
    public void initialize() {
        peAuditLog.setFromDate(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value);
        peAuditLog.setToDate(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);

        peAuditLog.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
        peAuditLog.setReportFilterName("SYS_ERROR_FILTER");
        peAuditLog.initializeReport();
        //peAuditLog.setResellerId(RESELLER_ID);
    }

    public String searchSyserror() {

        validateSearchInput();
        if (isValidInput()) {
            SqlResult result = (new AuditLogFacade().getSystemErrorLog(peAuditLog));
            peAuditLog.setSearchResult(result.getData().toString());
            if (result.isStatus() == false) {
                List messagePerameter = new ArrayList();
                messagePerameter.add(result.getCount());
                addActionMessage(getText("I_SC01", messagePerameter));
            }
        }
        return SUCCESS;
    }

    @Override
    public String search() {

        try {
            validateSearchInput();
            peAuditLog.setAdvAgencyId(ADV_AGENCY_ID);
            SqlResult result = new AuditLogFacade().getAuditLog(peAuditLog);
            peAuditLog.setSearchResult(result.getData().toString());
            if (result.isStatus() == false) {
                List messagePerameter = new ArrayList();
                messagePerameter.add(result.getCount());
                addActionMessage(getText("I_SC01", messagePerameter));
            }
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public PeAuditLog getModel() {
        return peAuditLog;
    }

    @Override
    public String save() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String edit() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validateSearchInput() {
        peAuditLog.setFromToDateBetween("'" + DateHelper.getSearchFormated(peAuditLog.getDaterange()
                .split(UIConstants.DATE_SEPRATOR)[0],
                DateHelper.DATE_TYPE.BEGIN)
                + "' and '" + DateHelper.getSearchFormated(peAuditLog.getDaterange()
                        .split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "'");
    }

    @Override
    public void validateSaveInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validateEditInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * @return the peAuditLog
     */
    public PeAuditLog getPeAuditLog() {
        return peAuditLog;
    }

    /**
     * @param peAuditLog the peAuditLog to set
     */
    public void setPeAuditLog(PeAuditLog peAuditLog) {
        this.peAuditLog = peAuditLog;
    }

    @Override
    public String getSelected() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
