
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
<%@page import="com.info.wifi.cms.entity.UserType"%>
<%@page import="org.eclipse.persistence.annotations.BatchFetchType"%>
<%@page import="com.info.wifi.cms.entity.Prepaidbatch"%>
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
    Logger logger = Logger.getLogger("JsonHotspot");

    String system_message = "";
    try {
        SysUsers user = (SysUsers) session.getAttribute("Users");
        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        com.info.wifi.cms.entity.controller.GenericJpaController smsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String condition = " ";

        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName())) {
            condition = condition + "  c.OWNER_NAME like '%" + peReportInput.getOwnerName() + "%'  and";
        }

        if (!StringHelper.isNullOrEmpty(peReportInput.getStatus())) {
            condition = condition + "  c.UAM_TYPE like '%" + peReportInput.getStatus() + "%'  and";
        }

        if (!StringHelper.isNullOrEmpty(peReportInput.getMobile())) {
            condition = condition + "  c.mobile_no like '%" + peReportInput.getMobile() + "%'  and";
        }

        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
            condition = condition + " c.OWNER_NAME ='" + peReportInput.getOwnerName() + "'  and";

        }

        if (!StringHelper.isNullOrEmpty(condition)) {
            condition = "  where " + condition.substring(0, condition.length() - 3);
        }

        StringBuilder table = new StringBuilder();

        String SQL = "";
        StringBuilder datatable = new StringBuilder();
        SQL = " select * from  hotspot_owner c " + condition + " ";


        List list = null;
        list = smsFacade.getAggDynamicReport(SQL + " order by c.owner_name asc");

        if (list != null && list.size() > 0) {
            int recordCount = list.size();
            System.out.println("TOTAL RECORDS FETCHED:" + recordCount);

            for (int j = 0; j < recordCount; j++) {
                Object[] data = (Object[]) list.get(j);

                table.append("<tr><td>").append(j + 1).append("</td>");
                String link = "#";
                String iSQL = "select  v.group_name, u.IMG_ENG1_NAME  from UAM_TEMPLATE_OWNER u, vlan_group v  where  u.BUSINESS_OWNER=v.OWNER_NAME and    u.BUSINESS_OWNER='" + data[1].toString() + "'";
                    List lis = new GenericJpaController().getAggDynamicReport(iSQL);
                    if (lis != null && lis.size() > 0) {
                        Object[] dataLink = (Object[]) lis.get(0);
                        if (dataLink[1] != null) {
                            link = "'http://212.72.4.47:8080/wifi/Owners/" + data[1].toString().toString().replace(" ", "") + "/" + dataLink[0].toString().replace(" ", "") + "/" + dataLink[1].toString() + "'";
                        }
                    }

                table.append("<td>").append("<img src=" + link + " alt=\"Logo\" width=\"50%\" height=\"50%\">")
                            .append("</td>");

                table.append("<td>").append("<span class='label btn-blue'>&nbsp;"
                            + data[1].toString() + "</span> <br/>" + (data[18] == null ? "" : data[18])
                            + " <br/>" + (data[17] == null ? "" : data[17])
                    ).append("</td>");

                table.append("<td>").append((data[13] == null ? "" : data[13].toString().equalsIgnoreCase("A") ? "Active" : "In-Active"))
                            .append("</td>");

                table.append("<td>").append((data[30] == null ? "" : data[30].toString())).append("</td>");

                table.append("<td>").append((data[31] == null ? "" : data[31].toString())).append("</td>");
                String type = "";
                if (data[32].toString().endsWith("FX")) {
                    type = "Fixed Template";

                }
                if (data[32].toString().endsWith("DY")) {
                    type = "Dynamic Template";

                }
                if (data[32].toString().endsWith("OF")) {
                    type = "Offloading";

                }

                table.append("<td>").append(type).append("</td>");
                table.append("<td>").append((data[33] == null ? "" : data[33].toString())).append("</td>");

                table.append("<td>").append((data[41] == null ? "" : data[41].toString())).append("</td>");

                table.append("<td>").append((data[42] == null ? "" : data[42].toString())).append("</td>");
                table.append("<td>").append((data[5] == null ? "" : data[5].toString()) + "<br>" + (data[6] == null ? "" : data[6].toString())).append("</td>");

                table.append("</tr>");

            }

        }

        datatable = new StringBuilder("<table id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center\" >")
                    .append("<thead><tr> <th style='text-align:center' >#</th> <th style='text-align:center' >Logo</th>   <th style='text-align:center; width:200px'>Customer(Hotspot)</th>"
                            + "<th style='text-align:center'>Status</th>"
                            + "<th style='text-align:center'>Prefix</th> <th style='text-align:center'>Single Login?</th> <th style='text-align:center'>Template Type</th> "
                            + "<th style='text-align:center'>UAM Type</th> <th style='text-align:center'>Cards Seq</th>"
                            + "<th style='text-align:center'>First Login</th> <th style='text-align:center'>Created By</th> </tr> </thead>")
                    .append(" <tbody>")
                    .append(table.toString())
                    .append(" </tbody>  </table>");

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
