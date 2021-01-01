/*
 * created By        CR#          created On     Modified On                   Remarks
 * Mohd. Rehan                 23-jan-2012     05-Feb-2012                     Code Review
 * Mohd. Saleem      OMAD01                           09-Aug-2017                    Added Country
 */
package com.info.cms.facade;

import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeDisplayOrder;
import com.info.cms.presentation.entity.PeDurationType;
import com.info.cms.presentation.entity.PeGender;
import com.info.cms.presentation.entity.PeStatus;
import com.info.wifi.cms.entity.AccessType;
import com.info.wifi.cms.entity.Country;
import com.info.wifi.cms.entity.HotspotOwner;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.SysAuthorities;
import com.info.wifi.cms.entity.SysSettings;
import com.info.wifi.cms.entity.UserType;
import com.info.wifi.cms.entity.Vlan;
import com.info.wifi.cms.entity.controller.AccessTypeJpaController;
import com.info.wifi.cms.entity.controller.CountryJpaController;
import com.info.wifi.cms.entity.controller.GenericJpaController;
import com.info.wifi.cms.entity.controller.HotspotOwnerJpaController;
import com.info.wifi.cms.entity.controller.ReportConfigurationJpaController;
import com.info.wifi.cms.entity.controller.SysAuthoritiesJpaController;
import com.info.wifi.cms.entity.controller.UserTypeJpaController;
import com.info.wifi.cms.entity.controller.VlanJpaController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 *
 * @author software1
 */
public class ReferenceData {

    private static final Logger logger = Logger.getLogger(ReferenceData.class.getName());
    private static List<SysAuthorities> authoritiesList = null;
    private static List<ReportConfiguration> listReport = null;
    static Map<Integer, SysSettings> mapSetting = null;
    static Map<Integer, SysSettings> logSettingMap = null;
    private static List<Vlan> vlanAllList = new ArrayList<Vlan>();
    private static List<HotspotOwner> businessOwnerList = new ArrayList<HotspotOwner>();
    private static List<UserType> userTypeList = new ArrayList<UserType>();
    private static List<AccessType> accessTypeList = new ArrayList<AccessType>();

    static String offloadingVlans = null;
    static String businessVlans = null;
    //Begin-OMAD01
    private static List<Country> countryList = null;

    public static List<Country> getCountry() {
        try {
            if (countryList == null) {
                countryList = (new CountryJpaController().getCountryList());
            }
        } catch (Exception ex) {
        }
        return countryList;

    }

    public static Country getNationality(String nationalityCode) {

        try {
            if (countryList==null) {
                countryList = (new CountryJpaController().getCountryList());
            }
            for (int j = 0; j <= countryList.size(); j++) {
                if (countryList.get(j).getNationalityCode().equals(nationalityCode)) {
                    return countryList.get(j);

                }

            }
        } catch (Exception ex) {
        }
        return null;

    }
    //End-OMAD01

    public static String getOffloadingVlans() {
        //read value from property file

        if (offloadingVlans == null) {
            String SQL = "select  LISTAGG(VLAN_ID, ',') WITHIN GROUP (ORDER BY VLAN_ID) "
                    + " from vlan  where HOTSPOT_OWNER in (SELECT OWNER_NAME FROM HOTSPOT_OWNER WHERE OWNER_NAME='Omantel1x')";
            offloadingVlans = new GenericJpaController().getSingleRow(SQL).toString();
        }

        return offloadingVlans;
    }

    public static String getOwnersVlans() {
        //read value from property file

        String SQL = "select  LISTAGG(VLAN_ID, ',') WITHIN GROUP (ORDER BY VLAN_ID) "
                + " from vlan  where HOTSPOT_OWNER not in (SELECT OWNER_NAME FROM HOTSPOT_OWNER WHERE OWNER_NAME='Omantel1x')";
        businessVlans = new GenericJpaController().getSingleRow(SQL).toString();
        return businessVlans;
    }

