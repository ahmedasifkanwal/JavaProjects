/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.report.graph.facade;

import com.info.cms.facade.ReferenceData;
import com.info.cms.helper.StringHelper;
import com.info.cms.presentation.entity.PeCampaignStatistics;
import com.info.cms.presentation.entity.PeChart;
import com.info.cms.presentation.entity.PeProfileStatistics;
import com.info.cms.presentation.entity.PeSmsCampaignStatistics;
import com.info.cms.report.graph.UIDataTable;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.controller.GenericJpaController;
import java.util.List;

/**
 *
 * @author SALEEM
 */
public class ProfileStaticticsFacade {

    public void getProfileStatistics(PeChart peChart) {
        PeProfileStatistics peProfileStatistics = new PeProfileStatistics();
        ReportConfiguration conf = ReferenceData.getReportConfiguration("DASH_PROFILE_STATICTICS");
        String SQL = conf.getSelectSql();
        if (!StringHelper.isNullOrEmpty(peChart.getAdvAgencyId())) {
            SQL = SQL.replace("/**", " ").replace("**/", " ").replace("{0}", peChart.getAdvAgencyId() + "");

        }

        List list = new GenericJpaController().getAggDynamicReport(SQL);
        Object[] data = (Object[]) list.get(0);
        //Please do not change the sequence of assigment.
        peProfileStatistics.male = data[0].toString();
        peProfileStatistics.female = data[1].toString();
        peProfileStatistics.profile = data[2].toString();
        peProfileStatistics.activeCampaign = data[3].toString();
        peProfileStatistics.setActiveSmsCampaign(data[4].toString());
        peChart.setPeProfileStatistics(peProfileStatistics);

    }

