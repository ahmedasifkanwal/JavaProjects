
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

<%

    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("WelcomeController");
    String controllerCom = "", controllerpage = "";

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
            if (request.getParameter("customerName") != null) {
                peLogin.setCustomerName(request.getParameter("customerName"));
            }

            if (request.getParameter("customerEmail") != null) {
                peLogin.setCustomerEmail(request.getParameter("customerEmail"));
            }

            if (request.getParameter("termAndCondition") != null) {
                peLogin.setCheckBox(request.getParameter("termAndCondition").trim());
            }
            if (request.getParameter("mobileNumber") != null) {
                peLogin.setMobileNo(request.getParameter("mobileNumber").trim());
            }

            if (WIFIConstants.UAM_TILES_FX.prepaid.name().equals(peLogin.getPaymentMethodName())) {

                if (request.getParameter("Enter") != null) {
                    VoucherFacade voucherFacade = new VoucherFacade(request);
                    result = voucherFacade.sendActivationCode();
                    if (result != null && result.getIsSuccess() == false) {
                        session.setAttribute("Result", result);
                        response.sendRedirect(controllerpage + "WelcomeForm.jsp");
                    } else {
                        response.sendRedirect(controllerpage + "VerificationForm.jsp");
                    }
                }
            }

            if (WIFIConstants.UAM_TILES_FX.mobile.name().equals(peLogin.getPaymentMethodName())) {

                if (request.getParameter("Enter") != null) {
                    VoucherlessFacade voucherlessFacade = new VoucherlessFacade(request);
                    result = voucherlessFacade.sendActivationCode();
                    if (result != null && result.getIsSuccess() == false) {
                        session.setAttribute("Result", result);
                        response.sendRedirect(controllerpage + "WelcomeForm.jsp");
                    } else {
                        response.sendRedirect(controllerpage + "VerificationForm.jsp");
                    }
                }

            }
            if (request.getParameter("User_With_Token") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "UserWithSecurityCodeForm.jsp");
            }

            if (request.getParameter("Existing_User") != null) {
                session.removeAttribute("Result");
                response.sendRedirect(controllerCom + "ExistingUserLoginForm.jsp");
            }
            //</editor-fold>
            // Verify input end
        }

    } catch (Exception ex) {

        logger.info("Application level error in WelcomeController Controller" + ex.getMessage());
        Result result = new Result();
        result.setIsSuccess(false);
        result.setMessage(ex.getMessage());
        response.sendRedirect(controllerCom + "Error.jsp");
    }


%>