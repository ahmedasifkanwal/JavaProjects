
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
        if (peReportInput.getReportId().equals("RPT_SYSTEM_DATA")) {
                p = Runtime.getRuntime().exec("df");
                BufferedReader br = new BufferedReader(
                            new InputStreamReader(p.getInputStream()));
                    while ((s = br.readLine()) != null) {
                        rsslt = rsslt + "</br>" + s;
                        System.out.println("line: " + s);

                }

                p.waitFor();
                System.out.println("exit: " + p.exitValue());
                p.destroy();
                obj.put("system", rsslt);
            }

            if (peReportInput.getReportId().equals("RPT_MAP_LOCATIONS")) {
                List<Vlan> listv = new VlanJpaController().findVlanEntities();
                String json = "";
                for (int j = 0; j < listv.size(); j++) {
                    Vlan vlan = listv.get(j);
                    if (vlan.getStatus() == 'A' && !StringHelper.isNullOrEmpty(vlan.getGpsLatitude())
                                && !StringHelper.isNullOrEmpty(vlan.getGpsLongitude())) {
                        json = json + "  [ " + vlan.getGpsLatitude() + "," + vlan.getGpsLongitude() + ", '" + vlan.getVlanName() + "@" + vlan.getHotspotOwner() + "'] , ";

                    }
                        }

                obj.put("locations", "[['Lat', 'Long', 'Name']," + json
                 + "]");
            }
           if (peReportInput.getReportId().equals("RPT_SEARCH_COMPLAINT")) {
                String dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                            .split(UIConstants.DATE_SEPRATOR)[0],
                            DateHelper.DATE_TYPE.BEGIN) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                            + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "','yyyy-MM-dd HH24:MI:SS')";
                String condition = " where created_on between " + dateRange + "  and";

                if (!StringHelper.isNullOrEmpty(peReportInput.getParam1())) {
                    condition = condition + " customer_name like '%" + peReportInput.getParam1() + "%'  and";
                }
                if (!StringHelper.isNullOrEmpty(peReportInput.getParam2())) {
                    condition = condition + " email like '%" + peReportInput.getParam2() + "%'  and";

                }

                if (!StringHelper.isNullOrEmpty(peReportInput.getMobile())) {
                    condition = condition + " mobile_no like '%" + peReportInput.getMobile() + "%'  and";

                }

                if (!StringHelper.isNullOrEmpty(condition)) {
                    condition = condition.substring(0, condition.length() - 3);
                }
                StringBuilder table = new StringBuilder();

                String SQL = "";
                StringBuilder datatable = new StringBuilder();
                SQL = " select * from complaint " + condition;
                List list = new GenericJpaController().getAggDynamicReport(SQL);

                if (list != null && list.size() > 0) {

                    for (int j = 0; j < list.size(); j++) {
                        Object[] data = (Object[]) list.get(j);
                        table.append("<tr><td>").append(j + 1).append("</td>");
                        table.append("<td>").append((data[1] == null ? "" : data[1].toString())).append("</td>");
                        table.append("<td>").append((data[2] == null ? "" : data[2].toString())).append("</td>");
                            table.append("<td>").append((data[3] == null ? "" : data[3].toString())).append("</td>");
                            table.append("<td>").append((data[4] == null ? "" : data[4].toString())).append("</td>");
                            table.append("<td>").append((data[5] == null ? "" : data[5].toString())).append("</td>");
                            table.append("<td>").append((data[6] == null ? "" : data[6].toString())).append("</td>");
                            table.append("<td>").append((data[7] == null ? "" : data[7].toString())).append("</td>");

                        table.append("</tr>");

                    }

                }
                datatable = new StringBuilder("<table aria-describedby=\"datatable_info\" class=\"table table-striped table-bordered table-hover\" id=\"datatable\" style=\"text-align: center\">")
                            .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>Customer</th><th style='text-align:center'>Reported On</th><th style='text-align:center'>By</th> <th style='text-align:center'>Message</th>"
                                    + " <th style='text-align:center'>Nationality</th> <th style='text-align:center'>Email</th><th style='text-align:center'>Mobile</th> </tr> </thead>")
                            .append(" <tbody>")
                            .append(table.toString())
                            .append(" </tbody>   </table> ");
                    obj.put("datatable", datatable.toString());
            }
        } catch (Exception ex) {

        }

        out.print(obj);
        out.flush();

    } catch (Exception ex) {
        out.println(ex.getMessage());
    }

%>