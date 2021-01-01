
<%@page import="java.util.logging.Logger"%>
<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
<%@page import="com.info.wifi.business.facade.LoginFailedFacade"%>
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
    String controllerCom = null, controllerpage = null;


    //Initialization section end
    try {
        //Get Report Values
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
        String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        controllerCom = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getPda() + peLogin.LANGFIXED() + "common/";
        controllerpage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getPda() + peLogin.LANGFIXED() + folder + "/";


        Result result = null;

        if (peLogin.getIsWallgardenAvailable() == false) {
            response.sendRedirect(controllerCom + "WallgardenUnavilableForm.jsp");
        } else {
            if (request.getParameter("Enter") != null) {

                result = new LoginCommonFacade(request).existingUserLogin();
                if (result != null && result.getIsSuccess() == false) {
                    session.setAttribute("Result", result);
                    response.sendRedirect(controllerCom + "ExistingUserLoginForm.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/fixedtemplate/controller/LoginSuccessController.jsp?logintype=existing");

                }
            }

            if (request.getParameter("Register_New") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "UserWithSecurityCodeForm.jsp");
            }

            if (request.getParameter("User_With_Token") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerpage + "WelcomeForm.jsp");
            }

            if (request.getParameter("Forgot_Password") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "ForgotPasswordForm.jsp");
            }
        }


    } catch (Exception ex) {

        logger.info("Application level error in ExistingUserLoginController Controller" + ex.getMessage());
        response.sendRedirect(controllerpage + "Error.jsp");
    }

%>