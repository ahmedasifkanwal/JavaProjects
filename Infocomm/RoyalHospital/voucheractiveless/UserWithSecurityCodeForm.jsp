
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.business.facade.CountryFacade"%>
<%@page import="com.info.wifi.cms.entity.Country"%>
<%@page import="java.util.List"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>

<%
    String styleExistigUser = "";
    String controller = "", mobileNumber = "", verificationToken = "", countryCode = WIFIConstants.DEFAULT_COUNTRY_CODE;
    Result result = null;
    Map errorMap = null;
    PropertyEncoder appMsg = null;
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
    PeLogin peLogin = null;
    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");  peLogin.setLocale(new Locale(""));
        styleExistigUser = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "style=\"display: inline\"" : "style=\"display: none\"";
        peLogin = (PeLogin) session.getAttribute("peLogin");
        controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/UserWithSecurityCodeController.jsp?lang=en";

        appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());
        countryCode = !StringUtil.isNullOrEmpty(peLogin.getCountryCode()) ? peLogin.getCountryCode() : WIFIConstants.DEFAULT_COUNTRY_CODE;
        mobileNumber = !StringUtil.isNullOrEmpty(peLogin.getMobileNo()) ? peLogin.getMobileNo() : "";
        verificationToken = !StringUtil.isNullOrEmpty(peLogin.getVerificationToken()) ? peLogin.getVerificationToken() : "";
        if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
            errorMap = result.getExceptionMessages();
        }


%>

