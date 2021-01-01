
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="com.info.cms.helper.UIConstants"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.cms.presentation.entity.PeReportInputValue"%>
<%@page import="com.info.cms.helper.StringHelper"%>
<%@page import="com.info.wifi.cms.entity.Vlan"%>
<%@page import="com.info.wifi.cms.entity.controller.VlanJpaController"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    JSONObject obj = new JSONObject();
    try {

        String s;
        Process p;
        String rsslt = "";
        try {

            PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
            if (peReportInput.getReportId().equals("RPT_SEARCH_LI")) {
                String dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                            .split(UIConstants.DATE_SEPRATOR)[0],
                            DateHelper.DATE_TYPE.BEGIN) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                            + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "','yyyy-MM-dd HH24:MI:SS')";

                /*   String   datatable = new StringBuilder("<table aria-describedby=\"datatable_info\" class=\"table table-striped table-bordered table-hover\" id=\"datatable\" style=\"text-align: center\">")
                            .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>Customer</th><th style='text-align:center'>Reported On</th><th style='text-align:center'>By</th> <th style='text-align:center'>Message</th>"
                                    + " <th style='text-align:center'>Nationality</th> <th style='text-align:center'>Email</th><th style='text-align:center'>Mobile</th> </tr> </thead>")
                            .append(" <tbody>")
                            .append(table.toString())
                            .append(" </tbody>   </table> ");*/
                int days = DateHelper.getNoOfDaysInDateRange(peReportInput.getDaterange());
                    if (days > 30) {
                        String message = "Date Difference should not be more than 30 Day";
                        obj.put("system_message", message);
                    }
                    if (peReportInput.getParam1() != null && peReportInput.getParam2() != null) {

                            dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                                    .split(UIConstants.DATE_SEPRATOR)[0],
                                    peReportInput.getParam1()) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                                    + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], peReportInput.getParam2()) + "','yyyy-MM-dd HH24:MI:SS')";


                        obj.put("datatable", dateRange);
                    }

            }
        } catch (Exception ex) {

        }

        out.print(obj);
        out.flush();

    } catch (Exception ex) {
        out.println(ex.getMessage());
    }

%>