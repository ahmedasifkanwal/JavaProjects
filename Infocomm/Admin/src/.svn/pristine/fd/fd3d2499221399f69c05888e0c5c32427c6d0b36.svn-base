package com.info.cms.action;

import com.info.cms.helper.StringHelper;
import com.info.cms.presentation.entity.PeBusinessOwner;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

/**
 *
 * @author Yaseen
 */
public class BusinessOwnerAction extends MyActionSupport
        implements ModelDriven<PeBusinessOwner>, IOperations {

    private PeBusinessOwner peBusinessOwner = new PeBusinessOwner(null, ADV_AGENCY_ID);

    @Override
    public PeBusinessOwner getModel() {
        return getPeBusinessOwner();
    }

    @Override
    public void initialize() {
        peBusinessOwner.setReportFilterName("SEARCH_VLAN_FILTER");
        peBusinessOwner.initializeReport();
    }

    @Override
    public void validateSearchInput() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String search() {
        try {
            ;
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
     * @return the peBusinessOwner
     */
    public PeBusinessOwner getPeBusinessOwner() {
        return peBusinessOwner;
    }

    /**
     * @param peBusinessOwner the peBusinessOwner to set
     */
    public void setPeBusinessOwner(PeBusinessOwner peBusinessOwner) {
        this.peBusinessOwner = peBusinessOwner;
    }

}
