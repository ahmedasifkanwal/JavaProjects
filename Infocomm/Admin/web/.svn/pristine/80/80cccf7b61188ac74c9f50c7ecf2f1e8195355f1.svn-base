
<%@page import="com.info.cms.facade.SysUsersFacade"%>
<%@page import="com.info.wifi.cms.entity.controller.PrepaidcardJpaController"%>
<%@page import="com.info.wifi.cms.entity.AuditLog"%>
<%@page import="java.math.BigInteger"%>
<%@page import="com.info.cms.helper.PropertyEncoder"%>
<%@page import="com.info.cms.helper.ResourceBundleUtil"%>
<%@page import="com.info.wifi.cms.entity.Msgsent"%>
<%@page import="com.info.wifi.cms.entity.Prepaidcard"%>
<%@page import="java.util.Date"%>
<%@page import="com.info.wifi.cms.entity.controller.PrepaidbatchJpaController"%>
<%@page import="com.info.wifi.cms.util.StringUtil"%>
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

    //com.info.cms.helper
    JSONObject obj = new JSONObject();
    obj = new JSONObject();
    Logger logger = Logger.getLogger("JsonWiFiUserAccount");
    PropertyEncoder propertyEncoder = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("ApplicationResources", null));

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

        if (peReportInput.getReportId().equals("OP_ADD_USER_ACCOUNT")) {

            Prepaidcard prepaidcarde = new PrepaidcardJpaController().getPrepaidcardByUserName(peReportInput.getUsername());
            if (prepaidcarde != null) {
                    system_message = "Username already exist , please create user with another name.";

            } else {
                system_message = valiDateSingleUser(peReportInput, propertyEncoder, user);
                    }
                    obj.put("system_message", system_message);

        }

            if (peReportInput.getReportId().equals("RPT_WIFI_USER_ACCOUNT_IMSI")) {
                String condition = " ";

                if (!StringHelper.isNullOrEmpty(peReportInput.getUsername())) {
                    condition = condition + "  c.Username like '%" + peReportInput.getUsername() + "%'  and";
                }

                if (!StringHelper.isNullOrEmpty(peReportInput.getMacadds())) {
                    condition = condition + "  c.mac_Addr like '%" + peReportInput.getMacadds() + "%'  and";
                }

                if (!StringHelper.isNullOrEmpty(peReportInput.getMobile())) {
                    condition = condition + "  c.mobileno like '%" + peReportInput.getMobile() + "%'  and";
                }

                if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
                    condition = condition + " c.owner_name ='" + peReportInput.getOwnerName() + "'  and";

                }
                if (!StringHelper.isNullOrEmpty(peReportInput.getImsi())) {
                    condition = condition + " c.imsi like  '%" + peReportInput.getImsi() + "%'  and";

                }

                if (!StringHelper.isNullOrEmpty(condition)) {
                    condition = condition.substring(0, condition.length() - 3);
                }
                String DBTable = "prepaidcard";
                if (peReportInput.isExpired()) {
                    DBTable = "prepaidcard_expired";
                }

                StringBuilder table = new StringBuilder();

                String SQL = "";
                StringBuilder datatable = new StringBuilder();

                SQL = "select c.username as username,"
                        + "c.mobileno as mobileno, c.mac_Addr ,c.owner_name,c.date_created as datecreation,c.date_verification_sent as dateverificationsent,"
                        + "c.verification_code,b.expiry_date as expirydate,b.timeleft as batchduration,"
                        + "c.expiry_date as expirydate,b.batch_desc as planDesc,b.user_type as usertype,"
                        + " c.vlan as vlan ,c.blocked as blocked ,c.customer_family_name,c.imsi "
                        + " from prepaidbatch  b,  " + DBTable + " c where c.batch_id=b.batch_id and " + condition;

                String countSql = "select   count(*) from (" + SQL + ") temp";
                int countSqlc = smsFacade.getCount(countSql);
                System.out.println("TOTAL RECORDS FOUND:" + countSqlc);

                List list = null;
                int limit = 100000;
                if (countSqlc > limit) {
                    list = smsFacade.getAggDynamicReport(SQL, limit);
                    System.out.println("TOTAL RECORDS FETCHED LIMIT:" + list.size());
                    system_message = "Dear User \n We found " + countSqlc
                            + " records, we can show only max " + limit + " records to avoid the browser crash. "
                            + "Please narrow down your search condition to find all records";
                } else {
                    list = smsFacade.getAggDynamicReport(SQL + " order by c.date_created desc");
                }

                if (list != null && list.size() > 0) {
                    int recordCount = list.size();
                    System.out.println("TOTAL RECORDS FETCHED:" + recordCount);

                    for (int j = 0; j < recordCount; j++) {
                        Object[] data = (Object[]) list.get(j);

                        table.append("<tr><td>").append(j + 1).append("</td>");
                        table.append("<td>").append(data[0].toString() + "<br><span class='imoon imoon-phone label btn-blue'>&nbsp;"
                                + data[1].toString() + "</span> </br>  "
                                + "<span class='imoon imoon-cog label btn-purple'>&nbsp;"
                                + (data[2] == null ? "" : data[2].toString()) + "</span> ");



                       table.append("<td>").append((data[15] == null ? "" : data[15].toString())).append("</td>");
                           table.append("<td>").append((data[3] == null ? "" : data[3].toString())).append("</td>");

                        table.append("<td>").append((data[4] == null ? "" : data[4].toString())).append("</td>");

                        table.append("<td>").append((data[5] == null ? "" : data[5].toString())).append("</td>");
                        table.append("<td>").append((data[6] == null ? "" : data[6].toString())).append("</td>");

                        table.append("<td>").append((data[10] == null ? "" : data[10].toString()) + "<br>"
                                + (data[7] == null ? "" : data[7].toString()) + "<br>"
                                + (data[8] == null ? "" : data[8].toString())).append("</td>");

                        table.append("<td>").append((data[9] == null ? "" : data[9].toString())).append("</td>");
                        String vlan = "";

                        if (data[12] != null) {
                            Vlan ovla = ReferenceData.getVlan(data[12].toString());
                            vlan = (ovla == null ? data[12].toString() : ovla.getVlanName());

                        }

                        table.append("<td>").append((data[11] == null ? "" : ReferenceData.getUserType(data[11].toString()).getValue())
                                + "</br>" + (data[12] == null ? "" : vlan) + "</br>"
                                + (data[13] == null ? "" : data[13].toString()))
                                .append("</td>");

                        table.append("</tr>");

                    }

                }

                datatable = new StringBuilder("<table id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center\" >")
                        .append("<thead><tr> <th style='text-align:center' >#</th><th style='text-align:center'>User</br>Mobile/MAC</th> <th style='text-align:center'>IMSI</th>"
                                + "<th style='text-align:center'>Business Owner</th>"
                                + "<th style='text-align:center'>Date Created</th> <th style='text-align:center'>Date Verified</th> <th style='text-align:center'>Security Code</th> "
                                + "<th style='text-align:center'>Plan/Expiry</br>Duration(Sec)</th> <th style='text-align:center'>Account Expiry</th>"
                                + "<th style='text-align:center'>User Type/<br>Vlan/Block</th>  </tr> </thead>")
                        .append(" <tbody>")
                        .append(table.toString())
                        .append(" </tbody>  </table>");

                obj.put("datatable", datatable.toString());
                obj.put("system_message", system_message);
            }



        if (peReportInput.getReportId().equals("RPT_WIFI_USER_ACCOUNT")) {
            String condition = " ";

            if (!StringHelper.isNullOrEmpty(peReportInput.getUsername())) {
                condition = condition + "  c.Username like '%" + peReportInput.getUsername() + "%'  and";
            }

            if (!StringHelper.isNullOrEmpty(peReportInput.getMacadds())) {
                condition = condition + "  c.mac_Addr like '%" + peReportInput.getMacadds() + "%'  and";
            }

            if (!StringHelper.isNullOrEmpty(peReportInput.getMobile())) {
                condition = condition + "  c.mobileno like '%" + peReportInput.getMobile() + "%'  and";
            }

            if (!StringHelper.isNullOrEmpty(peReportInput.getOwnerName()) && !peReportInput.getOwnerName().equals("-1")) {
                condition = condition + " c.owner_name ='" + peReportInput.getOwnerName() + "'  and";

            }
                if (!StringHelper.isNullOrEmpty(peReportInput.getImsi())) {
                    condition = condition + " c.imsi like  '%" + peReportInput.getImsi() + "%'  and";

                }

            if (!StringHelper.isNullOrEmpty(condition)) {
                condition = condition.substring(0, condition.length() - 3);
            }
            String DBTable = "prepaidcard";
            if (peReportInput.isExpired()) {
                DBTable = "prepaidcard_expired";
            }

            StringBuilder table = new StringBuilder();

            String SQL = "";
            StringBuilder datatable = new StringBuilder();

            SQL = "select c.username as username,"
                    + "c.mobileno as mobileno, c.mac_Addr ,c.owner_name,c.date_created as datecreation,c.date_verification_sent as dateverificationsent,"
                    + "c.verification_code,b.expiry_date as expirydate,b.timeleft as batchduration,"
                    + "c.expiry_date as expirydate,b.batch_desc as planDesc,b.user_type as usertype,"
                    + " c.vlan as vlan ,c.blocked as blocked ,c.customer_family_name,c.imsi "
                    + " from prepaidbatch  b,  " + DBTable + " c where c.batch_id=b.batch_id and " + condition;

            String countSql = "select   count(*) from (" + SQL + ") temp";
            int countSqlc = smsFacade.getCount(countSql);
            System.out.println("TOTAL RECORDS FOUND:" + countSqlc);

            List list = null;
            int limit = 100000;
            if (countSqlc > limit) {
                list = smsFacade.getAggDynamicReport(SQL, limit);
                System.out.println("TOTAL RECORDS FETCHED LIMIT:" + list.size());
                system_message = "Dear User \n We found " + countSqlc
                                + " records, we can show only max " + limit + " records to avoid the browser crash. "
                                + "Please narrow down your search condition to find all records";
                    } else {
                        list = smsFacade.getAggDynamicReport(SQL + " order by c.date_created desc");
                    }

            if (list != null && list.size() > 0) {
                int recordCount = list.size();
                System.out.println("TOTAL RECORDS FETCHED:" + recordCount);

                for (int j = 0; j < recordCount; j++) {
                    Object[] data = (Object[]) list.get(j);

                    table.append("<tr><td>").append(j + 1).append("</td>");
                    table.append("<td>").append(data[0].toString() + "<br><span class='imoon imoon-phone label btn-blue'>&nbsp;"
                                + data[1].toString() + "</span> </br>  "
                                + "<span class='imoon imoon-cog label btn-purple'>&nbsp;"
                                + (data[2] == null ? "" : data[2].toString()) + "</span>  ").append("</td>");

                    table.append("<td>").append((data[3] == null ? "" : data[3].toString())).append("</td>");


                    table.append("<td>").append((data[4] == null ? "" : data[4].toString())).append("</td>");

                    table.append("<td>").append((data[5] == null ? "" : data[5].toString())).append("</td>");
                    table.append("<td>").append((data[6] == null ? "" : data[6].toString())).append("</td>");

                    table.append("<td>").append((data[10] == null ? "" : data[10].toString()) + "<br>"
                            + (data[7] == null ? "" : data[7].toString()) + "<br>"
                            + (data[8] == null ? "" : data[8].toString())).append("</td>");

                    table.append("<td>").append((data[9] == null ? "" : data[9].toString())).append("</td>");
                    String vlan = "";

                    if (data[12] != null) {
                        Vlan ovla = ReferenceData.getVlan(data[12].toString());
                        vlan = (ovla == null ? data[12].toString() : ovla.getVlanName());

                    }

                    table.append("<td>").append((data[11] == null ? "" : ReferenceData.getUserType(data[11].toString()).getValue())
                            + "</br>" + (data[12] == null ? "" : vlan) + "</br>"
                            + (data[13] == null ? "" : data[13].toString()))
                            .append("</td>");

                               table.append("</tr>");

                }

            }

            datatable = new StringBuilder("<table id=\"datatable\"   class=\"table table-bordered\" style=\"text-align: center\" >")
                    .append("<thead><tr> <th style='text-align:center' >#</th><th style='text-align:center'>User</br>Mobile/MAC</th>"
                            + "<th style='text-align:center'>Business Owner</th>"
                            + "<th style='text-align:center'>Date Created</th> <th style='text-align:center'>Date Verified</th> <th style='text-align:center'>Security Code</th> "
                            + "<th style='text-align:center'>Plan/Expiry</br>Duration(Sec)</th> <th style='text-align:center'>Account Expiry</th>"
                            + "<th style='text-align:center'>User Type/<br>Vlan/Block</th>  </tr> </thead>")
                    .append(" <tbody>")
                    .append(table.toString())
                    .append(" </tbody>  </table>");

            obj.put("datatable", datatable.toString());
            obj.put("system_message", system_message);
        }

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
    public String valiDateSingleUser(PeReportInputValue peReportInput, PropertyEncoder propertyEncoder, SysUsers user) {

        if (StringHelper.isNullOrEmpty(peReportInput.getBatchId())
                    || StringHelper.isNullOrEmpty(peReportInput.getUsername())
                    || StringHelper.isNullOrEmpty(peReportInput.getPassword())
                    || StringHelper.isNullOrEmpty(peReportInput.getRepassword())
                    || StringHelper.isNullOrEmpty(peReportInput.getMobile())
                    || StringHelper.isNullOrEmpty(peReportInput.getCountryCode())
                    || StringHelper.isNullOrEmpty(peReportInput.getParam1())) {
                return "Please enter all mandatory fields.";
            }
            if (!StringUtil.isNumber(peReportInput.getMobile())) {
                return "Please enter correct mobile number.";
            }
            Prepaidbatch prepaidbatch = new PrepaidbatchJpaController()
                    .findPrepaidbatch(Integer.parseInt(peReportInput.getBatchId()), peReportInput.getOwnerName(), UIConstants.ACTIVE_STATUS.charAt(0));
            if (prepaidbatch == null) {
                return ("Sorry! There is no Active Plan to create single User, Please activate existing or create a new Plan.");

        }

        Date expiry = prepaidbatch.getExpiryDate();
        if (expiry.before(DateHelper.getCurrentDate())) {
            return ("Sorry! There is no Active Plan to create single User, Please activate existing or create a new Plan.");

        }

        Prepaidcard prepaidcard = new Prepaidcard();
        prepaidcard.setBatchId(prepaidbatch);

        prepaidcard.setBlocked('N');
        Msgsent msgsent = null;
        if (!StringUtil.isNullOrEmpty(peReportInput.getMobile()) && peReportInput.getMobile().length() > 5) {
            prepaidcard.setMobileno(peReportInput.getCountryCode() + peReportInput.getMobile());
            prepaidcard.setCountryCode(peReportInput.getCountryCode());
            //Send SMS Token
            msgsent = new Msgsent();
            msgsent.setMsisdn(prepaidcard.getMobileno());
            msgsent.setCountryCode(new BigInteger(peReportInput.getCountryCode()));
            msgsent.setTlv(propertyEncoder.getString("sms.tlv"));
            msgsent.setLang(Integer.parseInt(propertyEncoder.getString("sms.language")));
            String message = propertyEncoder.getString("guest.message").replace("{0}", peReportInput.getUsername()).replace("{1}", peReportInput.getPassword());
            msgsent.setMessage(message);
            msgsent.setSenderId(propertyEncoder.getString("sms.senderId"));
                msgsent.setSmsc(Short.parseShort(propertyEncoder.getString("sms.smsc")));
                msgsent.setVlanId(new BigInteger("0"));
                msgsent.setDateCreated(DateHelper.getCurrentDate());
                msgsent.setScheduleDatetime(DateHelper.getCurrentDate());
                msgsent.setServiceRef("Single User");
                msgsent.setMsgSourceRef(prepaidbatch.getOwnerName() + " " + "Single User");
                msgsent.setSent('N');

        } else {
            prepaidcard.setMobileno("00");
        }

        prepaidcard.setCreatedBy(user.getUsername());
        prepaidcard.setExpired('N');
        prepaidcard.setExpiryDate(prepaidbatch.getExpiryDate());
        prepaidcard.setOwnerName(prepaidbatch.getOwnerName());
        prepaidcard.setDateCreated(new Date());
        prepaidcard.setSerialNo("0");
        prepaidcard.setUsername(peReportInput.getUsername());
        prepaidcard.setPassword(StringUtil.encodeBase64(peReportInput.getPassword()));
        prepaidcard.setCustomerName(peReportInput.getParam1() + " " + peReportInput.getParam2());
        boolean status = false;
        try {
                status = new PrepaidcardJpaController().createSingleUser(prepaidcard, msgsent);
            } catch (Exception ex) {
            }
            if (status == true) {
            //call audit log
            AuditLog auditLog = new AuditLog();
            auditLog.setAction(UIConstants.ADD);
            auditLog.setActionOn(DateHelper.getCurrentDate());
            auditLog.setActionBy(user.getUsername());
            auditLog.setComponent(this.getClass().getSimpleName());
            auditLog.setMessage("User name:" + peReportInput.getUsername() + " Password:" + peReportInput.getPassword()
                    + " Added Owner " + prepaidbatch.getOwnerName() + " Guest:" + peReportInput.getParam1());
            SysUsersFacade facade = new SysUsersFacade();
            facade.saveAuditLog(auditLog);
            return "User " + peReportInput.getUsername() + " created";
        } else {
            return "Sprry! User does not created, there may be technical issue.";
        }

    }
%>