    public boolean getCampaignStatistics(PeCampaignStatistics peCampaignStatistics) {
        /*  Campaign campaign = new CampaignJpaController()
                .findCampaign(new BigDecimal(peCampaignStatistics.campaignId));
        SimpleDateFormat DATE_FORMAT_DISPLAY = new SimpleDateFormat("dd-MM-yyyy");
        String campaignDateRange = " BETWEEN  TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getStartDate()) + " 00:00:00', '"
                + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS') AND TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getEndDate()) + " 23:59:59', '" + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS')";
        String vlanId = "";
        if (campaign.getCampaignVlanCollection() == null || campaign.getCampaignVlanCollection().size() < 1) {
            return false;

        } else {
            for (CampaignVlan campaignVlan : campaign.getCampaignVlanCollection()) {
                vlanId = vlanId + campaignVlan.getVlan().intValue() + ",";

            }

            vlanId = vlanId.substring(0, vlanId.length() - 1);
        }

        if (campaign.getCampaignBannerCollection() == null || campaign.getCampaignBannerCollection().size() < 1) {
            return false;

        }
        if (campaign.getCampaignType().equals(UIConstants.CAMPAIGN_TYPE.LOC_CAT.value) && (campaign.getCampaignCategoryCollection() == null || campaign.getCampaignCategoryCollection().size() < 1)) {
            return false;
        }

        peCampaignStatistics.view = campaign.getCpiUsed() != null ? campaign.getCpiUsed() + "" : "0";
        peCampaignStatistics.hit = campaign.getCpcUsed() != null ? campaign.getCpcUsed() + "" : "0";
        peCampaignStatistics.ctr = (campaign.getCpcUsed() != null && campaign.getCpiUsed() != null && campaign.getCpiUsed().intValue() > 0)
                ? campaign.getCpcUsed().intValue() * 100 / campaign.getCpiUsed().intValue() + " %" : "0";
        //Reach No of Unique PPL who saw the Adv.
        String sqlReach = "select  count(   DISTINCT(MAC)) from CAMPAIGN_VIEW where CAMPAIGN_ID=" + peCampaignStatistics.campaignId + "  and VIEWED_ON " + campaignDateRange;
        peCampaignStatistics.reach = new GenericJpaController().getCount(sqlReach) + "";
        peCampaignStatistics.revenue = (campaign.getAmount() != null)
                ? campaign.getAmount() + "" : "0";
        String sqlBounce = "select  (select  count(   DISTINCT(MAC)) from CAMPAIGN_VIEW where CAMPAIGN_ID=" + peCampaignStatistics.campaignId + "  and VIEWED_ON " + campaignDateRange
                + " and PAGE_NAME not in ('P2','P3'))*100/(select count(   DISTINCT(MAC)) from CAMPAIGN_VIEW where CAMPAIGN_ID=" + peCampaignStatistics.campaignId + "  and VIEWED_ON " + campaignDateRange + " and PAGE_NAME in ('P2','P3')) as bounce\n"
                + " from dual";

        String sqlIsmac = "select count(   DISTINCT(MAC)) from CAMPAIGN_VIEW where CAMPAIGN_ID=" + peCampaignStatistics.campaignId + "  and VIEWED_ON " + campaignDateRange + " and PAGE_NAME in ('P2','P3')";
        int ismac = new GenericJpaController().getCount(sqlIsmac);

        if (ismac > 0) {
            peCampaignStatistics.bounceRate = new GenericJpaController().getCount(sqlBounce) + "";

        }
        String sqlvlan = "Select   count(   DISTINCT(VLAN))  from  CAMPAIGN_VLAN where CAMPAIGN_ID=" + peCampaignStatistics.campaignId + " and Status='A'";
        int vcount = new GenericJpaController().getCount(sqlvlan);
        String sqlCat = "Select  sum(CASE WHEN gender is null THEN 0 ELSE 1 END+CASE WHEN category_id is null THEN 0 ELSE 1 END \n "
                + "  + CASE WHEN nationality_id is null THEN 0 ELSE 1 END  +CASE WHEN age_group_id is null THEN 0 ELSE 1 END ) as catcount  from  CAMPAIGN_CATEGORY \n "
                + "  where CAMPAIGN_ID=" + peCampaignStatistics.campaignId + " and Status='A'";

        int catCount = new GenericJpaController().getCount(sqlCat);

        peCampaignStatistics.catLocCount = vcount + "/" + catCount;
        //Data from Radistor.
        String RADSQL = "SELECT \n"
                + "(SELECT COUNT(*)   FROM RADONLINE WHERE NASPORT IN  (" + vlanId + ")) AS ONLINE_USER,\n "
                + "(SELECT COUNT(*)   FROM LOGS WHERE LOCATION_ID IN  (" + vlanId + ") AND STATUS_TYPE='Stop'  AND TIMESTAMP\n "
                + campaignDateRange + ") AS SESSION_COUNT,\n"
                + "( SELECT ROUND(  SUM(INPUT_OCTETS+OUTPUT_OCTETS+.001) /(1024*1024),2 ) FROM LOGS WHERE LOCATION_ID IN  (" + vlanId + ") AND STATUS_TYPE='Stop'  AND TIMESTAMP\n "
                + campaignDateRange + " ) AS DATA_USAGE FROM DUAL";

        List list = new GenericRadJpaController().getAggDynamicReport(RADSQL);
        Object[] data = (Object[]) list.get(0);
        //Please do not change the sequence of assigment.
        peCampaignStatistics.online = data[0] == null ? "0" : data[0].toString();
        peCampaignStatistics.loginSession = data[1] == null ? "0" : data[1].toString();
        peCampaignStatistics.bandwith = data[2] == null ? "0.00000001" : data[2].toString();

        peCampaignStatistics.avgBandwith = Double.parseDouble(peCampaignStatistics.bandwith) / Integer.parseInt(peCampaignStatistics.loginSession.equals("0") ? "1" : peCampaignStatistics.loginSession) + "";

        int noOfDay = DateHelper.getNoOfDay(campaign.getEndDate(), campaign.getStartDate());
        peCampaignStatistics.loginSessionPerDay = noOfDay == 0 ? Integer.parseInt(peCampaignStatistics.loginSession) + "" : Integer.parseInt(peCampaignStatistics.loginSession) / noOfDay + "";
       */
        return true;

    }

