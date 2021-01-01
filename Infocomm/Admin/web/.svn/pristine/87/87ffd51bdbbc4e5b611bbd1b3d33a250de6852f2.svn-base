
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.info.cms.action.MyActionSupport"%>
<%@page import="com.info.wifi.cms.entity.Vlan"%>
<%@page import="com.info.cms.facade.ReferenceData"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
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
    Logger logger = Logger.getLogger("Loginstatistics");
    int cypher = 0;
        String system_message = "";
    try {

        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        cypher = Integer.parseInt(peReportInput.getFilterCode());
        SysUsers user = (SysUsers) session.getAttribute("Users");
        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                    .split(UIConstants.DATE_SEPRATOR)[0],
                    DateHelper.DATE_TYPE.BEGIN) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                    + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "','yyyy-MM-dd HH24:MI:SS')";

        String condition = " where ";
            condition = condition + "   l.date_created   between " + dateRange + "  and";

        if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
            condition = condition + "  l.VLAN ='" + peReportInput.getVlanId() + "'  and";
        }
        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
            condition = condition + "  l.OWNER_NAME ='" + peReportInput.getOwnerName() + "'  and";
                String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());
                condition = condition + " l.vlan in (" + vlans + ")" + "  and";
        }

        if (!StringHelper.isNullOrEmpty(condition)) {
            condition = condition.substring(0, condition.length() - 3);
        }
        String DBTable = "PREPAIDCARD";
        if (peReportInput.isExpired()) {
            DBTable = "PREPAIDCARD_EXPIRED";
        }
        StringBuilder categories = new StringBuilder();
        StringBuilder series0 = new StringBuilder();
        StringBuilder series1 = new StringBuilder();
        StringBuilder table = new StringBuilder();
        Integer count = 0, uncount = 0;
        String dateFormat = "'HH24:AM'", SQL = "";
        StringBuilder datatable = new StringBuilder();

        if (peReportInput.getDurationType().equalsIgnoreCase("HOURLY")) {
            dateFormat = "'HH24:AM'";

            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   TO_CHAR(l.date_created," + dateFormat + ") as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc) TBL_ACTIVATION,"
                        + " (select   TO_CHAR(l.date_created, " + dateFormat + ") as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc)"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR";

        }
        
        // Chnage By Asif
         if (peReportInput.getDurationType().equalsIgnoreCase("HOURLYINTER")) {
            dateFormat = "'HH24:AM'";

            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   TO_CHAR(l.date_created," + dateFormat + ") as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null  and l.COUNTRY_CODE not in ('968') "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc) TBL_ACTIVATION,"
                        + " (select   TO_CHAR(l.date_created, " + dateFormat + ") as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null  and l.COUNTRY_CODE not in ('968') "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc)"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR";

        }
        
        //

        if (peReportInput.getDurationType().equalsIgnoreCase("DAILY")) {
            dateFormat = "'MON-DD-YY'";
            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   TO_CHAR(l.date_created," + dateFormat + ") as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc) TBL_ACTIVATION,"
                        + " (select   TO_CHAR(l.date_created, " + dateFormat + ") as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc)"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("MONTHLY")) {
            dateFormat = "'MON-YY'";
            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   TO_CHAR(l.date_created," + dateFormat + ") as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc) TBL_ACTIVATION,"
                        + " (select   TO_CHAR(l.date_created, " + dateFormat + ") as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc)"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR";
        }

        if (peReportInput.getDurationType().equalsIgnoreCase("WEEKLY")) {
            dateFormat = "'DAY'";
            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   TO_CHAR(l.date_created," + dateFormat + ") as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc) TBL_ACTIVATION,"
                        + " (select   TO_CHAR(l.date_created, " + dateFormat + ") as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc)"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("LOCATION")) {

            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   l.vlan as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  l.vlan ) TBL_ACTIVATION,"
                        + " (select   l.vlan as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  l.vlan )"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR  order by TBL_ACTIVATION.ACTIVATION desc ";
        }

        if (peReportInput.getDurationType().equalsIgnoreCase("OWNER")) {

            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   l.OWNER_NAME as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  l.OWNER_NAME ) TBL_ACTIVATION,"
                        + " (select   l.OWNER_NAME as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  l.OWNER_NAME )"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR  order by TBL_ACTIVATION.ACTIVATION desc ";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("COUNTRY")) {

    SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select    c.COUNTRY_NAME  as LOGIN_HOUR , count(1) as  ACTIVATION "
            + " from " + DBTable + " l,  country c " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
            + " and c.COUNTRY_CODE=l.COUNTRY_CODE  group by   c.COUNTRY_NAME  ) TBL_ACTIVATION,"
            + " (select   c.COUNTRY_NAME  as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
            + " from " + DBTable + " l ,country c " + condition + "  and l.DATE_Activated  is not null "
            + " and c.COUNTRY_CODE=l.COUNTRY_CODE  group by   c.COUNTRY_NAME  )"
            + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR  order by TBL_ACTIVATION.ACTIVATION desc ";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("968")) {

            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select    c.COUNTRY_NAME  as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l,  country c " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " and c.COUNTRY_CODE=l.COUNTRY_CODE and l.COUNTRY_CODE not in ('968') group by   c.COUNTRY_NAME  ) TBL_ACTIVATION,"
                        + " (select   c.COUNTRY_NAME  as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l ,country c " + condition + "  and l.DATE_Activated  is not null "
                        + " and c.COUNTRY_CODE=l.COUNTRY_CODE  and l.COUNTRY_CODE not in ('968') group by   c.COUNTRY_NAME  )"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR  order by TBL_ACTIVATION.ACTIVATION desc ";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("YEARLY")) {
            dateFormat = "'YYYY'";
            SQL = " select TBL_ACTIVATION.LOGIN_HOUR,TBL_ACTIVATION.ACTIVATION,TBL_LOGIN.LOGIN_ACTIVATION from (select   TO_CHAR(l.date_created," + dateFormat + ") as LOGIN_HOUR , count(1) as  ACTIVATION "
                        + " from " + DBTable + " l   " + condition + "  and l.DATE_VERIFICATION_SENT  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc) TBL_ACTIVATION,"
                        + " (select   TO_CHAR(l.date_created, " + dateFormat + ") as LOGIN_HOUR , count(1) as LOGIN_ACTIVATION "
                        + " from " + DBTable + " l  " + condition + "  and l.DATE_Activated  is not null "
                        + " group by  TO_CHAR(l.date_created," + dateFormat + ") order by TO_CHAR(l.date_created, " + dateFormat + ") asc)"
                        + " TBL_LOGIN where TBL_LOGIN.LOGIN_HOUR = TBL_ACTIVATION.LOGIN_HOUR";
        }
     logger.info("SQL :"+ SQL);
        String countSql = "select   count(*) from (" + SQL + ") temp";
            int countSqlc = cmsFacade.getCount(countSql);
            logger.info("countSql :"+ countSql);
            System.out.println("TOTAL RECORDS FOUND:" + countSqlc);
            List list = null;
            int limit = 100000;
            if (countSqlc > limit) {
                list = cmsFacade.getAggDynamicReport(SQL, limit);
                System.out.println("TOTAL RECORDS FETCHED LIMIT:" + list.size());
                system_message = "Dear User \n We found " + countSqlc
                        + " records, we can show only max " + limit + " records to avoid the browser crash. "
                        + "Please narrow down your search condition to find all records";
            } else {
                list = cmsFacade.getAggDynamicReport(SQL);
            }

            if (list != null && list.size() > 0) {

            for (int j = 0; j < list.size(); j++) {
                Object[] data = (Object[]) list.get(j);
                if (cypher > 0 && j < cypher) {
                    categories.append("'").append(data[0]).append("',");
                    series0.append("").append(data[1]).append(",");
                    series1.append("").append(data[2]).append(",");
                }

                if (cypher == 0) {

                    categories.append("'").append(data[0]).append("',");
                    series0.append("").append(data[1]).append(",");
                    series1.append("").append(data[2]).append(",");
                }

                table.append("<tr><td>").append(j + 1).append("</td>")
                        .append("<td>").append(peReportInput.getDaterange()).append("</td>");

                if (peReportInput.getDurationType().equalsIgnoreCase("LOCATION")) {
                    Vlan vlan = ReferenceData.getVlan(data[0].toString());
                    String vlan1 = (vlan == null ? "" : vlan.getVlanName());
                    String owner1 = (vlan == null ? "" : vlan.getHotspotOwner());

                    table.append("<td>").append(vlan1).append("</td>")
                            .append("<td>").append(owner1).append("</td>");

                } else {
                    table.append("<td>").append(data[0].toString()).append("</td>")
                            .append("<td>").append(peReportInput.getOwnerName()).append("</td>");

                }

                table.append("<td>").append(peReportInput.getVlanId()).append("</td>")
                        .append("<td>").append(peReportInput.getDurationType()).append("</td>")
                        .append("<td>").append(data[1].toString()).append("</td>")
                        .append("<td>").append(data[2].toString()).append("</td></tr>");

                count = count + Integer.parseInt(data[1].toString());

                uncount = uncount + Integer.parseInt(data[2].toString());

            }
            table.append("<tr><td>").append("&nbsp").append("</td>")
                    .append("<td>").append("&nbsp").append("</td>")
                    .append("<td>").append("&nbsp").append("</td>")
                    .append("<td>").append("&nbsp").append("</td>")
                    .append("<td>").append(peReportInput.getVlanId()).append("</td>")
                    .append("<td> <b>").append("Total").append("</b></td>")
                    .append("<td><b>").append(count).append("</b></td>")
                    .append("<td><b>").append(uncount).append("</b></td></tr>");
        }

        datatable = new StringBuilder("<table aria-describedby=\"datatable_info\" class=\"table table-striped table-bordered table-hover\" id=\"datatable\" style=\"text-align: center\">")
                .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>Date</th><th style='text-align:center'>Value</th><th style='text-align:center'>Businesss Owner</th> <th style='text-align:center'>Vlan</th> <th style='text-align:center'>Filter</th> <th style='text-align:center'>SMS Sent</th><th style='text-align:center'>SMS Used</th> </tr> </thead>")
                .append(" <tbody>")
                .append(table.toString())
                .append(" </tbody>   </table> ");

        obj.put("categories", "[" + categories + "]");
        obj.put("seriestable", "[" + series0 + "]");
        obj.put("seriestable1", "[" + series1 + "]");
        obj.put("seriestabletotal", peReportInput.isExpired());
        obj.put("datatable", datatable.toString());

    } catch (Exception ex) {
        System.out.print(ex);
        logger.log(Level.SEVERE, ex.getMessage());

    } finally {
        out.print(obj);
        out.flush();
    }


%>


<%!
    public String doSomething(String param) {
        return null;  //
    }
%>
