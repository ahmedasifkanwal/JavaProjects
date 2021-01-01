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

<%

    String styleExistigUser = "", controllerCom = null, controller = null, mobileNumber = "", mobileNumberdis = "", verificationToken = "", countryCode = "968", countryCodedis = "968";
    Result result = null;
    Map errorMap = null;
    PeLogin peLogin = null;
    PropertyEncoder appMsg = null;
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
    JSONObject obj = null;

    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");

        styleExistigUser = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "style=\"display: inline\"" : "style=\"display: none\"";
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/common/";
        controller = request.getContextPath() + "/fixedtemplate/Banner1/controller/VerificationController.jsp?uam=" + peLogin.getPaymentMethodName() + "&lang=" + peLogin.LANG();
        appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());

        if (!StringUtil.isNullOrEmpty(peLogin.getCountryCode())) {
            countryCode = peLogin.getCountryCode();
            countryCodedis = countryCode;
        }
        if (!StringUtil.isNullOrEmpty(peLogin.getMobileNo())) {
            mobileNumber = peLogin.getMobileNo();
            mobileNumberdis = mobileNumber;
        }
        if (!StringUtil.isNullOrEmpty(peLogin.getVerificationToken())) {
            verificationToken = peLogin.getVerificationToken();
        }

        if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
            errorMap = result.getExceptionMessages();
        }

        //Banner Logic
        obj = getImage(peLogin.getMacvlan(), peLogin.getVlan(), "P2", request.getHeader("User-Agent").toString());
        obj.get("banner_space_1");
        obj.get("banner_space_2");
        obj.get("banner_space_3");
        //Banner Logic
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Verification Form</title>
    </head>

    <body>

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


                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_top.png" alt=""></a>



                            <%}%></div>
                    </div>
                    <span class="txtSub"><!--Text Here --></span>
                </div> 

                <!-- Slider  SECTION BANNER-1 -->
            </div>
            <p></p>

            <!-- Slider  SECTION BANNER-2 -->
            <div class="row" >
                <div class="col-md-12 slider" id="main-slider2"> <!--outermost container element -->
                    <div class="add-space-2"  style="width: 100%;height: 120px;position: relative; "><!-- innermost wrapper element -->
                        <div class="banner_space_2">

                            <% if (!StringHelper.isNullOrEmptyObject(obj.get("banner_space_2"))) {%>

                            <%=obj.get("banner_space_2")%>

                            <%} else {%>

                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_middle.png" alt=""></a>

                            <%}%>

                        </div>
                    </div>
                    <span class="txtSub"><br><!--Text Here --></span>
                </div> 
            </div>                    
            <!-- Slider  SECTION BANNER-2 -->
            <div class="row" >
                <div class="col-md-12 dbg">


                    <!-- changed --> 

                    <form name="theform" id="theform" action="<%=controller%>"  method="post"  >
                        <input  type="hidden" id ="username"  name ="username"  value="<%=peLogin.getUsername()%> " />
                        <input  type="hidden" id="countryCode"  name="countryCode" value="<%=countryCode%> " />
                        <input  type="hidden" id="mobileNumber"  name="mobileNumber" value="<%=mobileNumber%> " />
                        <div class="row">

                            <div style="width: 20%"></div>

                            <!-- Component 1--> 
                            <div class="col-md-2 echrowpad" style="margin-top: 3vh;">
                                <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                <div id="error" class="frmTxtWar"> <%=result.getMessage()%> </div>
                                <%}%>
                                <div class="frmTxt">Mobile Number</div>  
                                <input disabled="true" name="mobileNumberdis" type="text" class="input pass" id="mobileNumberdis" maxlength="12"  value="<%=countryCode + mobileNumber%>"/>
                            </div>

                            <!-- Component 2--> 
                            <div class="col-md-2 echrowpad" style="margin-top: 3vh;">
                                <input name="verificationToken" type="text" class="input pass" id="verificationToken" size="8"  maxlength="15"  placeholder="Enter Verification Code*" value="<%=verificationToken%>"/>
                                <span class="textfieldserror">  <%if (errorMap != null) {%>
                                    <%=errorMap.containsKey("countryCode") ? errorMap.get("countryCode") : ""%>
                                    <%}%> </span>
                            </div>

                            <!-- Component 3--> 
                            <div class="col-md-2 echrowpadb" style="margin-top: 3vh;">
                                <input id="submit" name="submit" type="submit" value=" <%=appMsg.getString("f.verify")%>" class="enter_button inputButton inputbuttonm"  />
                            </div>

                            <!-- Component 4--> 
                            <div class="col-md-2 echrowpadb" style="margin-top: 3vh;"> 
                               <input   id="Register_New" name="Register_New" type="submit" value=" <%=appMsg.getString("f.register.new.account")%>" class="enter_button inputButton inputbuttonminputbuttonm" />
                            </div>

                        </div> 
                    </form> 
                </div>
            </div>
            <p></p>

            <!-- END --> 


            <!-- Slider  SECTION BANNER-3 -->
            <div class="row">
                <div class="col-md-12 slider" id="main-slider3"> <!--outermost container element -->
                    <div class="add-space-3"><!-- innermost wrapper element -->
                        <div id="banner_space_3">

                            <% if (!StringHelper.isNullOrEmptyObject(obj.get("banner_space_3"))) {%>

                            <%=obj.get("banner_space_3")%>

                            <%} else {%>
                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_bottom.png" alt=""></a>

                            <%}%>
                        </div>
                    </div>
                    <span class="txtSub"><!--Text Here --></span>
                </div> 
            </div>
            <p></p>
            <!-- Slider  SECTION BANNER-3 -->
            <jsp:include  page="../layout/Footer.jsp" flush="" ></jsp:include>
            </div>

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