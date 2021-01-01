

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

        SysUsers user = (SysUsers) session.getAttribute("Users");
        if (request.getParameter("ROW").equalsIgnoreCase("ROW1")) {

            String SQL = "select   vlan, count(*) as total from accountuser "
                        + " where   date_creation between  SYSDATE - INTERVAL '24' HOUR  and  SYSDATE  "
                        + " group by vlan order by count(*) desc ";
                List list = radFacade.getAggDynamicReport(SQL, 200);

            if (list != null && list.size() > 0) {
                UIPieChartData objChart = new UIPieChartData();
                objChart.labelData = list;
                objChart.setChart();
                obj.put("seriesLoginCount", "[" + objChart.seriesdata.replace("null", "NA") + "]");
                obj.put("LoginCountTotal", objChart.total + "");

            }

            SQL = "select NASPORT, count(*) from radonline  group by  NASPORT";
            list = radFacade.getAggDynamicReport(SQL, 200);

            if (list != null && list.size() > 0) {
                UIPieChartData objChart = new UIPieChartData();
                objChart.labelData = list;
                objChart.setChart();
                obj.put("seriesOnlineCount", "[" + objChart.seriesdata.replace("null", "NA") + "]");
                obj.put("OnlineCount", objChart.total + "");

            }

            SQL = " select vlan  , sum(total)  as total from ("
                        + " select vlan  , count(*)  as total from prepaidcard where created_by='MOBILE'"
                        + " and date_created between  SYSDATE - INTERVAL '24' HOUR  and  SYSDATE    "
                        + " group by vlan "
                        + " union all"
                        + " select vlan  , count(*)  as total from prepaidcard_expired where created_by='MOBILE'"
                        + " and date_created between  SYSDATE - INTERVAL '24' HOUR  and  SYSDATE  group by vlan "
                        + " )a group by vlan";
                list = cmsFacade.getAggDynamicReport(SQL, 200);

            if (list != null && list.size() > 0) {
                UIPieChartData objChart = new UIPieChartData();
                objChart.labelData = list;
                objChart.setChart();
                obj.put("seriesMobileActivationCount", "[" + objChart.seriesdata.replace("null", "NA") + "]");
                obj.put("MobileActivationCount", objChart.total + "");

            }

        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW2")) {

            String SQL = " select devicename ,sum(total) from v_device_type  group by devicename";
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
                        + " TOTAL_CONNECTED_COUNT AS P, TOTAL_LOGIN_COUNT as C  from CONNECTED_DEVICE where  "
                        + " TO_CHAR(time_connected,'mm-dd-yy') =TO_CHAR(SYSDATE,'mm-dd-yy')    and time_connected between  SYSDATE - INTERVAL '5' HOUR  and  SYSDATE  )       order by  T   asc";

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
                        + " from logs where TIMESTAMP between  SYSDATE - INTERVAL '24' HOUR  and  SYSDATE  "
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

    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.getMessage());

    }
    out.print(obj);
    out.flush();

%>