<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.info.cms.action.MyActionSupport"%>
<%@page import="com.info.wifi.cms.entity.Vlan"%>
<%@page import="com.info.cms.facade.ReferenceData"%>
<%@page import="java.util.List"%>
<%@page import="com.info.cms.report.graph.UIBarChartData"%>
<%@page import="com.info.cms.helper.UIConstants"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="com.info.cms.helper.StringHelper"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.cms.presentation.entity.PeReportInputValue"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    JSONObject obj = new JSONObject();
    obj = new JSONObject();
    Logger logger = Logger.getLogger("JsonConnectedVsLogin");
    String system_message = "";
    try {
        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());

        SysUsers user = (SysUsers) session.getAttribute("Users");
        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade
                    = new com.info.wifi.cms.entity.controller.GenericJpaController();

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                    .split(UIConstants.DATE_SEPRATOR)[0],
                    DateHelper.DATE_TYPE.BEGIN) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                    + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "','yyyy-MM-dd HH24:MI:SS')";

        String condition = " where ";
        condition = condition + "  time_connected   between " + dateRange + "  and";

        if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
            condition = condition + "  VLAN ='" + peReportInput.getVlanId() + "'  and";
        }
        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName())
                    && !peReportInput.getOwnerName().equals("-1")) {

            String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());
            condition = condition + " vlan in (" + vlans + ")" + "  and";
        }
        if (!StringHelper.isNullOrEmpty(condition)) {
            condition = condition.substring(0, condition.length() - 3);
        }
        StringBuilder categories = new StringBuilder();
        StringBuilder series0 = new StringBuilder();
        StringBuilder series1 = new StringBuilder();
        String SQL = "";
        StringBuilder datatable = new StringBuilder();
           if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName())
                    && !peReportInput.getOwnerName().equals("-1")) {
               if(peReportInput.getOwnerName().equals("Mwasalat")){
                SQL = "   select REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) as X, sum(DEVICE_COUNT),sum(LOGIN_COUNT)   from CONNECTED_DEVICE " + condition;
            SQL = SQL + " group by  REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) "
                      + " ORDER BY REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) ASC ";
        
               }else {
            SQL = "   select REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) as X, sum(DEVICE_COUNT),sum(LOGIN_COUNT)   from CONNECTED_DEVICE " + condition;
            SQL = SQL + " group by  REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) "
                      + " ORDER BY REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) ASC ";
               }
           
           }else    if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
              SQL = "   select REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) as X, sum(DEVICE_COUNT),sum(LOGIN_COUNT)   from CONNECTED_DEVICE " + condition;
            SQL = SQL + " group by  REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) "
                      + " ORDER BY REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) ASC ";
     
           
           }else {
        SQL = "select REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) as X, total_connected_count,TOTAL_LOGIN_COUNT   from CONNECTED_DEVICE " + condition;

            SQL = SQL + " group by  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1 , "
                    + " total_connected_count,TOTAL_LOGIN_COUNT ORDER BY REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) ASC ";
           }
        List list = cmsFacade.getAggDynamicReport(SQL);
        if (list != null && list.size() > 0) {

            for (int j = 0; j < list.size(); j++) {
                Object[] data = (Object[]) list.get(j);
                series0.append("").append("[" + data[0] + "," + data[1]).append("],");
                series1.append("").append("[" + data[0] + "," + data[2]).append("],");

            }
        }

            obj.put("seriesActivationComparision0", "[" + series0.toString() + "]");
            obj.put("seriesActivationComparision1", "[" + series1.toString() + "]");
             obj.put("SQL",SQL);
    } catch (Exception ex) {
        System.out.print(ex);
        logger.log(Level.SEVERE, ex.getMessage());

    } finally {
        out.print(obj);
        out.flush();
    }
/*
    SQL = "select REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) as X, total_connected_count,TOTAL_LOGIN_COUNT   from CONNECTED_DEVICE " + condition;

            SQL = SQL + " group by  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1 , "
                    + " total_connected_count,TOTAL_LOGIN_COUNT ORDER BY REPLACE(  concat('Date.UTC', TO_CHAR(time_connected ,'(yyyy,@@,DD,HH24,MI)' )) ,'@@',  EXTRACT(month FROM time_connected)-1) ASC ";
     
    
    */

%>
