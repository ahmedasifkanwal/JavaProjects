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

    String customerName = "", customerEmail = "", controller = "", controllerCom = "", mobileNumber = "", countryCode = WIFIConstants.DEFAULT_COUNTRY_CODE;
    Result result = null;
    Map errorMap = null;
    PropertyEncoder appMsg = null;
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("WelcomeForm");
    PropertyEncoder commonAllPE = WIFILayoutManager.getCommonMsg();
    PeLogin peLogin = null;
    JSONObject obj = null;
    try {

        peLogin = (PeLogin) session.getAttribute("peLogin");

        peLogin.setLocale(new Locale("ar"));
        session.setAttribute("peLogin", peLogin);
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/common/";

        controller = request.getContextPath() + "/fixedtemplate/Banner1/controller/WelcomeController.jsp?uam=" + peLogin.getPaymentMethodName() + "&lang=" + peLogin.LANG();
        appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());
        countryCode = !StringUtil.isNullOrEmpty(peLogin.getCountryCode()) ? peLogin.getCountryCode() : WIFIConstants.DEFAULT_COUNTRY_CODE;
        mobileNumber = !StringUtil.isNullOrEmpty(peLogin.getMobileNo()) ? peLogin.getMobileNo() : "";
        customerName = !StringUtil.isNullOrEmpty(peLogin.getCustomerName()) ? peLogin.getCustomerName() : "";
        customerEmail = !StringUtil.isNullOrEmpty(peLogin.getCustomerEmail()) ? peLogin.getCustomerEmail() : "";
        if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
            errorMap = result.getExceptionMessages();
        }
        if (request.getParameter("langchange") != null) {
            errorMap = null;
            result = null;
        }
        //Banner Logic
        obj = getImage(peLogin.getMacvlan(), peLogin.getVlan(), "P1", request.getHeader("User-Agent").toString());
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
                           
                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" style="max-height: 120px" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_top_ar.png" alt=""></a>
                           
                            
                            
                            
                            <%}%></div>
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

                        
                        <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" style="max-height: 250px" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_middle_ar.png" alt=""></a>
                          
                            
                            
                            <%}%></div>
                    </div>
                    <span class="txtSub"><!--Text Here --></span>
                </div> 

                <!-- Slider  SECTION BANNER-2 -->
                <div class="col-md-3">
                    <div class="col-md-12 dbg">
                        <form name="theform" id="theform" action="<%=controller%>"  method="post" >
                            <INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="ENTER"/>
                            <div class="start">

                                <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                <div id="error" class="frmTxtWar"> <%=result.getMessage()%> </div>
                                <%}%>

                                <div id="loginbox1">
                                    <div class="frmTxt"></div>     
                                    <span id="spryselect1">
                                        <select    id="countryCode"  name="countryCode" tabindex="1" class="input pass"  >
                                            <option value="">Select Country</option>
                                            <%try {
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
                                                } catch (Exception ex) {
                                                    logger.log(Level.SEVERE, "Exception :" + ex);
                                                    out.print("<option value=\"0\">None</option>");
                                                }
                                            %>
                                        </select>
                                    </span>
                                </div>
                                <div id="loginbox2" >
                                    <input placeholder="Enter Mobile Number*" name="mobileNumber" class="input pass" type="text" class="form-control" id="mobileNumber" maxlength="12" value="<%=mobileNumber%>"/>
                                    <%if (errorMap != null) {%>
                                    <span class="frmTxt"> 
                                        <%=errorMap.containsKey("mobileNumber") ? errorMap.get("mobileNumber") : ""%>
                                    </span>
                                    <%}%> 
                                </div> 
                                <div id="loginbox3">
                                    <input <%=peLogin.getPreviewSTyle()%>  id="Enter" name="Enter" type="submit" value="<%=appMsg.getString("f.enter")%>" class="inputButton"  />
                                </div>

                                <div class="loginbox3">
                                    <input <%=peLogin.getPreviewSTyle()%>  id="User_With_Token" name="User_With_Token" type="submit"  align="center" value=" <%=appMsg.getString("f.user.with.security.code")%>" class="inputButton" style="margin-top:-20px"  /> 
                                  
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
                             
                            
                            <a href="omantel.om" target="_blank"><img class="Bannerimg slide img-fluid img-rounded" style="max-height: 120px" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_p1_s1_bottom_ar.png" alt=""></a>
                           
                              
                              
                              
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