    public boolean getCampaignDeviceStatistics(PeCampaignStatistics peCampaignStatistics) {

        /*  Campaign campaign = new CampaignJpaController()
                .findCampaign(new BigDecimal(peCampaignStatistics.campaignId));
        SimpleDateFormat DATE_FORMAT_DISPLAY = new SimpleDateFormat("dd-MM-yyyy");
        String campaignDateRange = " BETWEEN  TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getStartDate()) + " 00:00:00', '"
                + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS') AND TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getEndDate()) + " 23:59:59', '" + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS')";
        // String vlanId = "";
        if (campaign.getCampaignVlanCollection() == null || campaign.getCampaignVlanCollection().size() < 1) {
            return false;

        }

        if (campaign.getCampaignBannerCollection() == null || campaign.getCampaignBannerCollection().size() < 1) {
            return false;

        }
        if (campaign.getCampaignType().equals(UIConstants.CAMPAIGN_TYPE.LOC_CAT.value) && (campaign.getCampaignCategoryCollection() == null || campaign.getCampaignCategoryCollection().size() < 1)) {
            return false;
        }

        //Device Type
        String sqlDeviceType = "SELECT DEVICE_TYPE, COUNT(*)  FROM CAMPAIGN_VIEW WHERE CAMPAIGN_ID = " + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY DEVICE_TYPE";
        List listDeviceType = new GenericJpaController().getAggDynamicReport(sqlDeviceType);
        UIPieChartData obj = new UIPieChartData();

        if (listDeviceType != null && listDeviceType.size() > 0) {
            obj.labelData = listDeviceType;
            obj.setChart();
            peCampaignStatistics.seriesDeviceType = obj.seriesdata;
            peCampaignStatistics.seriesDeviceTypeTotal = obj.total + "";
        }

        //OS
        String sqlDeviceOs = "SELECT DEVICE_OS, COUNT(*)  FROM CAMPAIGN_VIEW WHERE CAMPAIGN_ID = " + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY DEVICE_OS";
        List listDeviceOs = new GenericJpaController().getAggDynamicReport(sqlDeviceOs);
        if (listDeviceOs != null && listDeviceOs.size() > 0) {
            obj = new UIPieChartData();
            obj.labelData = listDeviceOs;
            obj.setChart();
            peCampaignStatistics.seriesDeviceOs = obj.seriesdata;
            peCampaignStatistics.seriesDeviceOsTotal = obj.total + "";
        }
        //Browser
        String sqlDeviceBrowser = "SELECT DEVICE_BROWSER, COUNT(*)  FROM CAMPAIGN_VIEW WHERE CAMPAIGN_ID = " + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY DEVICE_BROWSER";
        List listDeviceBrowser = new GenericJpaController().getAggDynamicReport(sqlDeviceBrowser);

        if (listDeviceBrowser != null && listDeviceBrowser.size() > 0) {
            obj = new UIPieChartData();
            obj.labelData = listDeviceBrowser;
            obj.setChart();
            peCampaignStatistics.seriesDeviceBrowser = obj.seriesdata;
            peCampaignStatistics.seriesDeviceBrowserTotal = obj.total + "";
        }

        //Manufa
        String sqlDeviceManufac = "SELECT DEVICE_MANUFACTURER, COUNT(*)  FROM CAMPAIGN_VIEW WHERE CAMPAIGN_ID = " + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY DEVICE_MANUFACTURER";
        List listDeviceManufac = new GenericJpaController().getAggDynamicReport(sqlDeviceManufac);
        if (listDeviceManufac != null && listDeviceManufac.size() > 0) {
            obj = new UIPieChartData();
            obj.labelData = listDeviceManufac;
            obj.setChart();
            peCampaignStatistics.seriesDeviceManufac = obj.seriesdata;
            peCampaignStatistics.seriesDeviceManufacTotal = obj.total + "";
        }*/
        return true;
    }

