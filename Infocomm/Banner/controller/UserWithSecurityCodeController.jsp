
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
    String controllerpage,controllerCom = null;

    //Initialization section end
    try {
        //Get Report Values
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
        controllerpage = request.getContextPath() + "/fixedtemplate/Banner1/common/";
        
         String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/" + peLogin.getPda() + peLogin.LANGFIXED() + "common/";
        controllerpage = request.getContextPath() + "/fixedtemplate/Banner1/" + peLogin.getPda() + peLogin.LANGFIXED() + folder + "/";

        

        Result result = null;
        if (peLogin.getIsWallgardenAvailable() == false) {

            response.sendRedirect(controllerpage + "WallgardenUnavilableForm.jsp");

        } else {
            if (request.getParameter("Enter") != null) {
                LoginCommonFacade loginCommonFacade = new LoginCommonFacade(request);
                result = loginCommonFacade.loginWithSecurityToken();
                if (result != null && result.getIsSuccess() == false) {
                    session.setAttribute("Result", result);
                    response.sendRedirect(controllerCom + "UserWithSecurityCodeForm.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/fixedtemplate/Banner1/controller/LoginSuccessController.jsp");
                }
            }

            if (request.getParameter("Register_New") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerpage + "WelcomeForm.jsp");
            }

        }

    } catch (Exception ex) {

        logger.info("Application level error in UserWithSecurityCodeController Controller");
           response.sendRedirect(controllerCom + "Error.jsp");
    }

%>