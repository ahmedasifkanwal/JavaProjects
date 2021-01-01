

<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
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
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/ar/common/";
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

<div class="container-fluid">
    <div class="row headpd headpdm">
        <div class="col-md-5">
            <a href="http://omantel.om" target="_blank">
                <div class="imgRight imgsize imgsizemob">
                    <img class="img-fluid" src="<%=logo%>">
                </div>
                <div class="imgleft imgsize imgsizemob">
                    <img class="img-fluid" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/omantel.png">
                </div>
            </a> 
        </div>     
    </div>
           <p><%=peSession.getTxt_welcomeNote()%> </p>             
</div>
<!-- logo top banner end -->

<%    } catch (Exception ex) {
        logger.info("Exception in business baseLayout" + ex.getMessage());
        response.sendRedirect(controllerCom + "Error.jsp");
        return;
    }%>   