    public static String getOwnersVlans(String OwnerName) {
        //read value from property file

        String SQL = "select  LISTAGG(VLAN_ID, ',') WITHIN GROUP (ORDER BY VLAN_ID) "
                + " from vlan  where HOTSPOT_OWNER='" + OwnerName + "'";
        businessVlans = new GenericJpaController().getSingleRow(SQL).toString();

        return businessVlans;
    }

    public static SysSettings getSetting(String confName) {
        //read value from property file
        SysSettings settings = new SysSettings();
        if (mapSetting == null) {
            mapSetting = new SettingsFacade().getSettingMap();
        }

        if (mapSetting != null && 0 <= mapSetting.size()) {

            for (int i = 0; i <= mapSetting.size(); i++) {

                if (mapSetting.get(i).getSystemKey().equalsIgnoreCase(confName)) {
                    settings = (mapSetting.get(i));
                    break;
                }
            }
        }
        return settings;
    }

    public static ReportConfiguration getReportConfiguration(String confName) {
        //read value from property file

        Map<Integer, ReportConfiguration> reportConfigurationMap = null;

        ReportConfiguration reportConfiguration = new ReportConfiguration();
        if (reportConfigurationMap == null) {
            reportConfigurationMap = new ReportConfigurationFacade().getReportConfigurationMap();
        }

        if (reportConfigurationMap != null && reportConfigurationMap.size() > 0) {

            for (int i = 0; i < reportConfigurationMap.size(); i++) {

                if (reportConfigurationMap.get(i).getCode().equalsIgnoreCase(confName)) {
                    reportConfiguration = (reportConfigurationMap.get(i));
                    reportConfiguration.setSelectSql("/*" + confName + ":*/" + reportConfiguration.getSelectSql());
                    break;
                }
            }
        }
        return reportConfiguration;
    }

    public static List<ReportConfiguration> getReportConfigurations(String confName) {
        //read value from property file
        List<ReportConfiguration> reportConfiguration = new ArrayList<ReportConfiguration>();
        Map<Integer, ReportConfiguration> reportConfigurationMap = null;

        if (reportConfigurationMap == null) {
            reportConfigurationMap = new ReportConfigurationFacade().getReportConfigurationMap();
        }

        if (reportConfigurationMap == null || reportConfigurationMap.size() < 0) {
            reportConfigurationMap = new ReportConfigurationFacade().getReportConfigurationMap();
        }

        for (int i = 0; i < reportConfigurationMap.size(); i++) {

            if (reportConfigurationMap.get(i).getConfName().equalsIgnoreCase(confName)) {
                reportConfiguration.add((reportConfigurationMap.get(i)));
            }
        }
        return reportConfiguration;
    }

    public static List<PeStatus> getRadioSelectionList() {
        List<PeStatus> peStatusList = new ArrayList<PeStatus>();
        PeStatus status = new PeStatus();
        status.setCode(UIConstants.RADIO_LIST.Activate.value);
        status.setValue(UIConstants.RADIO_LIST.Activate.name());
        peStatusList.add(status);
        status = new PeStatus();
        status.setCode(UIConstants.RADIO_LIST.Reject.value);
        status.setValue(UIConstants.RADIO_LIST.Reject.name());
        peStatusList.add(status);
        status = new PeStatus();
        status.setCode(UIConstants.RADIO_LIST.Edit.value);
        status.setValue(UIConstants.RADIO_LIST.Edit.name());
        peStatusList.add(status);
        status = new PeStatus();
        status.setCode(UIConstants.RADIO_LIST.Print.value);
        status.setValue(UIConstants.RADIO_LIST.Print.name());
        peStatusList.add(status);
        return peStatusList;
    }

    /**
     *
     * @return
     */
    public static List<SysAuthorities> getAllAuthorities() {
        try {
            if (authoritiesList == null) {
                authoritiesList = new SysAuthoritiesJpaController().findSysAuthoritiesEntities();
            }
        } catch (Exception ex) {
        }
        return authoritiesList;

    }

