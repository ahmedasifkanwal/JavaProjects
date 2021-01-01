<%@page import="org.apache.struts2.components.Date"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="com.ibm.icu.text.SimpleDateFormat"%>
<%@page import="com.info.cms.report.graph.UIPieChartData"%>
<%@page import="com.info.cms.helper.SSGAPIResult"%>
<%@page import="com.info.cms.helper.SSGAPI"%>
<%@page import="com.info.cms.facade.ReferenceData"%>
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
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
    Logger logger = Logger.getLogger("ProfileStatictics");
    JSONObject obj = new JSONObject();
    try {
        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();
        com.info.wifi.rad.entity.controller.GenericJpaController radFacade = new com.info.wifi.rad.entity.controller.GenericJpaController();
        com.info.mbb.cms.controller.GenericJpaController mbbFacade = new com.info.mbb.cms.controller.GenericJpaController();

        SysUsers user = (SysUsers) session.getAttribute("Users");

        if (request.getParameter("ROW").equalsIgnoreCase("ROW1")) {

            String SQL = "select count(*) from radonline where nasport in (" + ReferenceData.getOwnersVlans(user.getOwner()) + ")";
            int value = radFacade.getCount(SQL);
            obj.put("online", value);

            SQL = "select count(*)  from prepaidcard where    trunc(DATE_ACTIVATED) = trunc(sysdate) and  OWNER_NAME='" + user.getOwner() + "'";
            value = cmsFacade.getCount(SQL);
            obj.put("activation", value);
            SQL = "select  count(distinct(mobileno))  from prepaidcard where    trunc(DATE_ACTIVATED) = trunc(sysdate) and  OWNER_NAME='" + user.getOwner() + "'";
            value = cmsFacade.getCount(SQL);
            obj.put("uniqueactivation", value);
            SQL = " select   count(*)  from logs where status_type='Start' and  OWNER_NAME='" + user.getOwner() + "'";
            value = radFacade.getCount(SQL);
            int sessionCount = value;
            obj.put("session", value);

            SQL = " select  ROUND(sum(INPUT_OCTETS+OUTPUT_OCTETS)/(1024*1024),0)  from logs where status_type='Stop' and  OWNER_NAME='" + user.getOwner() + "'";
            value = radFacade.getCount(SQL);
            obj.put("banwidth", value / 1024 + " GB");
            obj.put("avgbanwidth", value / sessionCount + " MB");

        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW2")) {

            String SQL = " select devicename ,sum(total) from v_device_type  where   OWNER_NAME='" + user.getOwner() + "'  group by devicename";
            List list = cmsFacade.getAggDynamicReport(SQL, 200);
            if (list != null && list.size() > 0) {
                UIPieChartData objChart = new UIPieChartData();
                objChart.labelData = list;
                objChart.setChart();
                obj.put("seriesDeviceNameCount", "[" + objChart.seriesdata.replace("null", "NA") + "]");
                obj.put("DeviceNameCount", objChart.total + "");

            }
        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW3")) {

            String SQL = "   select distinct  T ,P,C  from  (select   TO_CHAR(time_connected, 'HH24:MI') As T ,"
                        + " sum(DEVICE_COUNT) AS P,sum( LOGIN_COUNT) as C  from CONNECTED_DEVICE where   vlan in (" + ReferenceData.getOwnersVlans(user.getOwner()) + ") and "
                        + " TO_CHAR(time_connected,'mm-dd-yy') =TO_CHAR(SYSDATE,'mm-dd-yy')   "
                        + " and time_connected between  SYSDATE - INTERVAL '5' HOUR  and  SYSDATE  group by TO_CHAR(time_connected, 'HH24:MI'))    "
                        + "   order by  T   asc";

            List list = cmsFacade.getAggDynamicReport(SQL, 50);
            if (list != null && list.size() > 0) {
                StringBuilder categories = new StringBuilder();
                StringBuilder series0 = new StringBuilder();
                StringBuilder series1 = new StringBuilder();

                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);

                    categories.append("'").append(data[0]).append("',");
                    series0.append("").append(data[1]).append(",");
                    series1.append("").append(data[2]).append(",");

                }

                obj.put("seriesActivationcategories", "[" + categories.toString() + "]");
                obj.put("seriesActivationComparision0", "[" + series0.toString() + "]");
                obj.put("seriesActivationComparision1", "[" + series1.toString() + "]");

            }
        }
        if (request.getParameter("ROW").equalsIgnoreCase("ROW4")) {

            String SQL = "select  LOCATION_ID , TRUNC( sum(INPUT_OCTETS)/(1024*1024),0) ,trunc( sum(OUTPUT_OCTETS)/(1024*1024),0)    "
                    + " from logs where   OWNER_NAME='" + user.getOwner() + "' and location_id in (" + ReferenceData.getOwnersVlans(user.getOwner()) + ")   and   TIMESTAMP between  SYSDATE - INTERVAL '24' HOUR  and  SYSDATE  "
                    + " GROUP by  LOCATION_ID  order by TRUNC( sum(INPUT_OCTETS)/(1024*1024*1024),0) DESC";
            List list = radFacade.getAggDynamicReport(SQL, 15);

            if (list != null && list.size() > 0) {
                StringBuilder categories = new StringBuilder();
                StringBuilder series0 = new StringBuilder();
                StringBuilder series1 = new StringBuilder();
                StringBuilder seriesavg = new StringBuilder();
                Integer totalUpload = 0, totalDownload = 0;
                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);
                    categories.append("'").append(data[0]).append("',");
                    series0.append("").append(data[1]).append(",");
                    series1.append("").append(data[2]).append(",");
                    seriesavg.append("").append((.1 + Integer.parseInt(data[2].toString()) + Integer.parseInt(data[1].toString())) / 2).append(",");
                    totalUpload = totalUpload + Integer.parseInt(data[2].toString());
                    totalDownload = totalDownload + Integer.parseInt(data[1].toString());

                }

                obj.put("seriesUtilizationcategories", "[" + categories.toString() + "]");
                obj.put("seriesUtilization0", "[" + series0.toString() + "]");
                obj.put("seriesUtilization1", "[" + series1.toString() + "]");
                obj.put("seriesUtilizationavg", "[" + seriesavg.toString() + "]");
                obj.put("totalDownload", totalDownload / 1024);
                obj.put("totalUpload", totalUpload / 1024);
            }
        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW5")) {

            String SQL = "select   vlan, count(*) as total from accountuser "
                        + " where  vlan in (" + ReferenceData.getOwnersVlans(user.getOwner()) + ") and date_creation between  SYSDATE - INTERVAL '24' HOUR  and  SYSDATE  "
                        + " group by vlan order by count(*) desc ";
                List list = radFacade.getAggDynamicReport(SQL, 200);

            if (list != null && list.size() > 0) {
                UIPieChartData objChart = new UIPieChartData();
                objChart.labelData = list;
                objChart.setChart();
                obj.put("seriesLoginCount", "[" + objChart.seriesdata.replace("null", "NA") + "]");
                obj.put("LoginCountTotal", objChart.total + "");

            }

            SQL = "select NASPORT, count(*) from radonline "
                        + " where nasport in (" + ReferenceData.getOwnersVlans(user.getOwner()) + ")"
                        + " group by  NASPORT";
                list = radFacade.getAggDynamicReport(SQL, 200);

            if (list != null && list.size() > 0) {
                UIPieChartData objChart = new UIPieChartData();
                objChart.labelData = list;
                objChart.setChart();
                obj.put("seriesOnlineCount", "[" + objChart.seriesdata.replace("null", "NA") + "]");
                obj.put("OnlineCount", objChart.total + "");

            }

        }

        com.info.wifi.ssg.controller.GenericJpaController liFacade = new com.info.wifi.ssg.controller.GenericJpaController();
        if (request.getParameter("ROW").equalsIgnoreCase("ROW6")) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy_MMM_dd");
            String table = "LI_LOG_" + format.format(DateHelper.addNoOfDays(new java.util.Date(), -1));
            String SQL = "select host ,count(*) from " + table + "  where  IF_DOWNSTREAM_VLAN in (" + ReferenceData.getOwnersVlans(user.getOwner()) + ")  and host like '%www%' GROUP by host  order by count(*) desc";
            List list = liFacade.getAggDynamicReport(SQL, 30);
            StringBuilder categories = new StringBuilder();
            StringBuilder series0 = new StringBuilder();

            if (list != null && list.size() > 0) {
                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);

                    series0.append("['").append(data[0]).append("',");
                    series0.append("").append(data[1]).append("],");
                }

            }
            obj.put("serieswebsites", "[" + series0 + "]");

        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW7")) {

            StringBuilder categories = new StringBuilder();
            StringBuilder series0 = new StringBuilder();
            StringBuilder series1 = new StringBuilder();
            String SQL = " select mobileno, download, upload  from ( "
                        + " select   mobileno  , (sum(INPUT_OCTETS))/(1024*1024) as download, "
                        + "(sum(OUTPUT_OCTETS))/(1024*1024)  as upload from  logs  group by  mobileno "
                        + " order by   (sum(INPUT_OCTETS))/(1024*1024)  desc)  where  rownum <=10";

            List list = radFacade.getAggDynamicReport(SQL);
            if (list != null && list.size() > 0) {
                int recordCount = list.size();
               for (int j = 0; j < recordCount; j++) {
                        Object[] data = (Object[]) list.get(j);
                        categories.append("'").append(data[0] == null ? "NA" : data[0]).append("',");
                        series0.append("").append(String.format("%.2f", Double.parseDouble((data[1] == null ? "0" : data[1].toString())) / 1)).append(",");
                              series1.append("").append(String.format("%.2f", Double.parseDouble((data[2] == null ? "0" : data[2].toString())) / 1)).append(",");

                }
            }

                obj.put("categories", "[" + categories.toString() + "]");
                obj.put("seriestable", "[" + series0.toString() + "]");
                obj.put("seriestable1", "[" + series1.toString() + "]");
                }
    } catch (Exception ex) {
        System.out.print(ex);
        obj.put("system_message", "The system failed to find the data , please chnage the search condition or contact admin:" + ex.getMessage());
        logger.log(Level.SEVERE, ex.getMessage());

    }
    out.print(obj);
    out.flush();

%>