
<%@page import="java.util.Locale"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
<%@page import="com.info.wifi.business.facade.CommonFacade"%>
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

<%
    Logger logger = Logger.getLogger("ExistingUserLoginController");
    //Initialization section begin
    String controllerpage = null, controllerCom = "";

    //Initialization section end
    try {
        //Get Report Values
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
            String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
                controllerCom = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getPda().replace(".", "/") + peLogin.LANGFIXED() + "common/";
                controllerpage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getPda().replace(".", "/") + peLogin.LANGFIXED() + folder + "/";

        Result result = null;
        if (peLogin.getIsWallgardenAvailable() == false) {

            response.sendRedirect(controllerCom + "WallgardenUnavilableForm.jsp");
  return ;
        } else {
            if (request.getParameter("Enter") != null) {
                LoginCommonFacade loginCommonFacade = new LoginCommonFacade(request);
                result = loginCommonFacade.loginWithSecurityToken();
                if (result != null && result.getIsSuccess() == false) {
                    session.setAttribute("Result", result);
                    response.sendRedirect(controllerCom + "UserWithSecurityCodeForm.jsp");
                 return ; } else {
                   response.sendRedirect(request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/LoginSuccessController.jsp");
                 return ; }
            }

            if (request.getParameter("Register_New") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerpage + "WelcomeForm.jsp");
                  return ;
            }

        }

    } catch (Exception ex) {

        logger.info("Application level error in UserWithSecurityCodeController Controller");
    }

%>