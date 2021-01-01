<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="java.util.Locale"%>
<%

    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
    PeLogin peLogin = null;
    String controllerCom = "", welcomePage = "", welcomePageAr = "";
    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
        peLogin.setLocale(new Locale(""));
        peLogin.setPda("");
        session.setAttribute("peLogin", peLogin);
        controllerCom = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/common/";
        PeSession peSession = (PeSession) session.getAttribute("peSession");
        WIFILayoutManager.initializeFixedLayout(peLogin.getOwnerName(), peSession, peLogin.getLocale());
         String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        welcomePage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + folder + "/WelcomeForm.jsp?langchange=yes";
        welcomePageAr = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/ar/" + folder + "/WelcomeForm.jsp?langchange=yes";

%>
<style>

    <%=peSession.initializeFixedStyle()%>
    
    
</style>

 

    <%
        } catch (Exception ex) {
            logger.info("Exception in business baseLayout" + ex.getMessage());
            response.sendRedirect(controllerCom + "Error.jsp");
            return;
        }%>   










