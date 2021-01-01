
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
    try {

        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        if (peReportInput.getReportId().equalsIgnoreCase("RPT_LOGINSTATISTICS")) {
            com.info.wifi.rad.entity.controller.GenericJpaController radFacade = new com.info.wifi.rad.entity.controller.GenericJpaController();

            String dateRange = "'" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                        .split(UIConstants.DATE_SEPRATOR)[0],
                        DateHelper.DATE_TYPE.BEGIN) + "' and '" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "'";

            String condition = " where  l.status_type='Start'  and";
            condition = condition + "   TO_CHAR(l.timestamp,'yyyy-MM-dd HH24:MI:SS') between " + dateRange + "  and";

            if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
                condition = condition + "  l.location_id ='" + peReportInput.getVlanId() + "'  and";
            }

            if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
                condition = condition + "  l.owner_name ='" + peReportInput.getOwnerName() + "'  and";
            }

            if (!StringHelper.isNullOrEmpty(condition)) {
                condition = condition.substring(0, condition.length() - 3);

            }
            String DBTable = "logs";
            if (peReportInput.isExpired()) {
                DBTable = "logs_expired";
            }
                String SQL = "select   TO_CHAR(l.timestamp, 'HH24:AM') as loginHour , count(*), count(distinct(mobileno)) from "
                        + "" + DBTable + " l  " + condition + "   group by  TO_CHAR(l.timestamp, 'HH24:AM')   "
                        + "   order by TO_CHAR(l.timestamp, 'HH24:AM') asc";
                List list = radFacade.getAggDynamicReport(SQL);
                StringBuilder categories = new StringBuilder();
                StringBuilder series0 = new StringBuilder();
                StringBuilder series1 = new StringBuilder();
                StringBuilder table = new StringBuilder();
                Integer count = 0, uncount = 0;
                if (list != null && list.size() > 0) {

                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);
                    categories.append("'").append(data[0]).append("',");
                    series0.append("").append(data[1]).append(",");
                    series1.append("").append(data[2]).append(",");
                    table.append("<tr><td>").append(j + 1).append("</td>")
                                .append("<td>").append(peReportInput.getDaterange()).append("</td>")
                                .append("<td>").append(peReportInput.getOwnerName()).append("</td>")
                                .append("<td>").append(peReportInput.getVlanId()).append("</td>")
                                .append("<td>").append(peReportInput.getDurationType()).append("</td>")
                                .append("<td>").append(data[1].toString()).append("</td>")
                                .append("<td>").append(data[2].toString()).append("</td></tr>");

                    count = count + Integer.parseInt(data[1].toString());

                    uncount = uncount + Integer.parseInt(data[2].toString());

                }
                table.append("<tr><td>").append("&nbsp").append("</td>")
                            .append("<td>").append("&nbsp").append("</td>")
                            .append("<td>").append("&nbsp").append("</td>")
                            .append("<td>").append(peReportInput.getVlanId()).append("</td>")
                            .append("<td> <b>").append("Total").append("</b></td>")
                            .append("<td><b>").append(count).append("</b></td>")
                            .append("<td><b>").append(uncount).append("</b></td></tr>");
            }

            StringBuilder datatable = new StringBuilder("<table class=\"table table-bordered\" style=\"text-align: center\" >")
                        .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>Date</th><th style='text-align:center'>Businesss Owner</th> <th style='text-align:center'>Vlan</th> <th style='text-align:center'>Filter</th> <th style='text-align:center'>Activation</th><th style='text-align:center'>Unique Activation</th> </tr> </thead>")
                        .append(" <tbody>")
                        .append(table.toString())
                        .append(" </tbody>  </table>");
                obj.put("categories", "[" + categories + "]");
                obj.put("seriestable", "[" + series0 + "]");
                obj.put("seriestable1", "[" + series1 + "]");
                obj.put("seriestabletotal", peReportInput.isExpired());
                obj.put("datatable", datatable.toString());
        }
    } catch (Exception ex) {
        String s = ex.getMessage();

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
