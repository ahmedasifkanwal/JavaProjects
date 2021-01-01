<%
    //SN#                 CR#                 Modified By         Modified On           Remarks
    // 1                  JWiFi002               Asif              15-Aug-2017          changing vlan code and adding in Query  

%>
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
<%    JSONObject obj = new JSONObject();
    obj = new JSONObject();
    Logger logger = Logger.getLogger("Loginstatistics");
    int cypher = 0;
    try {
        SysUsers user = (SysUsers) session.getAttribute("Users");
        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        cypher = Integer.parseInt(peReportInput.getFilterCode());
        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        com.info.wifi.rad.entity.controller.GenericJpaController radFacade = new com.info.wifi.rad.entity.controller.GenericJpaController();

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                .split(UIConstants.DATE_SEPRATOR)[0],
                DateHelper.DATE_TYPE.BEGIN) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "','yyyy-MM-dd HH24:MI:SS')";

        String condition = " where  l.status_type='Stop'  and";
        condition = condition + "  l.timestamp between " + dateRange + "  and";

        /*              if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
                condition = condition + "  l.location_id ='" + peReportInput.getVlanId() + "'  and";
            }*/
        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
            condition = condition + "  l.owner_name ='" + peReportInput.getOwnerName() + "'  and";
            //    String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());
            //   condition = condition + " l.location_id in (" + vlans + ")" + "  and";
        }

        //CR# JWiFi002 Begin
        peReportInput.setVlanId(peReportInput.getVlanId().replace("'null'", "").replace("'", ""));
        if (peReportInput.getVlanId().startsWith(",")) {
            peReportInput.setVlanId(peReportInput.getVlanId().substring(1, peReportInput.getVlanId().length()));
        }

        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && peReportInput.getVlanId().equals("")) {
            String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());
            condition = condition + "  l.location_id in (" + vlans + ")" + "  and";
        } else if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId())) {
            condition = condition + "  l.location_id in (" + peReportInput.getVlanId() + ")" + "  and";
        }

        //End
        if (!StringHelper.isNullOrEmpty(condition)) {
            condition = condition.substring(0, condition.length() - 3);
        }
        String DBTable = "logs";
        if (peReportInput.isExpired()) {
            DBTable = "logs_expired";
        }
        StringBuilder categories = new StringBuilder();
        StringBuilder series0 = new StringBuilder();
        StringBuilder series1 = new StringBuilder();
        StringBuilder table = new StringBuilder();
        double count = 0, uncount = 0;
        String dateFormat = "'HH24:AM'", SQL = "";
        StringBuilder datatable = new StringBuilder();
        if (peReportInput.getDurationType().equalsIgnoreCase("HOURLY")) {
            dateFormat = "'HH24:AM'";
            SQL = "select   TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024) from "
                    + "" + DBTable + " l  " + condition + "   group by  TO_CHAR(l.timestamp," + dateFormat + ")   "
                    + "   order by TO_CHAR(l.timestamp, " + dateFormat + ") asc";
        }
        if (peReportInput.getDurationType().equalsIgnoreCase("DAILY")) {
            dateFormat = "'MON-DD-YY'";
            SQL = "select   TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                    + "" + DBTable + " l  " + condition + "   group by  TO_CHAR(l.timestamp," + dateFormat + ")   "
                    + "   order by  min(l.timestamp)  asc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("MONTHLY")) {
            dateFormat = "'MON-YY'";
            SQL = "select   TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                    + "" + DBTable + " l  " + condition + "   group by  TO_CHAR(l.timestamp," + dateFormat + ")   "
                    + "   order by  min(l.timestamp)  asc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("WEEKLY")) {
            dateFormat = "'DAY'";
            SQL = "select   TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour ,  (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024)  from "
                    + "" + DBTable + " l  " + condition + "   group by  TO_CHAR(l.timestamp," + dateFormat + ")   "
                    + "   order by  min(l.timestamp)  asc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("LOCATION")) {

            SQL = "select   l.LOCATION_ID , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024)  from "
                    + "" + DBTable + " l  " + condition + "   group by   l.LOCATION_ID order by count(*) DESC";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("OWNER")) {

            SQL = "select   l.OWNER_NAME , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024)  from "
                    + "" + DBTable + " l  " + condition + "   group by   l.OWNER_NAME order by count(*) DESC";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("YEARLY")) {
            dateFormat = "'YYYY'";
            SQL = "select   TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour ,(sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                    + "" + DBTable + " l  " + condition + "   group by  TO_CHAR(l.timestamp," + dateFormat + ")   "
                    + "   order by  min(l.timestamp)  asc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("COUNTRY")) {

            SQL = "select    c.COUNTRY_NAME  as country ,(sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                    + "" + DBTable + " l ,country c " + condition + "  and c.COUNTRY_CODE=l.COUNTRY_CODE group by   c.COUNTRY_NAME   "
                    + "   order by  (sum(l.INPUT_OCTETS))/(1024*1024) desc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("968")) {

            SQL = "select    c.COUNTRY_NAME  as country ,(sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                    + "" + DBTable + " l ,country c " + condition + "  and c.COUNTRY_CODE=l.COUNTRY_CODE and l.COUNTRY_CODE not in ('" + peReportInput.getDurationType() + "') group by   c.COUNTRY_NAME   "
                    + "   order by  (sum(l.INPUT_OCTETS))/(1024*1024) desc";

        }

        List list = radFacade.getAggDynamicReport(SQL);

        if (list != null && list.size() > 0) {

            for (int j = 0; j < list.size(); j++) {
                Object[] data = (Object[]) list.get(j);

                if (cypher > 0 && j < cypher) {
                    categories.append("'").append(data[0] == null ? "NA" : data[0]).append("',");
                    series0.append("").append(String.format("%.2f", Double.parseDouble((data[1].toString())) / 1024)).append(",");
                    series1.append("").append(String.format("%.2f", Double.parseDouble((data[2].toString())) / 1024)).append(",");
                }
                if (cypher == 0) {
                    categories.append("'").append(data[0] == null ? "NA" : data[0]).append("',");
                    series0.append("").append(String.format("%.2f", Double.parseDouble((data[1].toString())) / 1024)).append(",");
                    series1.append("").append(String.format("%.2f", Double.parseDouble((data[2].toString())) / 1024)).append(",");

                }

                table.append("<tr><td>").append(j + 1).append("</td>")
                        .append("<td>").append(peReportInput.getDaterange()).append("</td>");

                if (peReportInput.getDurationType().equalsIgnoreCase("LOCATION")) {
                    Vlan vlan = ReferenceData.getVlan(data[0].toString());
                    String vlan1 = (vlan == null ? "" : vlan.getVlanName());
                    String owner1 = (vlan == null ? "" : vlan.getHotspotOwner());

                    table.append("<td>").append(vlan1).append("</td>")
                            .append("<td>").append(owner1).append("</td>")
                            .append("<td>").append(vlan1).append("</td>");

                } else {
                    table.append("<td>").append(data[0].toString()).append("</td>")
                            .append("<td>").append(peReportInput.getOwnerName()).append("</td>")
                            .append("<td>").append(peReportInput.getVlanId()).append("</td>");

                }

                table.append("<td>").append(peReportInput.getDurationType()).append("</td>")
                        .append("<td>").append(String.format("%.2f", Double.parseDouble((data[1].toString())) / 1024))
                        .append("</td>")
                        .append("<td>").append(String.format("%.2f", Double.parseDouble((data[2].toString())) / 1024)).append("</td></tr>");

                count = count + Double.parseDouble(data[1].toString());

                uncount = uncount + Double.parseDouble(data[2].toString());

            }
            table.append("<tr><td>").append("&nbsp").append("</td>")
                    .append("<td>").append("&nbsp").append("</td>")
                    .append("<td>").append("&nbsp").append("</td>")
                    .append("<td>").append("&nbsp").append("</td>")
                    .append("<td>").append(peReportInput.getVlanId()).append("</td>")
                    .append("<td> <b>").append("Total").append("</b></td>")
                    .append("<td><b>").append(String.format("%.2f", count / 1024)).append("</b></td>")
                    .append("<td><b>").append(String.format("%.2f", uncount / 1024)).append("</b></td></tr>");
        }

        datatable = new StringBuilder("<table id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center\" >")
                .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>Date</th><th style='text-align:center'>Filter Value</th><th style='text-align:center'>Businesss Owner</th> <th style='text-align:center'>Vlan</th> <th style='text-align:center'>Filter</th> <th style='text-align:center'>Download(GB)</th><th style='text-align:center'>Upload(GB)</th> </tr> </thead>")
                .append(" <tbody>")
                .append(table.toString())
                .append(" </tbody>  </table>");

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
