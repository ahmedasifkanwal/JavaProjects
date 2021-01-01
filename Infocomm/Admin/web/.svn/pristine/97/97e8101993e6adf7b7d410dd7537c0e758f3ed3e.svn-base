
<%@page import="com.info.wifi.rad.entity.controller.GenericJpaController"%>
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
    Logger logger = Logger.getLogger("JsonOnlineUser");
    int cypher = 0;
    try {
        SysUsers user = (SysUsers) session.getAttribute("Users");
        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        com.info.wifi.rad.entity.controller.GenericJpaController radFacade = new GenericJpaController();

        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();

        cypher = Integer.parseInt(peReportInput.getFilterCode());
        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String condition = "";

        if (!StringHelper.isNullOrEmpty(peReportInput.getVlanId()) && !peReportInput.getVlanId().equals("-1")) {
            condition = condition + " NASPORT in(" + peReportInput.getVlanId() + ")  and";
        }

        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName())) {
            String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());

            condition = condition + " NASPORT in(" + vlans + ")  and";
        }

        if (!StringHelper.isNullOrEmpty(condition)) {
            condition = " where " + condition.substring(0, condition.length() - 3);
        }

        StringBuilder table = new StringBuilder();

        String SQL = "";
        StringBuilder datatable = new StringBuilder();
        StringBuilder categories = new StringBuilder();
        StringBuilder series0 = new StringBuilder();
        StringBuilder series1 = new StringBuilder();
        int recordCount = 0;
        if (peReportInput.getReportId().equals("RPT_ONLINE")) {

            SQL = "  select  NASPORT,count(*)  from RADONLINE  " + condition + " group by NASPORT    ORDER BY  count(*) DESC";

            List listAg = radFacade.getAggDynamicReport(SQL);
            if (listAg != null && listAg.size() > 0) {

                for (int j = 0; j < listAg.size(); j++) {
                    Object[] data = (Object[]) listAg.get(j);
                    if (cypher > 0 && j < cypher) {
                        categories.append("'").append(data[0]).append("',");
                        series0.append("").append(data[1].toString()).append(",");
                        SQL = " select DEVICE_COUNT from CONNECTED_DEVICE where vlan=" + data[0].toString() + "  order by TIME_CONNECTED desc";
                                String c = cmsFacade.getAggDynamicReport(SQL, 1).toString();
                                series1.append("").append(c).append(",");
                            }

                }
            }

            SQL = "  select  USERNAME, MAC_ADDR,MOBILENO,NASPORT,TIME_STAMP,FRAMEDIPADDRESS as IP  from RADONLINE     " + condition + " ORDER BY  TIME_STAMP DESC";

            List list = radFacade.getAggDynamicReport(SQL);

            if (list != null && list.size() > 0) {
                recordCount = list.size();
                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);

                    table.append("<tr><td>").append(j + 1).append("</td>")
                            .append("<td>").append(data[0].toString()).append("</td>")
                            .append("<td >").append(data[1].toString()).append("</td>")
                            .append("<td>").append(data[2].toString().replace(".", ".<br/>")).append("</td>")
                            .append("<td  >").append(data[3].toString()).append("</td>");
                    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                    String time = dateFormat.format(new java.util.Date((long) Long.parseLong(data[4].toString()) * 1000));
                    table.append("<td >").append(time).append("</td>")
                            .append("<td>").append(data[5] == null ? "NA" : data[5].toString()).append("</td></tr>");

                }
            }

            datatable = new StringBuilder("<table  width=\"70%\"  id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center; \" >")
                        .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>Username</th><th style='text-align:center'>MAC</th><th style='text-align:center;width:30px '>Mobile</th> <th style='text-align:center'>Location</th> <th style='text-align:center'>Login Time</th> <th style='text-align:center'>IP</th> </tr> </thead>")
                        .append(" <tbody>")
                        .append(table.toString())
                        .append(" </tbody>  </table>");
                obj.put("datatable", datatable.toString());
                obj.put("categories", "[" + categories + "]");
                obj.put("series0", "[" + series0 + "]");
                obj.put("categories1", "[" + categories + "]");
                obj.put("series1", "[" + series1 + "]");
                obj.put("recordCount", recordCount);

        }

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