    public boolean getCampaignCategoryStatistics(PeCampaignStatistics peCampaignStatistics) {

        /* Campaign campaign = new CampaignJpaController()
                .findCampaign(new BigDecimal(peCampaignStatistics.campaignId));
        SimpleDateFormat DATE_FORMAT_DISPLAY = new SimpleDateFormat("dd-MM-yyyy");
        String campaignDateRange = " BETWEEN  TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getStartDate()) + " 00:00:00', '"
                + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS') AND TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getEndDate()) + " 23:59:59', '" + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS')";
        // String vlanId = "";
        if (campaign.getCampaignVlanCollection() == null || campaign.getCampaignVlanCollection().size() < 1) {
            return false;

        }

        if (campaign.getCampaignBannerCollection() == null || campaign.getCampaignBannerCollection().size() < 1) {
            return false;

        }
        if (campaign.getCampaignType().equals(UIConstants.CAMPAIGN_TYPE.LOC_CAT.value) && (campaign.getCampaignCategoryCollection() == null || campaign.getCampaignCategoryCollection().size() < 1)) {
            return false;
        }

        //UNIQUE CATEGORIES
        String sqlCats = "SELECT CATEGORY_ID, MAC ,COUNT(*)  FROM CAMPAIGN_VIEW WHERE  CATEGORY_ID IS NOT NULL AND CAMPAIGN_ID =" + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY CATEGORY_ID, MAC";
        List catList = new GenericJpaController().getAggDynamicReport(sqlCats);
        StringBuilder catIds = new StringBuilder("");
        if (catList.size() > 0) {

            for (Object catList1 : catList) {
                Object[] data = (Object[]) catList1;
                catIds.append(data[0] + ",");
            }

        }
        String totalCat = "0";
        PeResult series = builCategorySeries(catIds.toString().trim(), totalCat);
        if (!StringHelper.isNullOrEmpty(series.getMessage())) {
            peCampaignStatistics.seriesCategories = series.getMessage();
            peCampaignStatistics.seriesCategoriesTotal = series.getResultCode() + "";
        }

        //AGE
        String sqlAge = "SELECT REF_AGE_GROUP.AGE_GROUP ,  COUNT(*)   FROM CAMPAIGN_VIEW ,REF_AGE_GROUP  WHERE  CAMPAIGN_VIEW.AGE_GROUP_ID  =REF_AGE_GROUP.ID AND     CAMPAIGN_ID =" + peCampaignStatistics.campaignId + " AND AGE_GROUP_ID IS NOT NULL AND VIEWED_ON \n"
                + campaignDateRange + " GROUP BY REF_AGE_GROUP.AGE_GROUP, MAC ";
        UIPieChartData obj = new UIPieChartData();
        List listAge = new GenericJpaController().getAggDynamicReport(sqlAge);
        if (listAge != null && listAge.size() > 0) {
            obj = new UIPieChartData();
            obj.labelData = listAge;
            obj.setChart();
            peCampaignStatistics.seriesAge = obj.seriesdata;
            peCampaignStatistics.seriesAgeTotal = obj.total + "";
        }
        //Gender
        String sqlDeviceBrowser = "SELECT GENDER ,  COUNT(*)   FROM CAMPAIGN_VIEW  WHERE CAMPAIGN_ID = " + peCampaignStatistics.campaignId + " AND GENDER IS NOT NULL AND VIEWED_ON" + campaignDateRange + " GROUP BY GENDER";
        List listDeviceBrowser = new GenericJpaController().getAggDynamicReport(sqlDeviceBrowser);

        if (listDeviceBrowser != null && listDeviceBrowser.size() > 0) {
            obj = new UIPieChartData();
            obj.labelData = listDeviceBrowser;
            obj.setChart();
            peCampaignStatistics.seriesGender = obj.seriesdata;
            peCampaignStatistics.seriesGenderTotal = obj.total + "";
        }

        //Manufa
        String sqlDeviceManufac = "SELECT NATIONALITY.NATIONALITY,  COUNT(*)   FROM CAMPAIGN_VIEW ,NATIONALITY   WHERE  CAMPAIGN_VIEW.NATIONALITY_ID  =NATIONALITY.ID AND     CAMPAIGN_ID = " + peCampaignStatistics.campaignId + " AND NATIONALITY IS NOT NULL AND VIEWED_ON \n"
                + campaignDateRange + "GROUP BY NATIONALITY.NATIONALITY";
        List listDeviceManufac = new GenericJpaController().getAggDynamicReport(sqlDeviceManufac);
        if (listDeviceManufac != null && listDeviceManufac.size() > 0) {
            obj = new UIPieChartData();
            obj.labelData = listDeviceManufac;
            obj.setChart();
            peCampaignStatistics.seriesNationality = obj.seriesdata;
            peCampaignStatistics.seriesNationalityTotal = obj.total + "";
        }
        */
        return true;
    }

