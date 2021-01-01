<%@page import="com.info.cms.helper.SSGAPIResult"%>
<%@page import="com.info.cms.helper.SSGAPI"%>
<%@page import="com.info.cms.facade.ReferenceData"%>
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.info.cms.report.graph.facade.ProfileStaticticsFacade"%>
<%@page import="com.info.cms.presentation.entity.PeCampaignStatistics"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    Logger logger = Logger.getLogger("ProfileStatictics");
    JSONObject obj = new JSONObject();
    try {
        com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();
        com.info.wifi.rad.entity.controller.GenericJpaController radFacade = new com.info.wifi.rad.entity.controller.GenericJpaController();
        com.info.mbb.cms.controller.GenericJpaController mbbFacade = new com.info.mbb.cms.controller.GenericJpaController();

        SysUsers user = (SysUsers) session.getAttribute("Users");
        if (request.getParameter("ROW").equalsIgnoreCase("ROW1")) {

            String SQL = "select count(*) from radonline where nasport in (" + ReferenceData.getOffloadingVlans() + ")";
            int value = radFacade.getCount(SQL);
            obj.put("online1x", value);

            SQL = "select count(*) from radonline where nasport in (" + ReferenceData.getOwnersVlans() + ")";
            value = radFacade.getCount(SQL);
            obj.put("online", value);

            SQL = "select count(*)  from prepaidcard where created_by='MOBILE'  and trunc(DATE_ACTIVATED) = trunc(sysdate)";
            value = cmsFacade.getCount(SQL);
            obj.put("mobileactivation", value);
            SQL = "select count(*)  from prepaidcard where    trunc(DATE_ACTIVATED) = trunc(sysdate)";
            value = cmsFacade.getCount(SQL);
            obj.put("activation", value);

            SSGAPIResult apiResult = new com.info.cms.helper.SSGAPI().getLivedata();
            obj.put("liveconnecteddevice", apiResult.getLiveConnectedDevice());
            obj.put("liveonlineuser", apiResult.getLiveLogginUser());

        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW2")) {

            String SQL = "select count(*) from vlan where  status='A' ";
            int value = cmsFacade.getCount(SQL);
            obj.put("vlan", value);

            SQL = "select count(*) from hotspot_owner where status='A'";
            value = cmsFacade.getCount(SQL);
            obj.put("owner", value);

            SQL = "select  count(*) from prepaidbatch where BATCH_STATUS='A'";
            value = cmsFacade.getCount(SQL);
            obj.put("plan", value);

            SQL = " select   count(*)  from logs where status_type='Start'";
            value = radFacade.getCount(SQL);
            int sessionCount = value;
            obj.put("session", value);

            SQL = " select  ROUND(sum(INPUT_OCTETS+OUTPUT_OCTETS)/(1024*1024),0)  from logs where status_type='Stop'";
            value = radFacade.getCount(SQL);
            obj.put("banwidth", value / 1024 + " GB");
            obj.put("avgbanwidth", value / sessionCount + " MB");

        }

        if (request.getParameter("ROW").equalsIgnoreCase("ROW3")) {

            String SQL = "select  count(distinct mac) from ( select distinct (Mac_addr)  as mac from prepaidcard_expired where created_by='MOBILE'                      \n"
                    + "  Union  select distinct (Mac_addr) as mac from prepaidcard where created_by='MOBILE')A";
            int value = cmsFacade.getCount(SQL);
            obj.put("mobiledownload", value);

            SQL = "select  count(distinct(mobileno))  from prepaidcard where    trunc(DATE_ACTIVATED) = trunc(sysdate)";
            value = cmsFacade.getCount(SQL);
            obj.put("uniqueactivation", value);

            SQL = "select  count(distinct(mobileno))  from prepaidcard where  created_by='MOBILE' and  trunc(DATE_ACTIVATED) = trunc(sysdate)";
            value = cmsFacade.getCount(SQL);
            obj.put("uniquemobileactivation", value);

            SQL = "select count(*) from msgsent where msisdn like '968%'  and sent='Y' ";
            value = cmsFacade.getCount(SQL);
            obj.put("message", value);

            SQL = "select count(*) from msgsent where msisdn not like '968%'  and sent='Y'  ";
            value = cmsFacade.getCount(SQL);
            obj.put("messageInt", value);

            SQL = "select count(*)  from VOLUME_ACCOUNT where    trunc(CREATED_DATE) = trunc(sysdate) and  TRU_AUTH_STATUS='D'";
            value = cmsFacade.getCount(SQL);
            String data = "D(" + value + ")";

            SQL = "select count(*)  from VOLUME_ACCOUNT where    trunc(CREATED_DATE) = trunc(sysdate) and  TRU_AUTH_STATUS <>'D'";
            value = cmsFacade.getCount(SQL);
            data = data + "/P(" + value + ")";
            obj.put("onexactivation", data);

        }

    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.getMessage());

    }
    out.print(obj);
    out.flush();

%>