package com.info.cms.action;

import com.info.cms.facade.VlanFacade;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeWifiAccount;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

/*

 Created on : June 25, 2013, 2:16:37 PM
 Author     : Saleem Javed
 SN#                 CR#                 Modified By         Modified On           Remarks
 1                   WIFI001               Asif              07-Aug-2017           Serach KIOSK User Action                
 2                   WIFI002               Asif              08-Aug-2017           Serach KIOSK Statistic Action                

 */
public class WifiAccountAction extends MyActionSupport
        implements ModelDriven<PeWifiAccount>, IOperations {
    private PeWifiAccount peWifiAccount = new PeWifiAccount(null, ADV_AGENCY_ID);

    @Override
    public PeWifiAccount getModel() {
        return peWifiAccount;
    }

    @Override
    public void initialize() {

        peWifiAccount.initializeReport();

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
                /* facade.saveVlan(peVlan);
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
                saveAuditLog(auditLog);*/
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
                /*  if (facade.editVlan(peVlan)) {
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

                }*/
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
                // new VlanFacade().getVlanById(peVlan);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
 // CR#: WIFI001
    public String searchKioskUser() {
        try {
      
            if (StringHelper.isNullOrEmpty(peWifiAccount.getDaterange())) {
                peWifiAccount.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
                
            }
     
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }
    
    // CR#: WIFI002
    public String searchKioskStatistic() {
        try {
      
            if (StringHelper.isNullOrEmpty(peWifiAccount.getDaterange())) {
                peWifiAccount.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }
    /**
    /**
     * 
     * 
     * 
     * @return the peWifiAccount
     */
    public PeWifiAccount getPeWifiAccount() {
        return peWifiAccount;
    }

    /**
     * @param peWifiAccount the peWifiAccount to set
     */
    public void setPeWifiAccount(PeWifiAccount peWifiAccount) {
        this.peWifiAccount = peWifiAccount;
    }

}
