
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
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
    Logger logger = Logger.getLogger("JsonLocation");
    try {
        SysUsers user = (SysUsers) session.getAttribute("Users");
        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();
        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String condition = "";
        if (!StringHelper.isNullOrEmpty(peReportInput.getVlanGroupName())) {
                condition = condition + " GROUP_NAME like '%" + peReportInput.getVlanGroupName() + "%'  and";
        }
        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
            condition = condition + "  OWNER_NAME ='" + peReportInput.getOwnerName() + "'  and";
            // String vlans = ReferenceData.getOwnersVlans(peReportInput.getOwnerName());
                    // condition = condition + " VLAN_ID in (" + vlans + ")" + "  and";
                }
        if (!StringHelper.isNullOrEmpty(condition)) {
            condition = " where " + condition.substring(0, condition.length() - 3);
        }
        String DBTable = "VLAN_GROUP";

        StringBuilder table = new StringBuilder();

        String SQL = "";
        StringBuilder datatable = new StringBuilder();
        if (peReportInput.getReportId().equals("RPT_VLAN_GROUP")) {
            SQL = "  select  * from   " + DBTable + " " + condition + " ORDER BY  OWNER_NAME ASC";

            List list = cmsFacade.getAggDynamicReport(SQL);

            if (list != null && list.size() > 0) {

                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);

                    table.append("<tr><td>").append(j + 1).append("</td>");

                        String link = "#";
                        String iSQL = "select  v.group_name, u.IMG_ENG1_NAME  from UAM_TEMPLATE_OWNER u, vlan_group v  where  u.BUSINESS_OWNER=v.OWNER_NAME and    u.BUSINESS_OWNER='" + data[3].toString() + "'";
                        List lis = new GenericJpaController().getAggDynamicReport(iSQL);
                        if (lis != null && lis.size() > 0) {
                            Object[] dataLink = (Object[]) lis.get(0);
                            if (dataLink[1] != null) {
                                link = "'http://212.72.4.47:8080/wifi/Owners/" + data[1].toString().toString().replace(" ", "") + "/" + dataLink[0].toString().replace(" ", "") + "/" + dataLink[1].toString() + "'";
                            }
                        }

                        table.append("<td>").append("<img src=" + link + " alt=\"Logo\" width=\"40%\" height=\"40%\">")
                                .append("</td>");

                        table.append("<td>").append(data[1].toString()).append("</td>")
                                        .append("<td>").append(data[2] == null ? "" : data[2].toString()).append("</td>")
                                                .append("<td>").append(data[3] == null ? "" : data[3].toString()).append("</td>")
                            .append("<td>").append(data[9] == null ? "" : data[9].toString()).append("</td>")
                                    .append("<td>").append(data[4] == null ? "" : data[4].toString()).append("</td>")
                                                   .append("<td>").append(data[5] == null ? "" : data[5].toString()).append("</td>")
                                                 .append("<td>").append(data[6] == null ? "" : data[6].toString()).append("</td>")
                                                             .append("</tr>");

                }
            }

            datatable = new StringBuilder("  <table class=\"table table-striped table-bordered table-hover\" id=\"datatable\">")
                        .append("<thead><tr><th style='text-align:center' >#</th> <th style='text-align:center; width:200px' >Logo</th> <th style='text-align:center'>Group Name</th><th style='text-align:center'>Description</th><th style='text-align:center'>Owner(Customer)</th><th style='text-align:center'>Single Login?</th><th style='text-align:center'>Status</th><th style='text-align:center'>Created By</th><th style='text-align:center'>Created On</th>")
                        .append(" <tbody>")
                        .append(table.toString())
                        .append(" </tbody>  </table>");

            obj.put("datatable", datatable.toString());
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
