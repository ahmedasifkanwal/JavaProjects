


<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("HorizaontaLogoArea");
    PeSession peSession = null;
    String logo = request.getContextPath() + "/fixedtemplate/Banner1/includes/defaultImage/omantel.png";
    PeLogin peLogin = null;

    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
          //Getting Logo
        peSession = (PeSession) session.getAttribute("peSession");
        WIFILayoutManager.initializeDynamicLayout(peLogin.getOwnerName(), peSession, peLogin.getLocale());        
        session.setAttribute("peSession",peSession);
        //Getting Logo
        if (session.getAttribute("peSession") != null) {
           
            if (!StringUtil.isNullOrEmpty(peSession.getImgEng1Url())) {
             logo = request.getContextPath() + "/"+peSession.getImgEng1Url();
            }

        }

%>
<div style="margin: 0 auto; text-align: center;padding-left:35px">
    <div class="row" style="padding-top:15px">
        <div class="col-md-3"></div>
        <div class="col-md-2" style="max-width: 180px; height: auto;  "> <a href="http://omantel.om" target="_blank"><img class="img-fluid" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/omantel.png"></a> </div>
        <div class="col-md-2" style="width: 180px; height: auto;"> <a href="http://omantel.om" target="_blank"><img style="margin-top:35px" class="img-fluid" src="<%=logo%>"></a> </div>                                                                                                         <div class="col-md-2" style="width: 180px; height: auto;"> <a href="http://omantel.om" target="_blank"><img style="margin-top:35px" class="img-fluid" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/call.png"></a> </div>
        <div class="col-md-3"></div>
    </div>
</div>


<!-- logo top banner end -->
<%

    } catch (Exception ex) {
        logger.info("Exception in business baseLayout" + ex.getMessage());
        throw ex;
    }%>
