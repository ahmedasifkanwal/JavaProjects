
<%@page import="com.info.wifi.facade.util.SSGAPIResult"%>
<%@page import="com.info.wifi.facade.util.SSGAPI"%>
<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
<%@page import="com.info.wifi.rad.entity.controller.AccountuserJpaController"%>
<%@page import="com.info.wifi.rad.entity.Accountuser"%>
<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.business.facade.VoucherlessFacade"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.business.facade.VoucherFacade"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="java.util.logging.Level"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.logging.Level"%>
<%

    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("WelcomeController");
    String controllerCom = "";

    //Initialization section end
    try {
        //Get Report Values      
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
       controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/" + peLogin.getPda() + peLogin.LANGFIXED() + "common/";
        SSGAPI api = new SSGAPI();
        PeSession peSession = (PeSession) session.getAttribute("peSession");;
        //Setting Calling Login API With With  Config Paramater
            SSGAPIResult ssgresult = api.logout(peSession.getClientMac());
            if (ssgresult != null && ssgresult.getResult().toLowerCase().equals("ok")) {
            response.sendRedirect(controllerCom + "LogoutForm.jsp");
            return;
            } else {
                response.sendRedirect(controllerCom + "LoginSuccessForm.jsp");
                return;

        }

        // Verify input end
    } catch (Exception ex) {

    }


%>