package com.info.cms.action;

import com.info.cms.facade.KioskFacade;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeKiosk;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class KioskAction extends MyActionSupport
        implements ModelDriven<PeKiosk>, IOperations {

    /**
     * @return the peKiosk
     */
    public PeKiosk getPeKiosk() {
        return peKiosk;
    }

    /**
     * @param peKiosk the peKiosk to set
     */
    public void setPeKiosk(PeKiosk peKiosk) {
        this.peKiosk = peKiosk;
    }
    
    private PeKiosk peKiosk = new PeKiosk();
   
    @Override
    public PeKiosk getModel() {
      return peKiosk;
    
    }
    
        public KioskAction() {
        super();
        initialize();
    }

    @Override
    public void initialize() {
     peKiosk.setFromDate(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value);
        peKiosk.setToDate(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);

        peKiosk.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
        peKiosk.setReportFilterName("SYS_ERROR_FILTER");
        peKiosk.initializeReport();
}

    @Override
    public void validateSearchInput() {
            peKiosk.setFromToDateBetween("'" + DateHelper.getSearchFormated(peKiosk.getDaterange()
                .split(UIConstants.DATE_SEPRATOR)[0],
                DateHelper.DATE_TYPE.BEGIN)
                + "' and '" + DateHelper.getSearchFormated(peKiosk.getDaterange()
                        .split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "'");
    }

    @Override
    public String search() {
          
        try {
            validateSearchInput();
            new KioskFacade().getKioskTerminalDetails(peKiosk);
        
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
    
    public String getKioskTerminalStatus() {
          
        try {
           
            new KioskFacade().getKioskTerminalStatus(peKiosk);
        
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
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