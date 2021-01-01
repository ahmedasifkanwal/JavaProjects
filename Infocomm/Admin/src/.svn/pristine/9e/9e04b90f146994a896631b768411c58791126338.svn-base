package com.info.cms.action;

import com.info.cms.facade.BackupHistoryFacade;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeBackupHistory;
import com.opensymphony.xwork2.ModelDriven;

public final class BackupHistoryAction extends MyActionSupport
        implements ModelDriven<PeBackupHistory>, IOperations {

    /**
     * @return the peBackupHistory
     */
    public PeBackupHistory getPeBackupHistory() {
        return peBackupHistory;
    }

    /**
     * @param peBackupHistory the peBackupHistory to set
     */
    public void setPeBackupHistory(PeBackupHistory peBackupHistory) {
        this.peBackupHistory = peBackupHistory;
    }

    public BackupHistoryAction() {
        super();
        initialize();
    }
    private PeBackupHistory peBackupHistory = new PeBackupHistory();

    @Override
    public PeBackupHistory getModel() {
        return peBackupHistory;

    }

    @Override
    public void initialize() {
        peBackupHistory.setFromDate(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value);
        peBackupHistory.setToDate(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);

        peBackupHistory.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
        peBackupHistory.setReportFilterName("SYS_ERROR_FILTER");
        peBackupHistory.initializeReport();
    }

    @Override
    public void validateSearchInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String search() {
        peBackupHistory.setBackupHistoryList(new BackupHistoryFacade().search());
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String save() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validateEditInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String edit() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getSelected() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