    public boolean getCampaignViewHitReachStatistics(PeCampaignStatistics peCampaignStatistics) {

        /*  Campaign campaign = new CampaignJpaController()
                .findCampaign(new BigDecimal(peCampaignStatistics.campaignId));
        SimpleDateFormat DATE_FORMAT_DISPLAY = new SimpleDateFormat("dd-MM-yyyy");
        String campaignDateRange = " BETWEEN  TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getStartDate()) + " 00:00:00', '"
                + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS') AND TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getEndDate()) + " 23:59:59', '" + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS')";
        // String vlanId = "";
        if (campaign.getCampaignVlanCollection() == null || campaign.getCampaignVlanCollection().size() < 1) {
            return false;

        }

        if (campaign.getCampaignBannerCollection() == null || campaign.getCampaignBannerCollection().size() < 1) {
            return false;

        }
        if (campaign.getCampaignType().equals(UIConstants.CAMPAIGN_TYPE.LOC_CAT.value) && (campaign.getCampaignCategoryCollection() == null || campaign.getCampaignCategoryCollection().size() < 1)) {
            return false;
        }

        //VIEWED
        String sqlView = "SELECT  TO_CHAR (VIEWED_ON, 'MON'), COUNT(*)  FROM CAMPAIGN_VIEW WHERE  CAMPAIGN_ID =" + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY  TO_CHAR (VIEWED_ON, 'MON') order by TO_CHAR (VIEWED_ON, 'MON') desc";
        List viewList = new GenericJpaController().getAggDynamicReport(sqlView);
        StringBuilder view = new StringBuilder("");
        String months = "";

        if (viewList.size() > 0) {

            for (Object catList1 : viewList) {
                Object[] data = (Object[]) catList1;
                view.append(data[1] + ",");
                months = months + "'" + data[0] + "',";
            }

            peCampaignStatistics.view = view.toString();
            peCampaignStatistics.months = months;

        }

        String sqlHit = " SELECT  TO_CHAR (HITS_ON, 'MON'), COUNT(*)  FROM CAMPAIGN_HIT   WHERE  CAMPAIGN_ID =" + peCampaignStatistics.campaignId + "  AND HITS_ON" + campaignDateRange + " GROUP BY  TO_CHAR (HITS_ON, 'MON')  order by TO_CHAR (HITS_ON, 'MON') desc";

        List hitList = new GenericJpaController().getAggDynamicReport(sqlHit);
        StringBuilder hit = new StringBuilder("");
        if (hitList.size() > 0) {

            for (Object catList1 : hitList) {
                Object[] data = (Object[]) catList1;
                hit.append(data[1] + ",");
            }

            peCampaignStatistics.hit = hit.toString();

        }

        String sqlReach = " SELECT  TO_CHAR (VIEWED_ON, 'MON'),count(DISTINCT(MAC))   FROM CAMPAIGN_VIEW  WHERE  CAMPAIGN_ID =" + peCampaignStatistics.campaignId + "  AND VIEWED_ON" + campaignDateRange + " GROUP BY  TO_CHAR (VIEWED_ON, 'MON') order by TO_CHAR (VIEWED_ON, 'MON') desc";

        List reachList = new GenericJpaController().getAggDynamicReport(sqlReach);
        StringBuilder reach = new StringBuilder("");
        if (reachList.size() > 0) {

            for (Object catList1 : reachList) {
                Object[] data = (Object[]) catList1;
                reach.append(data[1] + ",");
            }

            peCampaignStatistics.reach = reach.toString();

        }
*/
        return true;
    }

