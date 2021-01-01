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
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/common/";
        PeSession peSession = (PeSession) session.getAttribute("peSession");
        WIFILayoutManager.initializeFixedLayout(peLogin.getOwnerName(), peSession, peLogin.getLocale());
        String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        welcomePage = request.getContextPath() + "/fixedtemplate/Banner1/" + folder + "/WelcomeForm.jsp?langchange=yes";
        welcomePageAr = request.getContextPath() + "/fixedtemplate/Banner1/ar/" + folder + "/WelcomeForm.jsp?langchange=yes";

%>
<style>
    .btn1{
        color: #0455a7;
        font-size: 3vh;
    }
    .btn1:hover {
        color: #fff;
        box-shadow: rgba(245, 173, 45, 1) 0 0px 0px 40px inset;
    }
    .bact{
        font-size: 2.5vh;
        color: #fff;
        box-shadow: rgba(245, 173, 45, 1) 0 0px 0px 40px inset;
    }
    btn {
        font-family: Arial, sans-serif;
        background-color: transparent;
        padding: 6px;
        width: 40%;
        border-radius: 5px;
        -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
        -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
        -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
        -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
        transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
    }
    .txtHead{
        color: #f5ad2d;
        display:inline;
        font-size:2.8vh; 
    }
    .bdrr {
        border-right: 2px solid #f5ad2d;
        padding-left: 10px;
        padding-right:10px;
    }
</style>

<div class="container-fluid">
    <div class="row" style="padding-bottom:15px">
        <div class="col-md-10" style="display: inline-block;">
            <div class="txtHead bdrr" onclick="location.href = 'http://login.now/'">Home</div>
            <div class="txtHead bdrr" onclick="location.href = 'http://www.omantel.om/OmanWebLib/customersupport/CustomerAgreement.aspx?LinkID=700&MenuId=718'">Terms & Condition</div>
            <div class="txtHead" onclick="location.href = '../common/Privacy.jsp'"s>Privacy Policy</div>
        </div>
        <div class="col-md-2 pull-right" style="display: inline-block">
            <input name="button1" type="submit" class="btn btn1" value="&#1593;&#1585;&#1576;&#1610;" onclick="location.href = '<%=welcomePageAr%>'" />
            <input name="button1" type="submit" class="btn bact" value="English" onclick="location.href = '<%=welcomePage%>'"/>
        </div>
    </div>
</div>












<%                            } catch (Exception ex) {
        logger.info("Exception in business baseLayout" + ex.getMessage());
        response.sendRedirect(controllerCom + "Error.jsp");
        return;
    }%>   










