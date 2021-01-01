<%-- 
    Document   : Activation
    Created on : Mar 11, 2012, 4:16:49 PM
    Author     : mohd rehan
--%>


<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.facade.util.DateHelper"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.cms.entity.ErrorLog"%>
<%@page import="com.info.wifi.cms.entity.controller.ErrorLogJpaController"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.facade.util.SSGAPIResult"%>
<%@page import="com.info.wifi.facade.util.SSGAPI"%>

<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>

<%@page import="java.util.TreeMap"%>

<%@page import="java.util.Map"%>

<%@page import="java.util.logging.Level"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html; pageEncoding=UTF-8"%>
<%@page import="java.util.Locale" %>

<%!    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("MACBasedLoginController");
%>
<%

    Result result = new Result(false);
    String controllerCom = "";
    SSGAPIResult ssgresult = null;
    try {
        //Get Report Values
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
        controllerCom = request.getContextPath() + "/fixedtemplate/Advertising/" + peLogin.getPda() + peLogin.LANGFIXED() + "common/";
        SSGAPI api = new SSGAPI();
        api.setUsername(peLogin.getUsername());
        //Direct Password no conversion
        api.setPassword(peLogin.getPassword());
        logger.info("PASSWORD  BEFORE LOGIN :" + api.getPassword());
        api.setSid(peLogin.getSid());

        //Setting Zero Config Paramater      
        PeSession peSession = (PeSession) session.getAttribute("peSession");
        api.setClientIP(peSession.getClientIp());
        api.setClientMac(peSession.getClientMac());
        api.setPpli(peSession.getPpli());
        api.setLocationIndex(peSession.getLocationIndex());
        //Setting Calling Login API With With  Config Paramater
        ssgresult = api.loginByZeroConfigParamaters();

            if (ssgresult != null && ssgresult.getResultcode().equals("1")) {
                logger.info("SESSION EXPIRED ERROR CODE 1 METHOD MACBASEDCONTROLLER FIXED");
                response.sendRedirect(request.getContextPath() + "/session.expired.tiles");
                return;
            }

        //Check the result
        if (ssgresult != null && ssgresult.getResult().toLowerCase().equals("ok")) {
            result.setIsSuccess(true);

            if (result.getIsSuccess()) {
                response.sendRedirect(controllerCom + "LoginSuccessForm.jsp");  return ;
            }
        }


        if (ssgresult != null && !ssgresult.getResult().toLowerCase().equals("ok")) {
            try {
                PropertyEncoder appMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());
                result.setIsSuccess(false);
                result.setMessage(appMsg.getString("info.login.fail.device").replace("{0}", ssgresult.getResultcode()));
                ErrorLogJpaController cont = new ErrorLogJpaController();
                ErrorLog msg = new ErrorLog();
                if (!StringUtil.isNullOrEmpty(ssgresult.getResultcode())) {
                    msg.setErrorcode(ssgresult.getResultcode());
                }
                msg.setDateCreation(DateHelper.getCurrentDate());
                msg.setPassword(peLogin.getPassword());
                msg.setUsername(peLogin.getUsername());
                msg.setVlanid(peLogin.getVlan());
                msg.setCreatedby("MAC Re-Login:"+peLogin.getPaymentMethodName());
              
                  msg.setRemarks("Url" + (StringUtil.isNullOrEmpty(ssgresult.getUrl()) ? "NA" : ssgresult.getUrl())
                          + "</br>Reply:" + (StringUtil.isNullOrEmpty(ssgresult.getReply()) ? "NA" : ssgresult.getReply()));
            
                cont.create(msg);
            } catch (Exception ex) {
                logger.info("Exception Adding Error Message to ErrorLog" + ex);
            }
            response.sendRedirect(controllerCom + "LoginFailureForm.jsp");  return ;
        }


    } catch (Exception ex) {

        logger.info("Application level error in  MACBasedLoginController" + ex);
        response.sendRedirect(controllerCom + "Error.jsp");  return ;

    } finally {

        session.setAttribute("Result", result);

    }
%>