    public static SysAuthorities getAllAuthority(String role) {

        try {
            if (authoritiesList == null) {
                authoritiesList = new SysAuthoritiesJpaController().findSysAuthoritiesEntities();
            }
            for (int j = 0; j <= authoritiesList.size(); j++) {
                if (authoritiesList.get(j).getAuthority().equals(role)) {
                    return authoritiesList.get(j);

                }

            }
        } catch (Exception ex) {
        }
        return null;

    }

    /**
     *
     * @return
     */
    public static List<PeStatus> getStatusList() {
        List<PeStatus> peStatusList = new ArrayList<PeStatus>();
        PeStatus status = new PeStatus();
        status.setCode(UIConstants.STATUS_CODE.ACTIVE.value);
        status.setValue(UIConstants.STATUS_CODE_DESC.ACTIVE.value);
        peStatusList.add(status);
        status = new PeStatus();
        status.setCode(UIConstants.STATUS_CODE.IN_ACTIVE.value);
        status.setValue(UIConstants.STATUS_CODE_DESC.IN_ACTIVE.value);
        peStatusList.add(status);
        return peStatusList;
    }

    public static List<PeGender> getGenderList() {
        List<PeGender> peGenderList = new ArrayList<PeGender>();
        PeGender gender = new PeGender();
        gender.setCode(UIConstants.GENDER.F.toString());
        gender.setValue(UIConstants.GENDER.F.value);
        peGenderList.add(gender);
        gender = new PeGender();
        gender.setCode(UIConstants.GENDER.M.toString());
        gender.setValue(UIConstants.GENDER.M.value);
        peGenderList.add(gender);
        return peGenderList;
    }

    public static List<ReportConfiguration> getReportConfigurations() {
        try {
            ReportConfigurationJpaController jpaController = new ReportConfigurationJpaController();
            if (listReport == null) {
                listReport = jpaController.findByColumn("Status", UIConstants.STATUS_CODE.ACTIVE.value);
            }
        } catch (Exception ex) {
        }
        return listReport;
    }

    public static List<HotspotOwner> getHotspotOwnersList(String ADV_AGENCY_ID) {
        if (businessOwnerList == null || businessOwnerList.size() < 1) {
            businessOwnerList = (new HotspotOwnerJpaController().findHotspotOwnerEntities());
        }
        if (!StringHelper.isNullOrEmpty(ADV_AGENCY_ID)) {
            List<HotspotOwner> hotspotOwnerLocal = new ArrayList<HotspotOwner>();
            for (int j = 0; j < businessOwnerList.size(); j++) {
                if (businessOwnerList.get(j).getOwnerName().equals(ADV_AGENCY_ID)) {
                    hotspotOwnerLocal.add(businessOwnerList.get(j));
                }
            }
            return hotspotOwnerLocal;
        }
        return businessOwnerList;
    }

    public static List<Vlan> getAllVlanList() {

        if (vlanAllList.isEmpty()) {
            vlanAllList = new VlanJpaController().findVlanEntities();
            if (vlanAllList != null) {
                for (Vlan vlanList1 : vlanAllList) {
                    vlanList1.setVlanName(vlanList1.getVlanId() + "-" + vlanList1.getVlanName());
                }
            }
        }
        return vlanAllList;
    }

    public static Vlan getVlan(String vlanId) {

        getAllVlanList();

        {
            for (Vlan vlanList1 : vlanAllList) {

                if (vlanList1.getVlanId().toString().equals(vlanId)) {
                    return vlanList1;
                }

            }
        }
        return null;
    }

    public static List<Vlan> getVlanList(String ADV_AGENCY_ID) {
        getAllVlanList();
        List<Vlan> vlanAllListLocal = new ArrayList<Vlan>();

        if (!StringHelper.isNullOrEmpty(ADV_AGENCY_ID)) {
            for (Vlan vlanList1 : vlanAllList) {

                if (vlanList1.getHotspotOwner().equals(ADV_AGENCY_ID)) {
                    vlanAllListLocal.add(vlanList1);
                }
            }

            return vlanAllListLocal;
        }
        return vlanAllList;
    }

