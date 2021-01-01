<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="java.util.Locale"%>
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
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<jsp:include page="../layout/Style.jsp"></jsp:include>



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

    <link rel="stylesheet" href="css/demo.css">
        <!-- image move -->
    </head>
    <body >



        <div class="ab-parallex mobile" id="scene" >
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
                            alphaFilter: 0.9,
                            adjustBasePosition: true,
                            alphaPosition: 0.025,
                        });



                    });
                }); // */
                $(".bg").interactive_bg({
                    strength: 200,
                    scale: 2.0
                });
            </script>


            <div class="layer main demo" data-depth="1.0" data-parallaxify-range="10" data-parallaxify-range-x="270" data-parallaxify-range-y="160" >
                <img src="interactive_bg/free.jpg" alt="" style="min-width:1000px;width:100%;height:auto; margin-left:-190px; transition: .5s; transform: translateZ( +100px );"  >
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
            <div class="layer main demo"    data-parallaxify-range-x="250" data-parallaxify-range-y="160" >
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



                                    <!--------------- Content 1 --------------->


                                <%

                                    String styleExistigUser = "", controllerPage = null, controller = null, mobileNumber = "", mobileNumberdis = "", verificationToken = "", countryCode = "968", countryCodedis = "968";
                                    Result result = null;
                                    Map errorMap = null;
                                    PeLogin peLogin = null;
                                    PropertyEncoder appMsg = null;
                                    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
                                    try {
                                        peLogin = (PeLogin) session.getAttribute("peLogin");
                                        styleExistigUser = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "style=\"display: inline\"" : "style=\"display: none\"";
                                        controllerPage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.LANGFIXED() + "common/";
                                        controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/VerificationController.jsp?lang=en";

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


                                %>





                               

                                   

                                    <table width="95%"  border="0" align="center" cellpadding="2" cellspacing="0"     >




                                        <tr style="display: none;">
                                            <td  width="30%" style="text-align:right"> <%=appMsg.getString("f.country.code")%> </td>
                                            <td   align="center" class="formlabels" width="70%"   > <div class="error_code"> <%if (errorMap != null) {%>
                                                    <%=errorMap.containsKey("countryCode") ? errorMap.get("countryCode") : ""%>
                                                    <%}%> </div>
                                                <select   disabled="true" id="countryCodedis"  name="countryCodedis" tabindex="1"  class="loginsel"    >
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
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align:right"><%=appMsg.getString("f.mobile.no")%> </td>
                                            <td   align="center" class="formlabels">    <div class="error_code"><%if (errorMap != null) {%>
                                                    <%=errorMap.containsKey("mobileNumber") ? errorMap.get("mobileNumber") : ""%>
                                                    <%}%> </div><input disabled="true" name="mobileNumberdis" type="text" class="login" id="mobileNumberdis" maxlength="12"  value="<%=mobileNumber%>"/>
                                            </td>
                                        </tr>

                                        <tr style="display: none;">
                                            <td style="text-align:right"> <%=appMsg.getString("f.auth.code")%> </td>
                                            <td   align="center" class="formlabels">   

                                            </td>
                                        </tr>

                                        <tr>  <tr style="display: none;">
                                                <td style="text-align:right">  </td>
                                                <td   align="center" class="formlabels"> <%=appMsg.getString("f.received.via.sms")%></td>
                                            </tr>

                                    </table>


                                    <div class="button1"  <%=styleExistigUser%>>
                                        <input   id="Existing_User" name="Existing_User" type="submit" align="center" value=" <%=appMsg.getString("f.existing.user.login")%>" class="general-button" style="width:98%;"   />
                                    </div>   <div class="button1" style="display: none;">
                                        <input   id="Register_New" name="Register_New" type="submit"  align="center" value=" <%=appMsg.getString("f.register.new.account")%>" class="general-button" style="width:98%;"  />

                                    </div>
                                



 

                                <form  class="form ng-pristine " name="theform" id="theform" action="<%=controller%>"    method="post"    >
                                    
                                     <input  type="hidden" id ="username"  name ="username"  value="<%=peLogin.getUsername()%> " ></input> 
                                    <input  type="hidden" id="countryCode"  name="countryCode" value="<%=countryCode%> " ></input> 
                                    <input  type="hidden" id="mobileNumber"  name="mobileNumber" value="<%=mobileNumber%> " ></input> 
                                        <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                        <div class="error_code_main" ><%=result.getMessage()%></div>
                                        <%}%>

                                    <box class="ng-isolate-scope"  >
                                        <div class="box  ">
                                            <div class="top"></div>
                                            <div ng-transclude="">
                                                <p class="ng-binding ng-scope">A validation code was sent to your mobile phone, enter the code below:</p>
                                                <div class="error_code"><%if (errorMap != null) {%>
                                                    <%=errorMap.containsKey("verificationToken") ? errorMap.get("verificationToken") : ""%>
                                                    <%}%> 


                                                </div>



                                                <input type="number" class="big green ng-pristine ng-untouched ng-scope" name="verificationToken" placeholder="Enter your validation code" value="<%=verificationToken%>" size="8"  maxlength="15" id="verificationToken" >


                                                    <button type="submit" id="submit" name="submit" class="btn green full midi ng-binding ng-scope"  >Continue </button>
                                                    <span class="standaloneLink ng-scope"><a href="WelcomeForm.jsp"   class="ng-binding">I did not receive a validation code.</a></span></div>
                                            <div class="clear"></div>
                                        </div>
                                    </box>
                                </form>
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


            <%
                } catch (Exception ex) {

                    logger.log(Level.ALL, ex.getMessage());
                    response.sendRedirect(controllerPage + "Error.jsp");
                    return ;

                }

            %>