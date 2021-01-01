<%-- 
    Document   : Activation
    Created on : Mar 11, 2012, 4:16:49 PM
    Author     : mohd rehan
    Vervion:02
--%>

<%@page import="com.info.wifi.cms.entity.Vlan"%>
<%@page import="com.info.wifi.cms.entity.controller.VlanJpaController"%>
<%@page import="com.info.wifi.cms.entity.CreditCardPayment"%>
<%@page import="com.info.wifi.cms.entity.controller.CreditCardPaymentJpaController"%>
<%@page import="com.info.wifi.cms.entity.PaymentTransaction"%>
<%@page import="com.info.wifi.cms.entity.controller.PaymentTransactionJpaController"%>
<%@page import="com.info.wifi.cms.entity.controller.PrepaidcardJpaController"%>
<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.business.facade.CommonFacade"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.facade.util.DateHelper"%>
<%@page import="com.info.wifi.cms.entity.ErrorLog"%>
<%@page import="com.info.wifi.cms.entity.controller.ErrorLogJpaController"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.facade.util.SSGAPIResult"%>
<%@page import="com.info.wifi.facade.util.SSGAPI"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.info.wifi.cms.entity.Country"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.List"%>
<%@page import="com.info.wifi.cms.entity.controller.CountryJpaController"%>
<%@ page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.util.Locale" %>

<%!    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("LoginSuccessController");
%>
<%
    PeLogin peLogin = null;
    SSGAPIResult ssgresult = null;
    Result result = new Result();
    String controllerCom = "";
    try {

        logger.info("RETURNED CC URI " + request.getRequestURI());
        logger.info("RETURNED CC URL " + request.getRequestURL());
        peLogin = (PeLogin) session.getAttribute("peLogin");
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/" + peLogin.getPda() + peLogin.LANGFIXED() + "common/";
        SSGAPI api = new SSGAPI();
        api.setUsername(peLogin.getUsername());
        api.setPassword(StringUtil.encodeMD5(peLogin.getPassword()));
        logger.info("PASSWORD  BEFORE LOGIN :" + api.getPassword());
        api.setSid(peLogin.getSid());
        //SSGAPIResult ssgresult = api.login();
        //Setting Zero Config Paramater      
        PeSession peSession = (PeSession) session.getAttribute("peSession");
        api.setClientIP(peSession.getClientIp());
        api.setClientMac(peSession.getClientMac());
        api.setPpli(peSession.getPpli());
        api.setLocationIndex(peSession.getLocationIndex());
        //Setting Calling Login API With With  Config Paramater
        ssgresult = api.loginByZeroConfigParamaters();

        if (ssgresult != null && ssgresult.getResultcode().equals("1")) {
            logger.info("SESSION EXPIRED ERROR CODE 1 METHOD LOGINSUCCESSCONTROLER FIXED");
                    response.sendRedirect(request.getContextPath() + "/session.expired.tiles");
                    return;
                }
        //Check the result
        if (ssgresult != null && ssgresult.getResult().toLowerCase().equals("ok")) {

            response.sendRedirect(controllerCom + "LoginSuccessForm.jsp");
            } else {
            response.sendRedirect(controllerCom + "LoginFailureForm.jsp");
        }

    } catch (Exception ex) {

        logger.info("Application level error in LoginSuccessController Controller" + ex);
        response.sendRedirect(controllerCom + "Error.jsp");
    } finally {
        // new PrepaidcardJpaController().updateLastLoginLang(peLogin.getUsername(), LANG);
        session.setAttribute("Result", result);

    }

%>