<%@page import="com.info.wifi.cms.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="java.util.Locale"%>
<%
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("HorizaontaLogoArea");
    PeSession peSession = null;
    String logo = request.getContextPath() + "/fixedtemplate/Banner1/includes/defaultImage/omantel.png";
    PeLogin peLogin = null;
    String controllerCom = "", welcomePage = "", welcomePageAr = "";

    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
        //Getting Logo
        peSession = (PeSession) session.getAttribute("peSession");

        WIFILayoutManager.initializeDynamicLayout(peLogin.getOwnerName(), peSession, peLogin.getLocale());

        session.setAttribute("peSession", peSession);
        peLogin.setLocale(new Locale(""));
        peLogin.setPda("");
        session.setAttribute("peLogin", peLogin);
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/common/";
        String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        welcomePage = request.getContextPath() + "/fixedtemplate/Banner1/" + folder + "/WelcomeForm.jsp?langchange=yes";
        welcomePageAr = request.getContextPath() + "/fixedtemplate/Banner1/ar/" + folder + "/WelcomeForm.jsp?langchange=yes";

//Getting Logo
        if (session.getAttribute("peSession") != null) {

            if (!StringUtil.isNullOrEmpty(peSession.getImgEng1Url())) {
                logo = request.getContextPath() + "/" + peSession.getImgEng1Url();
            }

        }


%>
<div class="container-fluid" style="padding-top:10px">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-6" style="display: inline-block;">
            <div class="txtHead bdrr" onclick="location.href = 'http://login.now/'">Home</div>
            <div class="txtHead bdrr" onclick="location.href = 'http://www.omantel.om/OmanWebLib/customersupport/CustomerAgreement.aspx?LinkID=700&MenuId=718'">Terms & Condition</div>
            <div class="txtHead bdrr" onclick="location.href = '../common/Privacy.jsp'">Privacy Policy</div>
            <input name="button1" type="submit" class="txtHeadbtn bdrr" value="&#1593;&#1585;&#1576;&#1610;" onclick="location.href = '<%=welcomePageAr%>'" />
            <input name="button1" type="submit" class="txtHeadbtnact" value="English" onclick="location.href = '<%=welcomePage%>'"/>
        </div>
        <div class="col-md-2"></div>
    </div>



</div>


    <div  style="text-align: center">
        
        <img src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/powered.png" alt=""/>
    </div>

<br/>


<%    } catch (Exception ex) {
        logger.info("Exception in business baseLayout" + ex.getMessage());
        response.sendRedirect(controllerCom + "Error.jsp");
        return;
    }%>
