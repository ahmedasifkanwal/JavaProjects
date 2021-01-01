package com.info.cms.action;

import com.info.cms.facade.VlanFacade;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeVlan;
import com.info.wifi.cms.entity.AuditLog;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Yaseen
 */
public class VlanAction extends MyActionSupport
        implements ModelDriven<PeVlan>, IOperations {

    private PeVlan peVlan = new PeVlan(null, ADV_AGENCY_ID);

    @Override
    public PeVlan getModel() {
        return peVlan;
    }

    @Override
    public void initialize() {
        peVlan.setReportFilterName("SEARCH_VLAN_FILTER");
        peVlan.initializeReport();
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

        /*if (StringHelper.isNullOrEmpty(peVlan.getVlan().getDescription())) {
            addFieldError("description", "Please enter Description .");

        }
        if (peVlan.getAdvAgencyId() == 0) {
            addFieldError("advName", "Please  select Advertiser.");

        }
        if (peVlan.getVlan().getVlan() == null) {
            addFieldError("vlan", "Please enter Vlan .");
        } else if (peVlan.getVlan().getVlan().intValue() < 0) {
            addFieldError("vlan", "Please enter Vlan .");
        }
        if (StringHelper.isNullOrEmpty(peVlan.getStatus())) {
            addFieldError("status", "Please Select Status .");

        }*/
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                VlanFacade facade = new VlanFacade();
                facade.saveVlan(peVlan);
                addActionMessage(getText("I_V01"));
                AuditLog auditLog = new AuditLog();
                auditLog.setAction(UIConstants.OPERATION.ADD.value);
                auditLog.setRecordId(new BigInteger("0"));
                auditLog.setComponent(this.getClass().getSimpleName());
                List messagePerameter = new ArrayList();
                // messagePerameter.add(peVlan.getVlan().getVlan());
                messagePerameter.add(currentUser.getUsername());
                auditLog.setMessage(getText("A_V01", messagePerameter));
                // auditLog.setAdvAgencyId(new BigDecimal(ADV_AGENCY_ID));
                saveAuditLog(auditLog);
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
                VlanFacade facade = new VlanFacade();
                if (facade.editVlan(peVlan)) {
                    addActionMessage(getText("I_V01"));
                    AuditLog auditLog = new AuditLog();
                    auditLog.setAction(UIConstants.OPERATION.ADD.value);
                    //  auditLog.setRecordId(BigInteger.valueOf((peVlan.getCustomerId())));
                    auditLog.setComponent(this.getClass().getSimpleName());
                    List messagePerameter = new ArrayList();
                    //   messagePerameter.add(peVlan.getVlan().getDescription());
                    messagePerameter.add(currentUser.getUsername());
                    auditLog.setMessage(getText("A_V01", messagePerameter));
                    //   auditLog.setAdvAgencyId(new BigDecimal(ADV_AGENCY_ID));
                    saveAuditLog(auditLog);
                    return FORWARD;

                }
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
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = request.getParameter("id");
                //  peVlan.getVlan().setId(new BigDecimal(id));
                //  peVlan.setVlanId(peVlan.getVlan().getId().intValue());
                new VlanFacade().getVlanById(peVlan);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the peVlan
     */
    public PeVlan getPeVlan() {
        return peVlan;
    }

    /**
     * @param peVlan the peVlan to set
     */
    public void setPeVlan(PeVlan peVlan) {
        this.peVlan = peVlan;
    }

}
