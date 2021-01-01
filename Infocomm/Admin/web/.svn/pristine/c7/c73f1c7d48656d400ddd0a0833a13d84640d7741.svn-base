

<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%@page import="com.info.cms.report.graph.UIChartBase"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="com.info.cms.presentation.entity.PeChart"%>
<%@page import="com.info.cms.report.graph.facade.ChartFacade"%>
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
      String path[] = UIChartBase.class.getProtectionDomain().getCodeSource().getLocation().getPath().toLowerCase().split("web-inf");
          String graphPath = "";//UIConstants.GRAPH_PATH
          graphPath = path[0] + File.separator + "json/data/us-capitals.json";
          String base = new Scanner(new java.io.File(graphPath)).useDelimiter("\\Z").next();


    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.getMessage());

    }
    out.print(obj);
    out.flush();

%>