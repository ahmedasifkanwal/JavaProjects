/*
 * Name      Date           CR#       Remarks
 * Yaseen    01-Jan-2015              Initial
 */
package com.info.cms.presentation.entity;

import com.info.cms.facade.ReferenceData;
import com.info.cms.helper.StringHelper;
import com.info.wifi.cms.entity.Country;
import com.info.wifi.cms.entity.HotspotOwner;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.Vlan;
import com.info.wifi.cms.entity.controller.CountryJpaController;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SALEEM
 */
public class PeCommon {

    /**
     * @return the nationalityCode
     */
    public String getNationalityCode() {
        return nationalityCode;
    }

    /**
     * @param nationalityCode the nationalityCode to set
     */
    public void setNationalityCode(String nationalityCode) {
        this.nationalityCode = nationalityCode;
    }

    private String timepicker;
    private String timepicker1;
    private String daterange;
    private List<Vlan> peVlanList = new ArrayList();
    private List<HotspotOwner> peHotspotOwnerList = new ArrayList();
    private List<PeReportFilter> peReportFilterList = new ArrayList();
    private List<PeStatus> peStatusList = new ArrayList<PeStatus>();
    private String fromDate;
    private String toDate;
    private String filterCode;
    private String filterText = "";
    private String authority_id;
    private String status;
    private String searchResult = "";
    private String reportFilterName = "";
    private String reportId = "";
    private String fromToDateBetween;
    private String advAgencyId;
    private int nationalityId;
    private String nationalityIds;
    private String gender;
    //private List<City> peCityList = new ArrayList<City>();
    private List<PeGender> peGenderList = new ArrayList<PeGender>();
    private List<PeSmsFrequency> smsFrequencyList = new ArrayList<PeSmsFrequency>();
    private String city;
    private String ownerName;
    private String selectRadioOption;
    private String remarks;
    private String mobileNo;
    private int vlanId;
    private String planType;
    private String mac;
    private List<PeStatus> peActivateRadioList = new ArrayList<PeStatus>();
    private List<ReportConfiguration> peReportList = new ArrayList<ReportConfiguration>();
    private boolean dirtyFlag = false;

    private List<PeDurationType> peDurationTypeList = new ArrayList<PeDurationType>();
    private List<PeDurationType> peDurationFilterList = new ArrayList<PeDurationType>();
    private List<Country> countryList = null;
    private String nationalityCode;

    public void Pecommon(String module, String status, String ADV_AGENCY_ID) {
        peStatusList = ReferenceData.getStatusList();
        peVlanList = ReferenceData.getVlanList(ADV_AGENCY_ID);
        peHotspotOwnerList = (ReferenceData.getHotspotOwnersList(ADV_AGENCY_ID));
        peDurationTypeList = (ReferenceData.getDurationType());
        peDurationFilterList = (ReferenceData.getDurationFilter());
        //Begin-OMAD01
        countryList = ReferenceData.getCountry();
        //End-OMAD01
        peGenderList = ReferenceData.getGenderList();
    }

    public void initializeReport() {

        if (!StringHelper.isNullOrEmpty(reportFilterName)) {
            ReportConfiguration reportConfiguration = ReferenceData.getReportConfiguration(reportFilterName);
            if (reportConfiguration != null && !StringHelper.isNullOrEmpty(reportConfiguration.getFilter())) {
                String[] filter = ReferenceData.getReportConfiguration(reportFilterName).getFilter().split(",");
                for (int j = 0; j < filter.length; j++) {
                    PeReportFilter obj = new PeReportFilter();
                    String[] columns = filter[j].trim().split("as");
                    obj.setColumnName(columns[0].trim());
                    obj.setDisplayName(columns[1].trim());
                    getPeReportFilterList().add(obj);
                }
            }
        }

    }

    /**
     * @return the peVlanList
     */
    public List<Vlan> getPeVlanList() {
        return peVlanList;
    }

    /**
     * @param peVlanList the peVlanList to set
     */
    public void setPeVlanList(List<Vlan> peVlanList) {
        this.peVlanList = peVlanList;
    }

    /**
     * @return the fromDate
     */
    public String getFromDate() {
        return fromDate;
    }

    /**
     * @param fromDate the fromDate to set
     */
    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    /**
     * @return the toDate
     */
    public String getToDate() {
        return toDate;
    }

