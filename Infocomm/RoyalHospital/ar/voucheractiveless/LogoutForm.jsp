<%-- 
    Document   : LoginSuccessSubmit
    Created on : June 25, 2013, 2:16:37 PM
    Author     : Saleem Javed
--%>
<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.cms.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="java.util.List"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.cms.entity.Survey"%>
<%@page import="java.util.Date"%>
<%@page import="com.info.wifi.cms.entity.controller.SurveyResultJpaController"%>
<%@page import="com.info.wifi.cms.entity.controller.SurveyJpaController"%>
<%@page import="com.info.wifi.business.facade.LoginCommonFacade"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.rad.entity.Accountuser"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.logging.Logger" %>
<%!    Logger logger = Logger.getLogger(this.getClass().getName());
%>
<%

    PropertyEncoder appMsg = null;

    PeLogin peLogin = null;
    Result result = null;
        try {

        if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
                }
                if (session.getAttribute("peLogin") != null) {

            peLogin = (PeLogin) session.getAttribute("peLogin");
            peLogin.setLocale(new Locale("ar"));
                appMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());

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
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500"> <img src="images/slider/3.jpg" alt=""/> </li>

                        <!-- FADE -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500"> <img src="images/slider/1.jpg" alt=""/> </li>

                        <!-- FADE -->
                        <li data-transition="fade" data-slotamount="1" data-masterspeed="1500"> <img src="images/slider/2.jpg" alt=""/> </li>
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
                                <div class="tab-content" id="myTabContent" style="padding: 10px;">

                                    <form name="form"  method="post"   >
                                        <div class="login_box">
                                            <div class="login_inside_border">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="success_txt"  >
                                                    <tr>
                                                        <td align="center" valign="top"  >
                                                            <div class="alert-success">
                                                                <h1 class="success"><%=appMsg.getString("info.logout.msg")%></h1>
                                                        </div>
                                                    </td>


                                                </tr>

                                                <tr>
                                                    <td align="center" class="click_here"  ><%=appMsg.getString("info.logout.msg.c1")%>&nbsp;<%=appMsg.getString("info.logout.msg.c2")%> </td>
                                                </tr>

                                                <tr>
                                                    <td align="center" class="click_here"  ><%=appMsg.getString("link.login.now.message")%> </td>
                                                </tr>

                                                <tr>
                                                    <td  >&nbsp;</td>
                                                </tr>
                                                <tr class="click_here">
                                                    <td align="center"  ><%=appMsg.getString("f.help.message")%></td>
                                                </tr>


                                            </table>


                                        </div>
                                        <br />
                                        <div class="clearfix"> </div>
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

    <%} catch (Exception ex) {
           System.out.print("Error in ROY LOGOUT AR form=" + ex.getMessage());
               if (result.getMessage() == null) {
                   result.setMessage("Logout:System Error");
               }
               session.setAttribute("Result", result);
               throw ex;
        }
    %>
</html>