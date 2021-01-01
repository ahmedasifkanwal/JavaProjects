

<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.cms.helper.UIConstants"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.info.cms.report.graph.facade.ProfileStaticticsFacade"%>
<%@page import="com.info.cms.presentation.entity.PeCampaignStatistics"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    Logger logger = Logger.getLogger("JsonProfileAnalytics");
    JSONObject obj = new JSONObject();
    try {

            int ADV_AGENCY_ID = 0;
            if (session != null && session.getAttribute("Users") != null) {
                SysUsers currentUser = (SysUsers) session.getAttribute("Users");

               // if (currentUser.getAdvertiserId() != null && currentUser.getAdvertiserId().intValue() > 0) {
                   //ADV_AGENCY_ID = currentUser.getAdvertiserId().intValue();

               // }

            }



        PeCampaignStatistics peCampaignStatistics = new PeCampaignStatistics();
           // peCampaignStatistics.setAdvAgencyId(ADV_AGENCY_ID);
        peCampaignStatistics.vlan = request.getParameter("VLAN");
        String dateRange = request.getParameter("DATE");
        if (dateRange != null && dateRange.length() > 5) {
            peCampaignStatistics.fromToDateBetween = ("'" + DateHelper.getSearchFormated(dateRange
                            .split(UIConstants.DATE_SEPRATOR)[0],
                            DateHelper.DATE_TYPE.BEGIN)
                            + "' and '" + DateHelper.getSearchFormated(dateRange
                                    .split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "'");
                }

        new ProfileStaticticsFacade().getProfileAnalytics(peCampaignStatistics, 30, 20, request.getParameter("TYPE"));
        if (request.getParameter("TYPE").equals("TOPURLS")
                    || request.getParameter("TYPE").equals("TOPNATIONALITY")
                    || request.getParameter("TYPE").equals("TOPCAT")) {
                obj.put("seriesCategories", "[" + peCampaignStatistics.seriesCategories.replace("null", "NA") + "]");
                obj.put("seriesCategoriesTotal", peCampaignStatistics.seriesCategoriesTotal);
            }

        if (request.getParameter("TYPE").equals("TOPDEVICE")) {
            obj.put("seriesDeviceOs", "[" + peCampaignStatistics.seriesDeviceOs.replace("null", "NA") + "]");
            obj.put("seriesDeviceOsTotal", peCampaignStatistics.seriesDeviceOsTotal);

            obj.put("seriesDeviceBrowser", "[" + peCampaignStatistics.seriesDeviceBrowser.replace("null", "NA") + "]");
            obj.put("seriesDeviceBrowserTotal", peCampaignStatistics.seriesDeviceBrowserTotal);

            obj.put("seriesDeviceType", "[" + peCampaignStatistics.seriesDeviceType.replace("null", "NA") + "]");
            obj.put("seriesDeviceTypeTotal", peCampaignStatistics.seriesDeviceTypeTotal);

        }

            if (request.getParameter("TYPE").equals("TOPBANNER")) {
                obj.put("seriesCategories", peCampaignStatistics.seriesCategories);
                obj.put("seriesCategoriesTotal", peCampaignStatistics.seriesCategoriesTotal);
            }

    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.getMessage());

    }
    out.print(obj);
    out.flush();

%>