    public boolean getProfileAnalytics(PeCampaignStatistics peCampaignStatistics, int lastDay, int recordCount, String reportName) {
        String locationVlan = "";
        if (peCampaignStatistics.vlan != null && !peCampaignStatistics.vlan.equals("0")) {
            locationVlan = "   and  a.vlan_id=" + peCampaignStatistics.vlan;
        }
        List list = null;
        int total = 0;
        //VIEWED WEB
        if (reportName.equals("TOPURLS")) {
            String sqlView = "select host_name , sum (host_name_hit) from    WEB_BROWSING_LOGS a where  TO_CHAR(DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS') "
                    + " BETWEEN  " + peCampaignStatistics.fromToDateBetween + locationVlan + " GROUP BY  host_name  ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlView, recordCount);

            StringBuilder seriesWebUrls = new StringBuilder();

            if (list.size() > 0) {

                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;
                    seriesWebUrls.append("['").append(data[0]).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesCategories = seriesWebUrls.toString();
                peCampaignStatistics.seriesCategoriesTotal = total + "";

            }
        }

        //CAT
        if (reportName.equals("TOPCAT")) {
            String sqlcat = "select b.CATEGORY_IDS,sum(a.host_name_hit) from    WEB_BROWSING_LOGS a,web_urls b  where     b.host_name=a.host_name and  TO_CHAR(a.DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS')  \n"
                    + "  BETWEEN    " + peCampaignStatistics.fromToDateBetween + locationVlan + "  group by b.CATEGORY_IDS  ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlcat, recordCount);

            StringBuilder seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {

                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;
                    // Category cat = ReferenceData.getAllCategory(Integer.parseInt(data[0].toString()));
                    //  String catName = cat == null ? "NA" : cat.getCategory();
                    // seriesCats.append("['").append(catName).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesCategories = seriesCats.toString();
                peCampaignStatistics.seriesCategoriesTotal = total + "";

            }
        }

        if (reportName.equals("TOPNATIONALITY")) {
            String sqlcat = "select n.NATIONALITY ,sum(a.host_name_hit) from    WEB_BROWSING_LOGS a,web_urls b ,WIFI_PROFILE f, Nationality n where  f.NATIONALITY_ID=n.id and "
                    + "     f.MAC=a.MAC_ADDRESS and b.host_name=a.host_name and  TO_CHAR(a.DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS')  \n"
                    + "  BETWEEN    " + peCampaignStatistics.fromToDateBetween + locationVlan + "  group by  n.NATIONALITY  ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlcat, recordCount);

            StringBuilder seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {

                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;

                    seriesCats.append("['").append(data[0]).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesCategories = seriesCats.toString();
                peCampaignStatistics.seriesCategoriesTotal = total + "";

            }
        }
        if (reportName.equals("TOPDEVICE")) {

            String sqlView = "select a.DEVICE_OS , sum (host_name_hit) from    WEB_BROWSING_LOGS a where  TO_CHAR(a.DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS') "
                    + " BETWEEN  " + peCampaignStatistics.fromToDateBetween + locationVlan + " GROUP BY  a.DEVICE_OS  ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlView, recordCount);

            StringBuilder seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {

                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;

                    seriesCats.append("['").append(data[0]).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesDeviceOs = seriesCats.toString();
                peCampaignStatistics.seriesDeviceOsTotal = total + "";

            }

            sqlView = "select  a.BROWSER_TYPE , sum (host_name_hit) from    WEB_BROWSING_LOGS a where   TO_CHAR(a.DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS') "
                    + " BETWEEN  " + peCampaignStatistics.fromToDateBetween + locationVlan + " GROUP BY   a.BROWSER_TYPE  ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlView, recordCount);

            seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {

                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;

                    seriesCats.append("['").append(data[0]).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesDeviceBrowser = seriesCats.toString();
                peCampaignStatistics.seriesDeviceBrowserTotal = total + "";

            }

            sqlView = "select a.DEVICE_TYPE , sum (host_name_hit) from    WEB_BROWSING_LOGS a   where   TO_CHAR(a.DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS') "
                    + " BETWEEN  " + peCampaignStatistics.fromToDateBetween + locationVlan + " GROUP BY a.DEVICE_TYPE ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlView, recordCount);

            seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {

                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;

                    seriesCats.append("['").append(data[0]).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesDeviceType = seriesCats.toString();
                peCampaignStatistics.seriesDeviceTypeTotal = total + "";

            }
        }
        if (reportName.equals("TOGENDER")) {
            String sqlcat = "select  f.GENDER ,sum(a.host_name_hit) from    WEB_BROWSING_LOGS a,web_urls b ,Nationality n where  f.NATIONALITY_ID=n.id  "
                    + " and  f.MAC=a.MAC_ADDRESS and b.host_name=a.host_name and  TO_CHAR(a.DATETIME_VISITED, 'YYYY-MM-DD HH24:MI:SS')  \n"
                    + "  BETWEEN    " + peCampaignStatistics.fromToDateBetween + locationVlan + "  group by  f.GENDER ORDER BY  sum (host_name_hit) DESC";

            list = new GenericJpaController().getAggDynamicReport(sqlcat, recordCount);

            StringBuilder seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {
                for (Object catList1 : list) {
                    Object[] data = (Object[]) catList1;
                    seriesCats.append("['").append(data[0]).append("',").append(data[1]).append("],");
                    total = total + Integer.parseInt(data[1].toString().trim());
                }
                peCampaignStatistics.seriesCategories = seriesCats.toString();
                peCampaignStatistics.seriesCategoriesTotal = total + "";

            }
        }

        if (reportName.equals("TOPBANNER")) {
            peCampaignStatistics.seriesCategories = "";
            if (peCampaignStatistics.vlan != null && !peCampaignStatistics.vlan.equals("0")) {
                locationVlan = "  and c.CAMPAIGN_ID in (select campaign_id from CAMPAIGN_VLAN where vlan=" + peCampaignStatistics.vlan + ")   ";
            }
            String agency = "";
            // if (peCampaignStatistics.getAdvAgencyId() > 0) {
                agency = "   and  n.ADV_AGENCY_ID=" + peCampaignStatistics.getAdvAgencyId();

            // }
            String url = " ('<img onclick=\"getFullSize(this)\"  id=\"main-screenshot\" src=\"ilasimage/' || b.image_url || '\" width=\"200px\" height=\"150px\"/>')";
            String sqlcat = "select " + url + ", n.CAMPAIGN_NAME,n.BRAND_NAME, ('<a title=\"Views Details\" class=\"glyphicons glyphicons-eye_open\"    href=\"viewcampaign.icms?id='||n.ID ||'\">'||''||'</a>') AS ViewDetails ,\n"
                    + "('<a title=\"Graphical Report\" class=\"glyphicons glyphicons-stats\"    href=\"viewcampaignreport.icms?id='||n.ID ||'\">'||''||'</a>') AS Report,   count(*)  from campaign_view c, campaign_banner b ,campaign n\n"
                    + " where   n.id=c.campaign_id and   c.campaign_id=b.campaign_id   and  TO_CHAR(c.VIEWED_ON, 'YYYY-MM-DD HH24:MI:SS')  \n"
                    + "  BETWEEN    " + peCampaignStatistics.fromToDateBetween + locationVlan + agency + "  group by b.image_url, n.CAMPAIGN_NAME,n.BRAND_NAME,n.id,n.id     order by count(*) desc";
            list = new GenericJpaController().getAggDynamicReport(sqlcat, recordCount);
            StringBuilder seriesCats = new StringBuilder();
            total = 0;
            if (list.size() > 0) {
                String table = UIDataTable.getFormattedTable(list, "Banner,Campaign,Brand Name,View,Report,Total Views", null, "N");
                peCampaignStatistics.seriesCategories = "    <table class=\"table table-striped table-bordered table-hover\" id=\"datatable1\">\n"
                        + table
                        + " </table>";
                peCampaignStatistics.seriesCategoriesTotal = "";
            }
        }

        return true;
    }

