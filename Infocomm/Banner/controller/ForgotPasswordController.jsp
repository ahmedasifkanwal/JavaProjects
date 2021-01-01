
<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
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
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("ForgotPasswordController");
    //Initialization section begin
  
    String  controllerpage = null, controllerCom = null;
  

    //Initialization section end
    try {
        //Get Report Values
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
        String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/" + peLogin.getPda() + peLogin.LANGFIXED() + "common/";
        controllerpage = request.getContextPath() + "/fixedtemplate/Banner1/" + peLogin.getPda() + peLogin.LANGFIXED() + folder + "/";

      


        Result result = null;
        if (peLogin.getIsWallgardenAvailable() == false) {
            response.sendRedirect(controllerCom + "WallgardenUnavilableForm.jsp");
        } else {

            if (request.getParameter("Enter") != null) {

                LoginCommonFacade loginCommonFacade = new LoginCommonFacade(request);
                result = loginCommonFacade.forgotPassword();
                session.setAttribute("Result", result);
                response.sendRedirect(controllerCom + "ForgotPasswordForm.jsp");
            }

            if (request.getParameter("Register_New") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerpage + "WelcomeForm.jsp");
            }

            if (request.getParameter("User_With_Token") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "UserWithSecurityCodeForm.jsp");
            }


            if (request.getParameter("Forgot_Password") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "ForgotPasswordForm.jsp");
            }




            if (request.getParameter("Existing_User") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "ExistingUserLoginForm.jsp");
            }

        }


    } catch (Exception ex) {

        logger.info("Application level error in ForgotPasswordController Controller"+ex.getMessage());
        response.sendRedirect(controllerCom + "Error.jsp");
    }
%>