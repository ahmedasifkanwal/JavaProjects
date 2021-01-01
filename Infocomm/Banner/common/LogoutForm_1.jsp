<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.info.wifi.rad.entity.Accountuser"%>
<%@page import="com.info.wifi.ilas.util.StringHelper"%>
<%@page import="com.info.wifi.ilas.util.Constants"%>
<%@page import="com.info.wifi.ilas.util.BannerEngineReferences"%>
<%@page import="com.info.wifi.ilas.util.BannerEngine"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.info.wifi.business.facade.CommonFacade"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.business.facade.CountryFacade"%>
<%@page import="java.util.Map"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.cms.entity.Country"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="java.util.Locale" %>
<%!    Logger logger = Logger.getLogger(this.getClass().getName());
%>
<%

    PropertyEncoder appMsg = null;

    PeLogin peLogin = null;
    Result result = null;

    String mac_vlan = "", controller = "http://ezxcess.antlabs.com/login.now", controllerCom = "", breadCrum = "", paymentDetailsRow = "";

    String paymentDetails = "";

    JSONObject obj = null;
    try {

        if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
        }
        if (session.getAttribute("peLogin") != null) {

            peLogin = (PeLogin) session.getAttribute("peLogin");
            appMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());

        }
        //Banner Logic
        obj = getImage(peLogin.getMacvlan(), peLogin.getVlan(), "P3", request.getHeader("User-Agent").toString());
        obj.get("banner_space_1");
        obj.get("banner_space_2");
        obj.get("banner_space_3");
        //Banner Logic
%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Logout to Wi-Fi</title>
    </head>


    <body>
        <div class="gridContainer clearfix bgimage" >
            <div id="LayoutDiv1" ></div>
        </div>
        <jsp:include page="../layout/HeaderScript.jsp"></jsp:include>
        <jsp:include page="../layout/Header.jsp"></jsp:include>

            <div class="container-fluid">
                <!-- Top Bar -->

                <!-- Top Banner -->
                <div class="row">
                    <!-- Slider  SECTION BANNER-1 -->
                    <div class="col-md-12 slider" id="main-slider1"> <!--outermost container element -->
                        <div class="add-space-1"><!-- innermost wrapper element -->


                            <div class="banner_space_1">
                            <% if (!StringHelper.isNullOrEmptyObject(obj.get("banner_space_1"))) {%>

                            <%=obj.get("banner_space_1")%>

                            <%} else {%>
                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" style="max-height: 120px" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_top.png" alt=""></a>
                          <%}%>
                            
                            
                            </div>
                    </div>
                    <span class="txtSub"><!--Text Here --></span>
                </div> 

                <!-- Slider  SECTION BANNER-1 -->
            </div>
            <p></p>

            <!-- Slider  SECTION BANNER-2 -->
            <div class="row" >
                <div class="col-md-9 slider" id="main-slider2"> <!--outermost container element -->
                    <div class="add-space-2"><!-- innermost wrapper element -->
                        <div class="banner_space_2">

                            <% if (!StringHelper.isNullOrEmptyObject(obj.get("banner_space_2"))) {%>

                            <%=obj.get("banner_space_2")%>

                            <%} else {%>
   <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" style="max-height: 250px" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_middle.png" alt=""></a>
                           <%}%></div>
                    </div>
                    <span class="txtSub"><!--Text Here --></span>
                </div> 

                <!-- Slider  SECTION BANNER-2 -->
                <div class="col-md-3">
                    <div class="col-md-12 dbg">
                        <form name="form"  id="form" method="post"  action="<%=controller%>"  >
                            <div class="start">
                                <div id="loginbox1">
                                    <div class="warningHeader"  title="<%=   peLogin.getMobileNoFormated()%>"><%=appMsg.getString("info.logout.msg")%></div>
                                </div>
                                <div class="container-fluid" >
                                    <div class="error_code" >
                                        <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                        <%=result.getMessage()%>
                                        <%}%>
                                    </div>

                                 

                                    <%=appMsg.getString("info.logout.msg.c1")%>&nbsp;<%=appMsg.getString("info.logout.msg.c2")%>
                                   </br>
                                    <%=appMsg.getString("link.login.now.message")%>
                                    
                                    <%=appMsg.getString("f.help.message")%>

                                </div>
                            </div>      


                            <p style="width: 15px"></p>
                            <div id="disconnect">
                                <input id="submit" name="submit" type="submit"   value="<%=appMsg.getString("f.home")%>" class="inputButtonDis"/>
                            </div>

                    </div>
                    </form>
                </div>
            </div>
        </div>
        <p></p>

        <!-- Slider  SECTION BANNER-3 -->
        <div class="row">
            <div class="col-md-12 slider" id="main-slider3"> <!--outermost container element -->
                <div class="add-space-3"><!-- innermost wrapper element -->
                    <div id="banner_space_3">

                        <% if (!StringHelper.isNullOrEmptyObject(obj.get("banner_space_3"))) {%>

                        <%=obj.get("banner_space_3")%>

                        <%} else {%>
                          
                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" style="max-height: 120px" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_bottom.png" alt=""></a>
                            <%}%>
                    </div>
                </div>
                <span class="txtSub"><!--Text Here --></span>
            </div> 
        </div>
        <jsp:include  page="../layout/Footer.jsp" flush="" ></jsp:include>
        </div>
        <!-- Slider  SECTION BANNER-3 -->


    </body>
</html>


<%
    } catch (Exception ex) {

        logger.log(Level.ALL, ex.getMessage());
        response.sendRedirect(controllerCom + "Error.jsp");
    }


%>



<%!
    public JSONObject getImage(String macvlan, String vlan, String page, String userAgent) {

        JSONObject obj = new JSONObject();

        try {
            PropertyEncoder commonAllPE = WIFILayoutManager.getCommonMsg();

            {

                BannerEngineReferences bannerEngineReferences = BannerEngine
                        .getCampaignBannerImage(macvlan,
                                vlan, page, "S1", userAgent,
                                commonAllPE.getString("lba.redirect.url") + "iLasRedirectApi.jsp", null,
                                commonAllPE.getString("lba.image.path"));

                if (bannerEngineReferences.isIsBannerFound()) {
                    obj.put("RESULT", "Success");
                    obj.put("RESULT_CODE", "0");
                    obj.put("banner_space_1", bannerEngineReferences.getAdInventoryMap().get(Constants.INV_SPACE_TYPE.S1.name()));
                    obj.put("banner_space_2", bannerEngineReferences.getAdInventoryMap().get(Constants.INV_SPACE_TYPE.S2.name()));
                    obj.put("banner_space_3", bannerEngineReferences.getAdInventoryMap().get(Constants.INV_SPACE_TYPE.S3.name()));
                    //obj.put("banner_space_4", bannerEngineReferences.getAdInventoryMap().get(Constants.INV_SPACE_TYPE.S4.name()));
                } else {
                    obj.put("RESULT", "Failure");
                    obj.put("RESULT_CODE", "100");
                }

            }

        } catch (Exception ex) {

        }
        return obj;

    }

%>