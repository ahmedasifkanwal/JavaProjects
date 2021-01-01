<%-- 
    Document   : LoginSuccessSubmit
    Created on : June 25, 2013, 2:16:37 PM
    Author     : Saleem Javed
--%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.rad.util.StringHelper"%>
<%@page import="java.util.Locale"%>
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

    Integer timeleft = 0;
    Integer accessType = 0;
    Result result = new Result();
    PropertyEncoder appMsg = null, commonMsg = null;

    PeLogin peLogin = null;
    String mac_vlan = "", breadCrum = "", controller = "", paymentDetailsRow = "";

    String paymentDetails = "";
    try {

        if (session.getAttribute("peLogin") != null) {
            session.removeAttribute("Result");
            peLogin = (PeLogin) session.getAttribute("peLogin");
            peLogin.setLocale(new Locale(""));
            mac_vlan = peLogin.getMacvlan();

            appMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());
            commonMsg = WIFILayoutManager.getCommonMsg();
            controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/LogoutController.jsp?lang=en";

            if (peLogin.getTimeLeft() <= 0 && !StringHelper.isNullOrEmpty(peLogin.getUsername())) {

                   System.out.print("[TIME ZERO IN SESSION]:" + peLogin.getOwnerName());
                Accountuser accountuser = new LoginCommonFacade().findLoggedUser(peLogin.getUsername());

                if (accountuser != null) {
                    timeleft = accountuser.getTimeleft();
                    peLogin.setTimeLeft(timeleft);
                    accessType = accountuser.getAccessType();
                    session.setAttribute("peLogin", peLogin);
                } else {
                    System.out.print("[USER ROYAL NOT FOUND IN DB]:" + peLogin.getUsername());
                }

            } else {
               // System.out.print("[USER ON ROYAL SUCC PAGE]:TIME:" + peLogin.getTimeLeft() + ":USER:" + peLogin.getUsername());
            }
            /*accountuser = new LoginCommonFacade().findLoggedUser(peLogin.getUsername());            logger.info("user found in account user=" + accountuser);
             if (accountuser != null) {
                  //accountuser.
                  timeleft = accountuser.getTimeleft();
                  peLogin.setTimeLeft(timeleft);
                  accessType = accountuser.getAccessType();

                  // timeleft =DateHelper.timeleftSecond(accountuser.getDateFirstlogin(), accountuser.getTimeleft(),accountuser.getUserType(),accountuser.getUsername()) ;
                  session.setAttribute("peLogin", peLogin);

                  }*/
                 timeleft = peLogin.getTimeLeft();
             } else {
                 String msg = "Session Expired";
          
                 response.sendRedirect(request.getContextPath() + "/ApplicationError.jsp?cause=PDA INDEX&error=" + msg);
                 return;
        }


%>

<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            window.onbeforeunload = warnUser;
            function warnUser() {

                var s = "<%=appMsg.getString("info.warn.user")%>";
                s = s.replace(/&#(\d+);/g,
                        function($1, $2) {
                            return String.fromCharCode($2);
                        });

                return s;
            }

            function Minimize()
            {
                window.innerWidth = 100;
                window.innerHeight = 100;
                window.screenX = screen.width;
                window.screenY = screen.height;

            }

            function Maximize()
            {
                window.innerWidth = 500;
                window.innerHeight = 500;
                window.screenX = 0;
                window.screenY = 0;
                alwaysLowered = false;
            }

            function action() {
                if (event.srcElement.id == 'min') {
                    //alert("Minimize");
                    Minimize()
                }
                return false;
            }

            function popUp(strURL) {

                day = new Date();
                id = day.getTime();
                popupHeight = 600;
                popupWidth = 768;
                popupTop = (window.screen.availHeight - popupHeight) / 2;
                popupLeft = (window.screen.availWidth - popupWidth) / 2;

                window1 = window.open(strURL, 'messageWindow', 'top=' + popupTop + ',left=' + popupLeft + ',height=' + popupHeight + ',width=' + popupWidth + ',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=yes');
                if (window1.opener == null)
                    window1.opener = self;
                return false;
            }
        </script>
        <script type="text/javascript">

            var timer = null;
            var balance = <%=timeleft%>;

            function StartTimer()
            {

                BalanceTime();
                timer = setInterval("BalanceTime()", 1000);

            }
            function BalanceTime()
            {

                PrintTime(balance);

                if (balance < 1)
                {
                    alert("Your session has been expired.");
                    clearInterval(timer);
                    // document.getElementById("waiticon").style.display = "none";
                }

                balance--;
            }
            function PrintTime(sec)
            {
                hour = Math.floor(sec / 3600);
                sec = sec - (hour * 3600);
                min = Math.floor(sec / 60);
                sec -= min * 60;

                if (hour <= 0)
                {
                    hour = '0';
                }
                if (hour < 10)
                {
                    hour = '0' + hour;
                }


                if (min <= 0)
                {
                    min = '0';
                }
                if (min < 10)
                {
                    min = '0' + min;
                }

                if (sec <= 0)
                {
                    sec = '0';
                }
                if (sec < 10)
                {
                    sec = '0' + sec;
                }



                output = hour + ':' + min + ':' + sec;

                Write(output, hour, min, sec);
            }

            function Write(text, hour, min, sec)
            {

                document.form.timer_sec.value = sec;
                document.form.timer_min.value = min;
                document.form.timer_hour.value = hour;
                document.title = text + " remaining";
            }




            //-->
        </script>
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
                                    <form name="form"  method="post"  action="<%=controller%>"  >
                                    <div class="login_box">
                                        <div class="login_inside_border">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="success_txt"  >
                                                <tr>
                                                    <td align="center" valign="top"  ><div class="alert-success">
                                                            <h1 class="success"><%=appMsg.getString("f.login.success")%></h1>
                                                        </div></td>
                                                </tr>
                                                <tr>
                                                    <td align="center"  ><%=appMsg.getString("f.login.successfull.welcome").replace("{0}", peLogin.getOwnerName())%></td>
                                                </tr>




                                                <tr class="click_here">
                                                    <td align="center"  ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px; margin-bottom:20px;">
                                                            <tr>
                                                                <td align="center"><input type="text" name="timer_hour" size="2"  class="login_time"  readonly="readonly"    />
                                                                </td>
                                                                <td align="center"><input type="text" name="timer_min" size="2"  class="login_time"  readonly="readonly"    />
                                                                </td>
                                                                <td align="center"><input type="text" name="timer_sec" size="2"  class="login_time"  readonly="readonly"   /></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Hours</td>
                                                                <td align="center">Minutes</td>
                                                                <td align="center">Seconds</td>
                                                            </tr>
                                                        </table></td>
                                                </tr>

                                                <tr >
                                                    <td height="5"  ></td>
                                                </tr>
                                                <tr class="click_here">
                                                    <td align="center"  ><span class="button1">
                                                            <input id="submit" name="submit" type="submit"  align="center" value="<%=appMsg.getString("f.disconnect")%>" class="general-button"  />
                                                        </span></td>
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
</html>
<script type="text/javascript">


    StartTimer();



</script>


<%
    } catch (Exception ex) {
        logger.log(Level.SEVERE, "LoginSuccessForm:System Error");
        if (result.getMessage() == null) {
            result.setMessage("LoginSuccessForm:System Error");
        }
        session.setAttribute("Result", result);
        throw ex;
    } finally {

        //session.invalidate();
        ///logger.log(Level.SEVERE, "Session Closed");
    }%>
