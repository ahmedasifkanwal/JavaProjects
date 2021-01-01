<%-- 
    Document   : LoginSuccessSubmit
    Created on : June 25, 2013, 2:16:37 PM
    Author     : Saleem Javed
--%>
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

    PropertyEncoder appMsg = null, commonMsg = null;
    Accountuser accountuser = null;
    PeLogin peLogin = null;
    String mac_vlan = "", breadCrum = "", paymentDetailsRow = "", controller = "";

    String paymentDetails = "";
    try {

        if (session.getAttribute("peLogin") != null) {
            session.removeAttribute("Result");
            peLogin = (PeLogin) session.getAttribute("peLogin");
            controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/voucherless/free.jsp";

            mac_vlan = peLogin.getMacvlan();

            appMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());
            commonMsg = WIFILayoutManager.getCommonMsg();
            accountuser = new LoginCommonFacade().findLoggedUser(peLogin.getUsername());
            logger.info("user found in account user=" + accountuser);
            if (accountuser != null) {
                //accountuser.
                timeleft = accountuser.getTimeleft();
                peLogin.setTimeLeft(timeleft);
                accessType = accountuser.getAccessType();

                // timeleft =DateHelper.timeleftSecond(accountuser.getDateFirstlogin(), accountuser.getTimeleft(),accountuser.getUserType(),accountuser.getUsername()) ;
                session.setAttribute("peLogin", peLogin);

            }

        }


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-90727104-1', 'auto');
    ga('send', 'pageview');

</script>