    public boolean getSmsAnalytics(PeSmsCampaignStatistics pe, int lastDay, int recordCount) {

        /*SmsCampaign campaign = new SmsCampaignJpaController()
                .findSmsCampaign(new BigDecimal(pe.smsCampaignId));

        SimpleDateFormat DATE_FORMAT_DISPLAY = new SimpleDateFormat("dd-MM-yyyy");
        String campaignDateRange = " BETWEEN  TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getStartDate()) + " 00:00:00', '"
                + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS') AND TO_DATE ('" + DATE_FORMAT_DISPLAY.format(campaign.getEndDate()) + " 23:59:59', '" + DATE_FORMAT_DISPLAY.toPattern() + "  HH24:MI:SS')";

        String sqlSMSDelivery = " SELECT  TO_CHAR (SCHEDULED_DATE, 'MM') ,TO_CHAR (SCHEDULED_DATE, 'MON'),count(*) FROM SMS_BASED_CAMPAIGN   WHERE  SMS_CAMPAIGN_ID =" + pe.smsCampaignId + "  AND SCHEDULED_DATE " + campaignDateRange + "  GROUP BY  TO_CHAR (SCHEDULED_DATE, 'MM') , TO_CHAR (SCHEDULED_DATE, 'MON')  order by TO_CHAR (SCHEDULED_DATE, 'MM') asc ";

        List sqlSMSDeliveryList = new GenericJpaController().getAggDynamicReport(sqlSMSDelivery);
        StringBuilder dataList = new StringBuilder("");
        StringBuilder categoryseries = new StringBuilder("");
        int total = 0;
        if (sqlSMSDeliveryList.size() > 0) {

            for (Object catList1 : sqlSMSDeliveryList) {
                Object[] data = (Object[]) catList1;

                categoryseries.append("'" + data[1] + "',");
                dataList.append("" + data[2] + ",");
                total = total + Integer.parseInt(data[2].toString().trim());
            }

            pe.seriesSMSCategories = categoryseries.toString();
            pe.seriesSMS = dataList.toString();
            pe.seriesSMSTotal = total + "";

        }

       */
        return true;

    }

    public static void main(String argv[]) {

        PeCampaignStatistics peCampaignStatistics = new PeCampaignStatistics();
        peCampaignStatistics.campaignId = "142";
        new ProfileStaticticsFacade().getCampaignCategoryStatistics(peCampaignStatistics);

    }

}