    /**
     * @param toDate the toDate to set
     */
    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    /**
     * @return the filterCode
     */
    public String getFilterCode() {
        return filterCode;
    }

    /**
     * @param filterCode the filterCode to set
     */
    public void setFilterCode(String filterCode) {
        this.filterCode = filterCode;
    }

    /**
     * @return the filterText
     */
    public String getFilterText() {
        return filterText;
    }

    /**
     * @param filterText the filterText to set
     */
    public void setFilterText(String filterText) {
        this.filterText = filterText;
    }

    /**
     * @return the searchResult
     */
    public String getSearchResult() {
        return searchResult;
    }

    /**
     * @param searchResult the searchResult to set
     */
    public void setSearchResult(String searchResult) {

        this.searchResult = searchResult;
    }

    /**
     * @return the reportFilterName
     */
    public String getReportFilterName() {
        return reportFilterName;
    }

    /**
     * @param reportFilterName the reportFilterName to set
     */
    public void setReportFilterName(String reportFilterName) {
        this.reportFilterName = reportFilterName;
    }

    /**
     * @return the peReportFilterList
     */
    public List<PeReportFilter> getPeReportFilterList() {
        return peReportFilterList;
    }

    /**
     * @param peReportFilterList the peReportFilterList to set
     */
    public void setPeReportFilterList(List<PeReportFilter> peReportFilterList) {
        this.peReportFilterList = peReportFilterList;
    }

    /**
     * @return the fromToDateBetween
     */
    public String getFromToDateBetween() {
        return fromToDateBetween;
    }

    /**
     * @param fromToDateBetween the fromToDateBetween to set
     */
    public void setFromToDateBetween(String fromToDateBetween) {
        this.fromToDateBetween = fromToDateBetween;
    }

    /**
     * @return the peStatusList
     */
    public List<PeStatus> getPeStatusList() {
        return peStatusList;
    }

    /**
     * @param peStatusList the peStatusList to set
     */
    public void setPeStatusList(List<PeStatus> peStatusList) {
        this.peStatusList = peStatusList;
    }

    /**
     * @return the daterange
     */
    public String getDaterange() {
        return daterange;
    }

