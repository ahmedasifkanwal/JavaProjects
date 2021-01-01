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

    String styleExistigUser = "";
    String controller = "", controllerCom = "", mobileNumber = "", verificationToken = "", countryCode = WIFIConstants.DEFAULT_COUNTRY_CODE;
    Result result = null;
    Map errorMap = null;
    PropertyEncoder appMsg = null;
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
    PeLogin peLogin = null;
    JSONObject obj = null;

    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
        styleExistigUser = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "style=\"display: inline\"" : "style=\"display: none\"";

        controller = request.getContextPath() + "/fixedtemplate/Banner1/controller/UserWithSecurityCodeController.jsp?uam=" + peLogin.getPaymentMethodName() + "&lang=" + peLogin.LANG();
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/common/";

        appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());
        countryCode = !StringUtil.isNullOrEmpty(peLogin.getCountryCode()) ? peLogin.getCountryCode() : WIFIConstants.DEFAULT_COUNTRY_CODE;
        mobileNumber = !StringUtil.isNullOrEmpty(peLogin.getMobileNo()) ? peLogin.getMobileNo() : "";
        verificationToken = !StringUtil.isNullOrEmpty(peLogin.getVerificationToken()) ? peLogin.getVerificationToken() : "";
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
        <title>Welcome to Wi-Fi</title>
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

                    <form name="theform" id="theform" action="<%=controller%>"  method="post" >
                        <INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="ENTER"/>
                        <div class="row">

                            <div style="width: 20%"></div>

                            <!-- Component 1--> 
                            <div class="col-md-2 echrowpad" style="margin-top: 3vh;margin-bottom: -3vh">

                            </div>

                            <!-- Component 2--> 
                            <div class="col-md-2 echrowpad" style="margin-top: 3vh;">
                                <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                <div class="error_code_main" > <%=result.getMessage()%></div>
                                <%}%>
                                <div class="frmTxt" style="display: none"> <%=appMsg.getString("f.country.code")%></div>
                                <div class="frmTxt">                                    <%if (errorMap != null) {%>
                                    <%=errorMap.containsKey("countryCode") ? errorMap.get("countryCode") : ""%>
                                    <%}%>
                                </div>     
                                <div class="loginfield"  style="display: none" >
                                    <select    id="countryCode"  name="countryCode" tabindex="1"    >
                                        <option value="">Select Country</option>
                                        <%
                                            List<Country> countryList = new CountryFacade().getCountryCode();
                                            for (int j = 0; j < countryList.size(); j++) {

                                                {
                                                    if (countryCode.equals(countryList.get(j).getCountryCode())) {
                                                        out.print("<option selected value=\"" + countryList.get(j).getCountryCode() + "\">" + countryList.get(j).getCountryName() + " - " + countryList.get(j).getCountryCode() + "</option>");
                                                    } else {
                                                        out.print("<option value=\"" + countryList.get(j).getCountryCode() + "\">" + countryList.get(j).getCountryName() + " - " + countryList.get(j).getCountryCode() + "</option>");
                                                    }
                                                }
                                            }

                                        %>
                                    </select>
                                </div>
                                <div class="formlabel" style="display: none"> <%=appMsg.getString("f.mobile.no")%></div>
                                <div class="error_code">
                                    <%if (errorMap != null) {%>
                                    <%=errorMap.containsKey("mobileNumber") ? errorMap.get("mobileNumber") : ""%>
                                    <%}%>
                                </div>
                                <div class="loginfield" style="display: none">
                                    <input name="mobileNumber" type="text" class="login" id="mobileNumber" maxlength="12" value="<%=mobileNumber%>"/>
                                </div>
                                <div class="formlabel" style="padding:10px 0 10px 15px"> <%=appMsg.getString("f.auth.code")%> / Login via OTP</div>
                                <input name="verificationToken" type="text" class="input pass" id="userName" maxlength="15" value="<%=verificationToken%>"/>
                                <div class="frmTxtWar">
                                    <%if (errorMap != null) {%>
                                    <%=errorMap.containsKey("verificationToken") ? errorMap.get("verificationToken") : ""%>
                                    <%}%>
                                </div>
                            </div>

                            <!-- Component 3--> 
                            <div class="col-md-2 echrowpadb" style="margin-top: 3vh;">
                                <input id="Enter" name="Enter" type="submit" value="<%=appMsg.getString("f.enter")%>" class="inputButton inputbuttonm"  />
                            </div>

                            <!-- Component 4--> 
                            <div class="col-md-2 echrowpadb" style="margin-top: 3vh;"> 
                                <input id="Register_New" name="Register_New" type="submit"  align="center" value=" <%=appMsg.getString("f.register.new.account")%>" class="inputButton inputbuttonm"/>
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