    public static List<PeDisplayOrder> getDisplayOrderList() {
        List<PeDisplayOrder> peList = new ArrayList<PeDisplayOrder>();
        PeDisplayOrder obj = new PeDisplayOrder();

        obj.setCode(1 + "");
        obj.setValue(1 + "");
        peList.add(obj);

        obj = new PeDisplayOrder();
        obj.setCode(2 + "");
        obj.setValue(2 + "");
        peList.add(obj);
        obj = new PeDisplayOrder();
        obj.setCode(3 + "");
        obj.setValue(3 + "");
        peList.add(obj);
        return peList;
    }

    public static List<PeDurationType> getDurationFilter() {

        List<PeDurationType> list = new ArrayList<PeDurationType>();
        PeDurationType pe = new PeDurationType();
        pe.setDurationType("DAILY");
        pe.setDisplayValue("Daily");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("WEEKLY");
        pe.setDisplayValue("Weekly");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("MONTHLY");
        pe.setDisplayValue("Monthly");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("YEARLY");
        pe.setDisplayValue("Yearly");
        list.add(pe);

        return list;
    }

    public static List<PeDurationType> getDurationType() {

        List<PeDurationType> list = new ArrayList<PeDurationType>();
        PeDurationType pe = new PeDurationType();
        pe.setDurationType("HOURLY");
        pe.setDisplayValue("Hourly");
        list.add(pe);
        pe = new PeDurationType();
        pe.setDurationType("DAILY");
        pe.setDisplayValue("Daily");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("WEEKLY");
        pe.setDisplayValue("Weekly");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("MONTHLY");
        pe.setDisplayValue("Monthly");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("YEARLY");
        pe.setDisplayValue("Yearly");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("LOCATION");
        pe.setDisplayValue("By Location");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("OWNER");
        pe.setDisplayValue("By Owner");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("COUNTRY");
        pe.setDisplayValue("By Country");
        list.add(pe);

        pe = new PeDurationType();
        pe.setDurationType("968");
        pe.setDisplayValue("By Country(Excl. Oman)");
        list.add(pe);
        pe = new PeDurationType();
        pe.setDurationType("HOURLYINTER");
        pe.setDisplayValue("HOURLY - Internatinal");
        list.add(pe);
        return list;
    }

    public static List<AccessType> getAllAccessTypeList() {

        if (accessTypeList.isEmpty()) {
            accessTypeList = new AccessTypeJpaController().findAccessTypeEntities();

        }
        return accessTypeList;
    }

    public static AccessType getAccessType(String code) {

        getAllAccessTypeList();

        {
            for (AccessType object : accessTypeList) {

                if (String.valueOf(object.getCode()).equals(code)) {
                    return object;
                }

            }
        }
        return null;
    }

    public static List<UserType> getAllUserTypeList() {

        if (userTypeList.isEmpty()) {
            userTypeList = new UserTypeJpaController().findUserTypeEntities();

        }
        return userTypeList;
    }

    public static UserType getUserType(String code) {

        getAllUserTypeList();

        {
            for (UserType object : userTypeList) {

                if (String.valueOf(object.getCode()).equals(code)) {
                    return object;
                }

            }
        }
        return null;
    }

    public static String refereshCache(String entityName) {
        try {

            if (entityName.contains("All")) {

                //    advAgencyList = null;
                //  vlanAllList = new ArrayList<Vlan>();
                //  categoryList = new ArrayList<Category>();
                // advAgencyList = new ArrayList<AdvAgency>();
                authoritiesList = new SysAuthoritiesJpaController().findSysAuthoritiesEntities();
                mapSetting = new SettingsFacade().getSettingMap();
                businessOwnerList = null;
                vlanAllList = null;

            }

        } catch (Exception ex) {
        }

        return "NA";
    }
public static void  main ( String arg)
        
{
   


}
}