<!DOCTYPE html>
<html>
    <head>

    </head>
    <jsp:include page="../layout/Header.jsp"></jsp:include>
    <body id="top">
        <script  type="text/javascript"  >

                var tpj = jQuery;
                tpj.noConflict();

                tpj(document).ready(function() {

                    if (tpj.fn.cssOriginal != undefined)
                        tpj.fn.css = tpj.fn.cssOriginal;

                    tpj('.fullscreenbanner').revolution(
                            {
                                delay: 2000,
                                startwidth: 1170,
                                startheight: 600,
                                onHoverStop: "on", // Stop Banner Timet at Hover on Slide on/off

                                thumbWidth: 100, // Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
                                thumbHeight: 50,
                                thumbAmount: 3,
                                hideThumbs: 0,
                                navigationType: "bullet", // bullet, thumb, none
                                navigationArrows: "solo", // nexttobullets, solo (old name verticalcentered), none

                                navigationStyle: false, // round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom


                                navigationHAlign: "left", // Vertical Align top,center,bottom
                                navigationVAlign: "bottom", // Horizontal Align left,center,right
                                navigationHOffset: 30,
                                navigationVOffset: 30,
                                soloArrowLeftHalign: "left",
                                soloArrowLeftValign: "center",
                                soloArrowLeftHOffset: 20,
                                soloArrowLeftVOffset: 0,
                                soloArrowRightHalign: "right",
                                soloArrowRightValign: "center",
                                soloArrowRightHOffset: 20,
                                soloArrowRightVOffset: 0,
                                touchenabled: "on", // Enable Swipe Function : on/off


                                stopAtSlide: -1, // Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
                                stopAfterLoops: -1, // Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic

                                hideCaptionAtLimit: 0, // It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
                                hideAllCaptionAtLilmit: 0, // Hide all The Captions if Width of Browser is less then this value
                                hideSliderAtLimit: 0, // Hide the whole slider, and stop also functions if Width of Browser is less than this value


                                fullWidth: "on", // Same time only Enable FullScreen of FullWidth !!
                                fullScreen: "off", // Same time only Enable FullScreen of FullWidth !!


                                shadow: 3								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)

                            });


                });
            </script>
          
            <!--
                    #################################
                            - THEMEPUNCH BANNER -
                    #################################
            -->
            <div id="dajy" class="fullscreen-container mtslide sliderbg fixed" style="border-bottom-width: 5px;
                 border-bottom-style: solid;
                 border-bottom-color: #FC3;" >
                <div class="fullscreenbanner" >
                    <ul>

                        <!-- papercut fade turnoff flyin slideright slideleft slideup slidedown-->
                        <!-- FADE -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500"> <img src="images/slider/3.jpg" alt=""/>

                        </li>

                        <!-- FADE -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500"> <img src="images/slider/1.jpg" alt=""/>

                        </li>

                        <!-- FADE -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500"> <img src="images/slider/2.jpg" alt=""/>

                        </li>


                    </ul>
                    <div class="tp-bannertimer none"></div>
                </div>
            </div>

            <!--
                            ##############################
                             - ACTIVATE THE BANNER HERE -
                            ##############################
            -->


            <!-- WRAP -->
            <div class="wrap cstyle03">
                <div class="container mt-200 z-index100" id="loginboxtop">

                    <div class="row col-md-12" id="loginmobile">
                        <div class="col-md-4" id="loginmobile_right" >


                            <div class="bs-example bs-example-tabs cstyle04">
                                <ul class="nav nav-tabs" id="myTab">

                                    <li onClick="mySelectUpdate()" class="active"><a data-toggle="tab" href="#tabstaff"><span class="hotel"></span>VISITOR</a></li>


                                </ul>
                                <div class="tab-content" id="myTabContent">




                                    <form name="theform" id="theform" action="<%=controller%>"    method="post"  >
                                    <INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="ENTER"/>

                                    <div class="w100percent">




                                        <%if (errorMap != null || result != null) {%>
                                        <div class="alert alert-warning fade in">
                                            <%= !StringUtil.isNullOrEmpty(result.getMessage()) ? result.getMessage() + "</br>" : ""%>

                                            <% if (errorMap != null) {%>
                                            <%=errorMap.containsKey("mobileNumber") ? errorMap.get("mobileNumber") + "</br>" : ""%>
                                            <%=errorMap.containsKey("verificationToken") ? errorMap.get("verificationToken") : ""%>
                                            <%}%>


                                        </div>
                                        <%}%>


                                        <jsp:include page="../layout/CountryCode.jsp" ></jsp:include>
                                    </div>

                                        <div class="clearfix"></div>


                                        <div class="w100percent">
                                            <div class="wh90percent textleft"> <span class="opensans size13">
                                                    <b><%=appMsg.getString("f.mobile.no")%>...</b></span><br>


                                            <input name="mobileNumber" type="text" class="form-control" id="mobileNumber" maxlength="12" value="<%=mobileNumber%>"/>

                                        </div>
                                        </div>

                                            <div class="clearfix"></div>


                                    <div class="w100percent">
                                        <div class="wh90percent textleft"> <span class="opensans size13">
                                                <b><%=appMsg.getString("f.auth.code")%></b></span><br>



                                                <input name="verificationToken" type="text" class="form-control" id="userName" maxlength="15" value="<%=verificationToken%>"/>


                                        </div>


                                            <div class="clearfix"></div>
                                            <div class="room1 margtop15" style="text-align:center; margin-right: 60px;">

                                            <input id="Enter" name="Enter" type="submit"  align="center" value="<%=appMsg.getString("f.enter")%>" class="btn-search"  />

                                            <input id="Register_New" name="Register_New" type="submit"  align="center" value=" <%=appMsg.getString("f.register.new.account")%>" class="btn-search" style="width:98%;"  />

                                        </div>


                                    </div>



                                    </form>









                                </div>

                            </div>



                        </div>

                    </div>


                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="shadow cstyle05">
                                                        <div class="fwi one"><img src="images/refreshed300.png" alt="" />
                                                            <div class="mhover none"><span class="icon"><a href="http://www.omantel.om/OmanWebLib/Individual/Promotions/smartphones_promotion_2015.aspx?linkId=930&MenuId=1148" target="_blank"><img src="images/spacer.png" alt=""/></a></span></div>
                                                        </div>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="shadow cstyle05">
                            <div class="fwi one"><img src="images/rome.jpg" alt="" />
                                <div class="mhover none"><span class="icon"><a href="http://www.omantel.om/OmanWebLib/Individual/Promotions/mada_silver_2015.aspx?linkId=930&MenuId=1134" target="_blank"><img src="images/spacer.png" alt=""/></a></span></div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="shadow cstyle05">
                            <div class="fwi one"><img src="images/surfer.jpg" alt="" />
                                <div class="mhover none"><span class="icon"><a href="http://www.omantel.om/OmanWebLib/Individual/Promotions/makasib_citycinema.aspx?linkId=930&MenuId=1148" target="_blank"><img src="images/spacer.png" alt=""/></a></span></div>
                            </div>

                        </div>
                    </div>
                </div>



                </div>
                <jsp:include page="../layout/Footer.jsp"/>
            </div>

        </body>
</html>






<%
    } catch (Exception ex) {

        logger.log(Level.ALL, ex.getMessage());
      
    }


%>