    /**
     * @param daterange the daterange to set
     */
    public void setDaterange(String daterange) {
        this.daterange = daterange;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the peCityList
     */
    // public List<City> getPeCityList() {
    //   return peCityList;
    //  }
    /**
     * @param peCityList the peCityList to set
     */
    /// public void setPeCityList(List<City> peCityList) {
    // this.peCityList = peCityList;
    // }
    /**
     * @return the peGenderList
     */
    public List<PeGender> getPeGenderList() {
        return peGenderList;
    }

    /**
     * @param peGenderList the peGenderList to set
     */
    public void setPeGenderList(List<PeGender> peGenderList) {
        this.peGenderList = peGenderList;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the peActivateRadioList
     */
    public List<PeStatus> getPeActivateRadioList() {
        return peActivateRadioList;
    }

    /**
     * @param peActivateRadioList the peActivateRadioList to set
     */
    public void setPeActivateRadioList(List<PeStatus> peActivateRadioList) {
        this.peActivateRadioList = peActivateRadioList;
    }

    /**
     * @return the selectRadioOption
     */
    public String getSelectRadioOption() {
        return selectRadioOption;
    }

    /**
     * @param selectRadioOption the selectRadioOption to set
     */
    public void setSelectRadioOption(String selectRadioOption) {
        this.selectRadioOption = selectRadioOption;
    }

    /**
     * @return the authority_id
     */
    public String getAuthority_id() {
        return authority_id;
    }

    /**
     * @param authority_id the authority_id to set
     */
    public void setAuthority_id(String authority_id) {
        this.authority_id = authority_id;
    }

    /**
     * @return the remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks the remarks to set
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    /**
     * @param peBandWidthValueList the peBandWidthValueList to set
     */
    /**
     * @return the mobileNo
     */
    public String getMobileNo() {
        return mobileNo;
    }

    /**
     * @param mobileNo the mobileNo to set
     */
    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    /**
     * @return the planType
     */
    public String getPlanType() {
        return planType;
    }

    /**
     * @param planType the planType to set
     */
    public void setPlanType(String planType) {
        this.planType = planType;
    }

    /**
     * @return the peReportList
     */
    public List<ReportConfiguration> getPeReportList() {
        return peReportList;
    }

    /**
     * @param peReportList the peReportList to set
     */
    public void setPeReportList(List<ReportConfiguration> peReportList) {
        this.peReportList = peReportList;
    }

    /**
     * @return the advAgencyId
     */
    public String getAdvAgencyId() {
        return advAgencyId;
    }

    /**
     * @param advAgencyId the advAgencyId to set
     */
    public void setAdvAgencyId(String advAgencyId) {
        this.advAgencyId = advAgencyId;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the reportId
     */
    public String getReportId() {
        return reportId;
    }

    /**
     * @param reportId the reportId to set
     */
    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    /**
     * @return the vlanId
     */
    public int getVlanId() {
        return vlanId;
    }

    /**
     * @param vlanId the vlanId to set
     */
    public void setVlanId(int vlanId) {
        this.vlanId = vlanId;
    }

    /**
     * @return the smsFrequencyList
     */
    public List<PeSmsFrequency> getSmsFrequencyList() {
        return smsFrequencyList;
    }

    /**
     * @param smsFrequencyList the smsFrequencyList to set
     */
    public void setSmsFrequencyList(List<PeSmsFrequency> smsFrequencyList) {
        this.smsFrequencyList = smsFrequencyList;
    }

    /**
     * @return the nationalityIds
     */
    public String getNationalityIds() {
        return nationalityIds;
    }

    /**
     * @param nationalityIds the nationalityIds to set
     */
    public void setNationalityIds(String nationalityIds) {
        this.nationalityIds = nationalityIds;
    }

    /**
     * @return the dirtyFlag
     */
    public boolean isDirtyFlag() {
        return dirtyFlag;
    }

    /**
     * @param dirtyFlag the dirtyFlag to set
     */
    public void setDirtyFlag(boolean dirtyFlag) {
        this.dirtyFlag = dirtyFlag;
    }

    /**
     * @return the timepicker
     */
    public String getTimepicker() {
        return timepicker;
    }

    /**
     * @param timepicker the timepicker to set
     */
    public void setTimepicker(String timepicker) {
        this.timepicker = timepicker;
    }

    /**
     * @return the timepicker1
     */
    public String getTimepicker1() {
        return timepicker1;
    }

    /**
     * @param timepicker1 the timepicker1 to set
     */
    public void setTimepicker1(String timepicker1) {
        this.timepicker1 = timepicker1;
    }

    /**
     * @return the nationalityId
     */
    public int getNationalityId() {
        return nationalityId;
    }

    /**
     * @param nationalityId the nationalityId to set
     */
    public void setNationalityId(int nationalityId) {
        this.nationalityId = nationalityId;
    }

    /**
     * @return the mac
     */
    public String getMac() {
        return mac;
    }

    /**
     * @param mac the mac to set
     */
    public void setMac(String mac) {
        this.mac = mac;
    }

    /**
     * @return the ownerName
     */
    public String getOwnerName() {
        return ownerName;
    }

    /**
     * @param ownerName the ownerName to set
     */
    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    /**
     * @return the peHotspotOwnerList
     */
    public List<HotspotOwner> getPeHotspotOwnerList() {
        return peHotspotOwnerList;
    }

    /**
     * @param peHotspotOwnerList the peHotspotOwnerList to set
     */
    public void setPeHotspotOwnerList(List<HotspotOwner> peHotspotOwnerList) {
        this.peHotspotOwnerList = peHotspotOwnerList;
    }

    /**
     * @return the peDurationTypeList
     */
    public List<PeDurationType> getPeDurationTypeList() {
        return peDurationTypeList;
    }

    /**
     * @param peDurationTypeList the peDurationTypeList to set
     */
    public void setPeDurationTypeList(List<PeDurationType> peDurationTypeList) {
        this.peDurationTypeList = peDurationTypeList;
    }

    /**
     * @return the peDurationFilterList
     */
    public List<PeDurationType> getPeDurationFilterList() {
        return peDurationFilterList;
    }

    /**
     * @param peDurationFilterList the peDurationFilterList to set
     */
    public void setPeDurationFilterList(List<PeDurationType> peDurationFilterList) {
        this.peDurationFilterList = peDurationFilterList;
    }

    /**
     * @return the countryList
     */
    public List<Country> getCountryList() {
        return countryList;
    }

    /**
     * @param countryList the countryList to set
     */
    public void setCountryList(List<Country> countryList) {
        this.countryList = countryList;
    }

}
