
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

        String condition = " where  l.status_type='Stop'  and   l.INPUT_OCTETS >0 and";
        condition = condition + " l.timestamp between " + dateRange + "  and";

        if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
            condition = condition + "  l.location_id ='" + peReportInput.getVlanId() + "'  and";
                }

        if (!StringHelper.isNullOrEmpty(peReportInput.getUsername())) {
            condition = condition + "  l.Username like '%" + peReportInput.getUsername() + "%'  and";
                }

        if (!StringHelper.isNullOrEmpty(peReportInput.getMacadds())) {
                condition = condition + "  l.MAC_ADDR like '%" + peReportInput.getMacadds() + "%'  and";
            }

                if (!StringHelper.isNullOrEmpty(peReportInput.getMobile())) {
                    condition = condition + "  l.MOBILENO like '%" + peReportInput.getMobile() + "%'  and";
                }

        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
            condition = condition + "  l.owner_name ='" + peReportInput.getOwnerName() + "'  and";
                    String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());
                    condition = condition + " l.location_id in (" + vlans + ")" + "  and";
                }

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

        if (peReportInput.getDurationType().equalsIgnoreCase("DAILY")) {
            dateFormat = "'MON-DD-YY'";
            SQL = "select    username,mobileno ,mac_addr,  TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                        + "" + DBTable + " l  " + condition + "   group by  username,mobileno ,mac_addr, TO_CHAR(l.timestamp," + dateFormat + ")   "
                        + "   order by   (sum(l.INPUT_OCTETS))/(1024*1024)  desc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("MONTHLY")) {
            dateFormat = "'MON-YY'";
            SQL = "select    username,mobileno ,mac_addr,  TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                        + "" + DBTable + " l  " + condition + "   group by  username,mobileno ,mac_addr, TO_CHAR(l.timestamp," + dateFormat + ")   "
                        + "   order by   (sum(l.INPUT_OCTETS))/(1024*1024)  desc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("WEEKLY")) {
            dateFormat = "'DAY'";
            SQL = "select    username,mobileno ,mac_addr,  TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                        + "" + DBTable + " l  " + condition + "   group by  username,mobileno ,mac_addr, TO_CHAR(l.timestamp," + dateFormat + ")   "
                        + "   order by   (sum(l.INPUT_OCTETS))/(1024*1024)  desc";

        }

        if (peReportInput.getDurationType().equalsIgnoreCase("YEARLY")) {
            dateFormat = "'YYYY'";
            SQL = "select  username,  mobileno ,mac_addr,  TO_CHAR(l.timestamp, " + dateFormat + ") as loginHour , (sum(l.INPUT_OCTETS))/(1024*1024), (sum(l.OUTPUT_OCTETS))/(1024*1024), min(l.timestamp)  from "
                        + "" + DBTable + " l  " + condition + "   group by username, mobileno ,mac_addr, TO_CHAR(l.timestamp," + dateFormat + ")   "
                        + "   order by  (sum(l.INPUT_OCTETS))/(1024*1024) desc";

        }

        String countSql = "select   count(*) from (" + SQL + ") temp";
        int countSqlc = radFacade.getCount(countSql);
        System.out.println("TOTAL RECORDS FOUND:" + countSqlc);

        List list = null;
        int limit = 100000;
        if (countSqlc > limit) {
            list = radFacade.getAggDynamicReport(SQL, limit);
            System.out.println("TOTAL RECORDS FETCHED LIMIT:" + list.size());
            system_message = "Dear User \n We found " + countSqlc
                            + " records, we can show only max " + limit + " records to avoid the browser crash. "
                            + "Please narrow down your search condition to find all records";
                } else {
                    list = radFacade.getAggDynamicReport(SQL);
                }

        if (list != null && list.size() > 0) {
            int recordCount = list.size();
            System.out.println("TOTAL RECORDS FETCHED:" + recordCount);

            for (int j = 0; j < recordCount; j++) {
                Object[] data = (Object[]) list.get(j);

                if (cypher > 0 && j < cypher) {
                    categories.append("'").append(data[0] == null ? "NA" : data[0]).append("',");
                    series0.append("").append(String.format("%.2f", Double.parseDouble((data[4] == null ? "0" : data[4].toString())) / 1)).append(",");
                    series1.append("").append(String.format("%.2f", Double.parseDouble((data[5] == null ? "0" : data[5].toString())) / 1)).append(",");
                }
                if (cypher == 0) {
                    categories.append("'").append(data[0] == null ? "NA" : data[0]).append("',");
                    series0.append("").append(String.format("%.2f", Double.parseDouble((data[4] == null ? "0" : data[4].toString())) / 1)).append(",");
                    series1.append("").append(String.format("%.2f", Double.parseDouble((data[5] == null ? "0" : data[5].toString())) / 1)).append(",");

                }

                table.append("<tr><td>").append(j + 1).append("</td>");
                table.append("<td>").append(data[0].toString()).append("</td>");

                table.append("<td>").append(data[1].toString()).append("</td>");

                table.append("<td>").append(data[2].toString()).append("</td>")
                            .append("<td>").append(peReportInput.getOwnerName()).append("</td>");

                table.append("<td>").append(data[3].toString()).append("</td>");

                count = count + Double.parseDouble(data[4] == null ? "0" : data[4].toString());
                uncount = uncount + Double.parseDouble(data[5] == null ? "0" : data[5].toString());

                table.append("<td>").append(peReportInput.getVlanId()).append("</td>")
                            .append("<td>").append(peReportInput.getDurationType()).append("</td>")
                            .append("<td>").append(String.format("%.2f", Double.parseDouble((data[4] == null ? "0" : data[4].toString())) / 1))
                            .append("</td>")
                            .append("<td>").append(String.format("%.2f", Double.parseDouble((data[5] == null ? "0" : data[5].toString())) / 1)).append("</td>")
                            .append("<td>").append(String.format("%.2f", (Double.parseDouble(data[4] == null ? "0" : data[4].toString()) + Double.parseDouble(data[4] == null ? "0" : data[5].toString()) + 1) / 1024)).append("</td>").append("</tr>");

            }
            table.append("<tr><td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td> <b>").append("Total(MB)").append("</b></td>")
                        .append("<td><b>").append(String.format("%.2f", count / 1)).append("</b></td>")
                        .append("<td><b>").append(String.format("%.2f", uncount / 1)).append("</b></td>")
                        .append("<td>").append("&nbsp").append("</td>").append("</tr>");

            table.append("<tr><td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td>").append("&nbsp").append("</td>")
                        .append("<td> <b>").append("Total(GB)").append("</b></td>")
                        .append("<td><b>").append(String.format("%.2f", count / 1024)).append("</b></td>")
                        .append("<td><b>").append(String.format("%.2f", uncount / 1024)).append("</b></td>")
                        .append("<td>").append("&nbsp").append("</td>").append("</tr>");

        }

        datatable = new StringBuilder("<table id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center\" >")
                    .append("<thead><tr> <th style='text-align:center' >#</th><th style='text-align:center'>User</th><th style='text-align:center'>Mobile</th><th style='text-align:center'>MAC</th><th style='text-align:center'>Businesss Owner</th> <th style='text-align:center'>Duration</th> <th style='text-align:center'>Vlan</th> <th style='text-align:center'>Filter</th> <th style='text-align:center'>Download(MB)</th><th style='text-align:center'>Upload(MB)</th> <th style='text-align:center'>Total(GB)</th> </tr> </thead>")
                    .append(" <tbody>")
                    .append(table.toString())
                    .append(" </tbody>  </table>");

        obj.put("categories", "[" + categories + "]");
        obj.put("seriestable", "[" + series0 + "]");
        obj.put("seriestable1", "[" + series1 + "]");
        obj.put("seriestabletotal", peReportInput.isExpired());
        obj.put("datatable", datatable.toString());
        obj.put("system_message", system_message);

    } catch (Exception ex) {
        System.out.print(ex);
        obj.put("system_message", "The system failed to find the data , please chnage the search condition or contact admin:" + ex.getMessage());
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
