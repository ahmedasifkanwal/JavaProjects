/*
 * To change this  license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.report.graph.action;

import com.info.cms.action.IOperations;
import com.info.cms.action.MyActionSupport;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeChart;
import com.opensymphony.xwork2.ModelDriven;

/**
 *
 * @author SALEEM
 */
public final class ChartAction extends MyActionSupport
        implements ModelDriven<PeChart>, IOperations {

    private PeChart peChart = new PeChart(null, "A", ADV_AGENCY_ID);

    @Override
    public PeChart getModel() {
        return getPeChart();
    }

    public ChartAction() {
        super();
        initialize();
    }

    @Override
    public void initialize() {
        peChart.setAuthority_id(getCURRENT_AUTHORITY());
        peChart.setAdvAgencyId(ADV_AGENCY_ID);

    }

    @Override
    public void validateSearchInput() {

    }

    @Override
    public String search() {
        try {
            peChart.setAuthority_id(currentUser.getUserAuthority());
            peChart.setAdvAgencyId(ADV_AGENCY_ID);
            //  new ChartFacade().createDashboard(peChart);
            // new ProfileStaticticsFacade().getProfileStatistics(peChart);

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getLoginStatictics() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getDataUtilization() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getSmsGraphicalData() {
        try {
            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                peChart.setAuthority_id(currentUser.getUserAuthority());
                peChart.setAdvAgencyId(ADV_AGENCY_ID);

            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getGraphicalCampaignRpt() {
        try {

            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                peChart.setAuthority_id(currentUser.getUserAuthority());
                peChart.setAdvAgencyId(ADV_AGENCY_ID);

            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getOutgoingSMS() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getInternationalSMS() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getSMSByStatus() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.START_LAST_1_MONTH.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getDataUtilizationByUser() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value
                        + UIConstants.DATE_SEPRATOR + DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value);
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public String getConnectedvsLogin() {
        try {

            if (StringHelper.isNullOrEmpty(peChart.getDaterange())) {
                peChart.setDaterange(DateHelper.PREVIOUS_DATE_BY_MONTH.END_DATE.value
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

    /**
     * @return the peChart
     */
    public PeChart getPeChart() {
        return peChart;
    }

    /**
     * @param peChart the peChart to set
     */
    public void setPeChart(PeChart peChart) {
        this.peChart = peChart;
    }

    @Override
    public String getSelected() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