<head>
    <jsp:include page="../layout/Style.jsp"></jsp:include>
        <style>
            html {
                height: 100%;
            }
            body {
                padding: 0;
                text-align: center;
                font-family: 'open sans';
                position: relative;
                margin: 0;
                height: 100%;
            }
            .ptr-space {
                background: url(stardust.html) repeat;
            }
            .wrapper {
                height: auto !important;
                height: 100%;
                margin: 0 auto;
                overflow: hidden;
            }
            a {
                text-decoration: none;
            }
            h1, h2 {
                width: 100%;
                float: left;
            }
            h1 {
                margin-top: 100px;
                color: #fff;
                margin-bottom: 5px;
                font-size: 70px;
                font-weight: 100;
            }
            h2 {
                padding: 00px 20px 30px 20px;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                letter-spacing: 0px;
                color: #ddd;
                font-size: 20px;
                line-height: 160%;
                font-weight: 100;
                margin-top: 10px;
                margin-bottom: 0;
            }
            .pointer {
                color: #00B0FF;
                font-family: 'Pacifico';
                font-size: 24px;
                margin-top: 15px;
                position: absolute;
                top: 130px;
                right: -40px;
            }
            .pointer2 {
                color: #00B0FF;
                font-family: 'Pacifico';
                font-size: 24px;
                margin-top: 15px;
                position: absolute;
                top: 130px;
                left: -40px;
            }
            pre {
                margin: 80px auto;
            }
            pre code {
                padding: 35px;
                border-radius: 5px;
                font-size: 15px;
                background: rgba(0,0,0,0.1);
                border: rgba(0,0,0,0.05) 5px solid;
                max-width: 500px;
            }
            .main {
                float: left;
                width: 100%;
                margin: 0 auto;
            }
            .main h1 {
                padding: 20px 50px 10px;
                float: left;
                width: 100%;
                font-size: 60px;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                font-weight: 100;
                margin: 0;
                padding-top: 55px;
                font-family: 'Open Sans';
                letter-spacing: -1px;
                text-transform: capitalize;
            }
            .main h1.demo1 {
                background: #1ABC9C;
            }
            .reload.bell {
                font-size: 12px;
                padding: 20px;
                width: 45px;
                text-align: center;
                height: 47px;
                border-radius: 50px;
                -webkit-border-radius: 50px;
                -moz-border-radius: 50px;
            }
            .reload.bell #notification {
                font-size: 25px;
                line-height: 140%;
            }
            .reload, .btn {
                display: inline-block;
                border-radius: 3px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                display: inline-block;
                line-height: 100%;
                padding: 0.7em;
                text-decoration: none;
                width: 100px;
                line-height: 140%;
                font-size: 17px;
                font-weight: bold;
                -webkit-box-shadow: none;
                box-shadow: none;
                background-color: #4D90FE;
                background-image: -webkit-linear-gradient(top, #4D90FE, #4787ED);
                background-image: -webkit-moz-gradient(top, #4D90FE, #4787ED);
                background-image: linear-gradient(top, #4d90fe, #4787ed);
                border: 1px solid #3079ED;
                color: #FFF;
            }
            .reload:hover {
                background: #317af2;
            }
            .btn {
                width: 200px;
                -webkit-box-shadow: none;
                box-shadow: none;
                background-color: #4D90FE;
                background-image: -webkit-linear-gradient(top, #4D90FE, #4787ED);
                background-image: -moz-linear-gradient(top, #4D90FE, #4787ED);
                background-image: linear-gradient(top, #4d90fe, #4787ed);
                border: 1px solid #3079ED;
                color: #FFF;
            }
            .clear {
                width: auto;
            }
            .btn:hover, .btn:hover {
                background: #317af2;
            }
            .btns {
                float: left;
                width: 100%;
                margin: 50px auto;
            }
            .credit {
                text-align: center;
                color: #ddd;
                padding: 10px 10px;
                margin: 0 0 0 0;
                background: rgba(255, 255, 255, 0.09);
                float: left;
                width: 100%;
                margin-bottom: 50px;
            }
            .credit a {
                text-decoration: none;
                font-weight: bold;
                color: white;
            }
            .back {
                position: absolute;
                top: 0;
                left: 0;
                text-align: center;
                display: block;
                padding: 7px;
                width: 100%;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                background: rgba(255, 255, 255, 0.09);
                font-weight: bold;
                font-size: 13px;
                color: #bbb;
                -webkit-transition: all 200ms ease-out;
                -moz-transition: all 200ms ease-out;
                -o-transition: all 200ms ease-out;
                transition: all 200ms ease-out;
                color: #fff;
            }
            .back:hover {
                background: #fff;
                color: #000;
            }
            .page-container {
                float: left;
                width: 100%;
                margin: 0 auto 300px;
                position: relative;
            }
            .header {
                overflow: hidden;
                clear: both;
            }
            .bg {
                position: fixed;
                min-height: 100% !important;
                width: 100%;
                z-index: 0;
                top: 0
            }
            .ibg-bg {
                position: absolute;
                width: 110%;
            }
            #btns {
                width: 250px;
                text-align: center;
                margin: 0 auto;
                height: 50px;
                overflow: hidden;
                float: none;
            }

        </style>
    </head>  








    <body >




        <link rel="stylesheet" href="css/demo.css">
            <!-- image move -->
            </head>
            <body >






                <div class="ab-parallex mobile" id="scene" style="" >
                    <script type="text/javascript">
                        $(function() {
                            $(document).ready(function() {
                                $.parallaxify({
                                    positionProperty: 'transform',
                                    responsive: true,
                                    motionType: 'natural',
                                    mouseMotionType: 'performance',
                                    motionAngleX: 3,
                                    motionAngleY: 30,
                                    alphaFilter: 0.5,
                                    adjustBasePosition: true,
                                    alphaPosition: 0.025,
                                    calibrationThreshold: 100,
                                    calibrationDelay: 500,
                                    supportDelay: 500,
                                });



                            });
                        }); // */
                    </script>
                    <div class="layer main demo" data-depth="1.0" data-parallaxify-range="10" data-parallaxify-range-x="280" data-parallaxify-range-y="160" style=""  >
                        <img src="interactive_bg/free.jpg" alt="" style="min-width:1000px;width:100%;height:auto; margin-left:-190px; transition: .5s; transform: translateZ( +100px );" >
                    </div>
                </div>


                <div class="ab-parallex laptop" id="scene" >
                    <script type="text/javascript">
                        $(function() {
                            $(document).ready(function() {
                                $.parallaxify({
                                    positionProperty: 'transform',
                                    responsive: true,
                                    motionType: 'natural',
                                    mouseMotionType: 'performance',
                                    motionAngleX: 30,
                                    motionAngleY: 30,
                                    alphaFilter: 0.5,
                                    adjustBasePosition: true,
                                    alphaPosition: 0.025,
                                });



                            });
                        }); // */
                    </script>
                    <div class="layer main demo" data-depth="1.0"    data-parallaxify-range-x="250" data-parallaxify-range-y="160" >
                        <img src="interactive_bg/free.jpg" alt="" style="min-width:900px;width:100%;height:auto;" >
                    </div>
                </div>

                <!-- loading -->
                <div class="se-pre-con"></div>

                <!-- loading -->
                <div class="gridContainer clearfix">
                    <div class="wrapper bg">
                        <app-header header="header" class="ng-scope ng-isolate-scope">
                            <header class="black cobranded" ><span class="logo whitelabeled ng-scope" style="background: rgba(0,0,0,0.1);" >
                                    <img  src="images/omantel.png" ></span><span ng-show="!cobrand.haveLogo()" class="ng-binding">Free internet access for Omantel Subscribers</span> </header>
                        </app-header>
                        <popup class="popup payPopup userValidate ng-scope appear">
                            <div class="tableDisplay">
                                <div class="verticalAlign">
                                    <div class="insidePopup brand">
                                        <img   class="brandLogo ng-scope bigger"   src="images/logo.png" style="">
                                            <div class="clear"></div>
                                            <h1 class="brandName shadow ng-binding ng-scope" >Royal Hospital</h1>
                                            <div class="clear"></div>
                                            </popup>

                                            <form name="form"  method="post"  action="<%=controller%>" >






                                            <box class="ng-isolate-scope">
                                                <div class="box  ">
                                                    <div class="top"></div>
                                                    <div ng-transclude="">
                                                        <p class="ng-binding ng-scope">Start using free WiFi network</p>
                                                        <button type="submit" class="btn green full midi ng-binding ng-scope" >Continue</button>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            </box></form>
                                </div>
                            </div> 
                        </div>  
                    </popup>
                    <!-- pop up --> 
                    <script src="pop/js/classie.js"></script> 
                    <script src="pop/js/uiMorphingButton_fixed.js"></script> 
                    <script src="pop/js/page.js"></script> 
                    <!-- pop up --> 
                    <div class=" "> <div class="bottomGradient"></div></div>



















                    </body>













                </div>



                <%} catch (Exception ex) {
                        ex.getMessage();
                        out.print("Error in success form=" + ex.getMessage());
                    }%>


