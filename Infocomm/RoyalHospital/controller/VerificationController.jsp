
<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.business.facade.VoucherlessFacade"%>
<%@page import="com.info.wifi.business.facade.VoucherFacade"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="java.util.logging.Level"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("VerificationController");
    String controllerCom = null, controllerpage = null, controller = "";

    try {
        //Get Report Values
        PeLogin peLogin = (PeLogin) session.getAttribute("peLogin");
        String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        controllerCom = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getPda().replace(".", "/") + peLogin.LANGFIXED() + "common/";
            controllerpage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getPda().replace(".", "/") + peLogin.LANGFIXED() + folder + "/";
            controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/LoginSuccessController.jsp";

        Result result = null;
        peLogin.setCountryCode(StringUtil.isNullOrEmpty(request.getParameter("countryCode")) ? null : request.getParameter("countryCode").trim());
        peLogin.setMobileNo(request.getParameter("mobileNumber").trim());
        peLogin.setVerificationToken(StringUtil.isNullOrEmpty(request.getParameter("verificationToken")) ? "" : request.getParameter("verificationToken").trim());
        peLogin.setUsername(StringUtil.isNullOrEmpty(request.getParameter("username")) ? "" : request.getParameter("username").trim());

        if (request.getParameter("Existing_User") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerpage + "ExistingUserLoginForm.jsp");
                  return ;
            } else if (request.getParameter("Register_New") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerpage + "WelcomeForm.jsp");
                  return ;
            } else {
                if (WIFIConstants.UAM_TILES_FX.prepaid.name().equals(peLogin.getPaymentMethodName())) {
                    peLogin.setPaymentMethodId(WIFIConstants.PLAN_TYPE.PLAN_TYPE_VOUCHER.value);//voucherless
                    VoucherFacade voucherFacade = new VoucherFacade(request);
                    result = voucherFacade.validateSecurityToken(peLogin);
                    peLogin = (PeLogin) result.getKeyDataField();
                    session.setAttribute("peLogin", peLogin);
                    if (result != null && result.getIsSuccess() == false) {
                        session.setAttribute("Result", result);
                        response.sendRedirect(controllerpage + "VerificationForm.jsp");
                   return ;   } else {
                      response.sendRedirect(request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/LoginSuccessController.jsp");
                     return ; }
                }

            if (WIFIConstants.UAM_TILES_FX.mobile.name().equals(peLogin.getPaymentMethodName())) {
                    peLogin.setPaymentMethodId(WIFIConstants.PLAN_TYPE.PLAN_TYPE_VOUCHER_LESS.value);//voucherless
                    VoucherlessFacade voucherlessFacade = new VoucherlessFacade(request);
                    result = voucherlessFacade.validateSecurityToken(peLogin);
                    peLogin = (PeLogin) result.getKeyDataField();
                    session.setAttribute("peLogin", peLogin);

                if (result != null && result.getIsSuccess() == false) {
                        session.setAttribute("Result", result);
                        response.sendRedirect(controllerpage + "VerificationForm.jsp");
                          return ;
                    } else {
                        response.sendRedirect(request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/LoginSuccessController.jsp");
                            return ;
                }
                        }
                    }

    } catch (Exception ex) {
        logger.info("Application level error in VerificationController Controller" + ex.getMessage());
        response.sendRedirect(controllerpage + "VerificationForm.jsp");
          return ;
    }

%>