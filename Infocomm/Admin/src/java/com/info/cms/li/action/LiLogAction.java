package com.info.cms.li.action;

import com.info.cms.action.*;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeComplaint;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

/**
 *
 * @author Yaseen
 */
public class LiLogAction extends MyActionSupport
        implements ModelDriven<PeComplaint>, IOperations {

    private PeComplaint peComplaint = new PeComplaint(null, ADV_AGENCY_ID);

    @Override
    public PeComplaint getModel() {
        return getPeComplaint();
    }

    @Override
    public void initialize() {
        // peComplaint.setReportFilterName("SEARCH_VLAN_FILTER");
        peComplaint.initializeReport();
    }

    @Override
    public void validateSearchInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String search() {

        try {
            if (StringHelper.isNullOrEmpty(peComplaint.getDaterange())) {
                peComplaint.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                return FORWARD;

            }

        } catch (Exception ex) {
            addActionError("Vlan can not be added.");

        }
        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String edit() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                return FORWARD;

            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("ownername"))) {
                String id = request.getParameter("id");

                // new VlanFacade().getVlanById(peVlan);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the peComplaint
     */
    public PeComplaint getPeComplaint() {
        return peComplaint;
    }

    /**
     * @param peComplaint the peComplaint to set
     */
    public void setPeComplaint(PeComplaint peComplaint) {
        this.peComplaint = peComplaint;
    }

}
