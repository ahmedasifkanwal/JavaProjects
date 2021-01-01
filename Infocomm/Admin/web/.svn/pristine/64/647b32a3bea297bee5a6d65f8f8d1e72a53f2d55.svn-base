

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

        SysUsers user = (SysUsers) session.getAttribute("Users");
        if (request.getParameter("ROW").equalsIgnoreCase("ROW1")) {
            StringBuilder graph = new StringBuilder();
            PeChart peChart = new PeChart(null, "A", "");
            peChart.setAuthority_id("System");
            new ChartFacade().createDashboard(peChart);

        }

    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.getMessage());

    }
    out.print(obj);
    out.flush();

%>