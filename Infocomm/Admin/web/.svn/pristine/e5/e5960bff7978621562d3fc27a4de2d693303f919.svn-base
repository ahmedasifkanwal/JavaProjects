
<%@page import="com.info.wifi.cms.entity.Country"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
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
    Logger logger = Logger.getLogger("JsonKioskWifiAccount");
    try {

        SysUsers user = (SysUsers) session.getAttribute("Users");
        PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());
        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();

        ReferenceData.getCountry();

        if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
            peReportInput.setOwnerName(user.getOwner());
        }

        if (session.getAttribute("Users") != null) {
            SysUsers users = (SysUsers) session.getAttribute("Users");
            peReportInput.setLoggedInUser(users.getUsername());
        }

        String dateRange = "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange()
                .split(UIConstants.DATE_SEPRATOR)[0],
                DateHelper.DATE_TYPE.BEGIN) + "','yyyy-MM-dd HH24:MI:SS')" + " and "
                + "to_date('" + DateHelper.getSearchFormated(peReportInput.getDaterange().split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END) + "','yyyy-MM-dd HH24:MI:SS')";

        String condition = " where  date_activated between " + dateRange + "  and owner_name='OAMC' and created_by='KIOSK'  ";

        if (!StringHelper.isNullOrEmpty(peReportInput.getParam1())) {
            condition = condition + " and passport_number like '%" + peReportInput.getParam1() + "%' ";
        }
        if (!StringHelper.isNullOrEmpty(peReportInput.getParam2())) {
            condition = condition + " and issuing_country like '%" + peReportInput.getParam2() + "%' ";
        }
        if (!StringHelper.isNullOrEmpty(peReportInput.getParam2())) {
            condition = condition + " and issuing_country like '%" + peReportInput.getParam2() + "%' ";
        }
        //Business Owner Added For Filter Incase Business Owner Login
        if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
            condition = condition + " and  owner_name ='" + peReportInput.getOwnerName() + "'  ";

        }
        //End

        if (!StringHelper.isNullOrEmpty(peReportInput.getGender())) {
            condition = condition + " and GENDER like '%" + peReportInput.getGender() + "%' ";
        }
        //gender

        String DBTable = "prepaidcard";
        if (peReportInput.isExpired()) {
            DBTable = "prepaidcard_expired";
        }

        StringBuilder table = new StringBuilder();

        String SQL = "";
        StringBuilder datatable = new StringBuilder();

        SQL = "   select username,customer_name,passport_number,date_activated,gender,date_of_birth,date_of_expiry,issuing_country"
                + " from  " + DBTable + "   " + condition + " order by card_id  desc";
        // logger.info("SQL : " + SQL);
        List list = cmsFacade.getAggDynamicReport(SQL);
        int totalCount = 0;
        totalCount = list.size();
        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                Object[] data = (Object[]) list.get(j);
                table.append("<tr><td>").append(j + 1).append("</td>")
                        .append("<td>").append(data[0].toString()).append("</td>")
                        .append("<td  >").append(data[1].toString()).append("</td>")
                        .append("<td >").append(data[2].toString()).append("</td>")
                        .append("<td >").append(data[3].toString()).append("</td>")
                        .append("<td >").append(data[4].toString().equals("M") ? "Male" : "Female").append("</td>")
                        .append("<td>").append(data[5] == null ? "NA" : data[5].toString()).append("</td>")
                        .append("<td>").append(data[6] == null ? "NA" : data[6].toString()).append("</td>");

                Country country = ReferenceData.getNationality(data[7].toString());
                table.append("<td>").append(data[7] == null ? "NA"
                        : (country == null ? data[7].toString() : country.getNationality())).append("</td></tr>");

            }
        }

        datatable = new StringBuilder("<table  width=\"70%\"  id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center; \" >")
                .append("<thead><tr><th style='text-align:center' >#</th><th style='text-align:center'>User Name</th><th style='text-align:center'>Customer Name</th><th style='text-align:center;width:30px '>Passport Number</th> <th style='text-align:center'>Activation Date</th> <th style='text-align:center'>Gender</th> <th style='text-align:center'>Date Of Birth</th><th style='text-align:center'>Date of Expiry</th><th style='text-align:center'>Issue Country</th> </tr> </thead>")
                .append(" <tbody>")
                .append(table.toString())
                .append(" </tbody>  </table>");
        obj.put("datatable", datatable.toString());
        obj.put("totalCount", totalCount);

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
