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


                        <!-- image move -->



                        <script language="javascript" type="text/javascript">

                            function openWinMailLink(url)

                            {

                                var j = window.open(url, "maillink", "width=550, height=580, scrollbars=yes, left=200,")

                            }

                        </script>



                         
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
                                                motionAngleX: 30,
                                                motionAngleY: 30,
                                                alphaFilter: 0.5,
                                                adjustBasePosition: true,
                                                alphaPosition: 0.025,
                                            });



                                        });
                                    }); // */
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
                                                <img  src="images/omantel.png" ></span>
                                            <span ng-show="!cobrand.haveLogo()" class="ng-binding">Free internet access for Omantel Subscribers</span> </header>
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
                                    
                                                    <%

                                                        String customerName = "", customerEmail = "", controller = "", nationality = "", controllerPage = "", mobileNumber = "", countryCode = WIFIConstants.DEFAULT_COUNTRY_CODE;
                                                        Result result = null;
                                                        Map errorMap = null;
                                                        PropertyEncoder appMsg = null;
                                                        java.util.logging.Logger logger = java.util.logging.Logger.getLogger("WelcomeForm");
                                                        PeLogin peLogin = null;

                                                        List<Country> countryList = new CountryFacade().getCountryCode();
                                                        try {

                                                            peLogin = (PeLogin) session.getAttribute("peLogin");
                                                            controllerPage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.LANGFIXED() + "common/";
                                                            controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/WelcomeController.jsp?lang=en";
                                                            appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());
                                                            countryCode = !StringUtil.isNullOrEmpty(peLogin.getCountryCode()) ? peLogin.getCountryCode() : WIFIConstants.DEFAULT_COUNTRY_CODE;
                                                            mobileNumber = !StringUtil.isNullOrEmpty(peLogin.getMobileNo()) ? peLogin.getMobileNo() : "";
                                                            customerName = !StringUtil.isNullOrEmpty(peLogin.getCustomerName()) ? peLogin.getCustomerName() : "";
                                                            customerEmail = !StringUtil.isNullOrEmpty(peLogin.getCustomerEmail()) ? peLogin.getCustomerEmail() : "";

                                                            if (!StringUtil.isNullOrEmpty(peLogin.getCustomerName())) {
                                                                customerName = peLogin.getCustomerName();
                                                            }
                                                            if (!StringUtil.isNullOrEmpty(peLogin.getCustomerEmail())) {
                                                                customerEmail = peLogin.getCustomerEmail();
                                                            }
                                                            if (!StringUtil.isNullOrEmpty(peLogin.getNationality())) {
                                                                nationality = peLogin.getNationality();
                                                            }

                                                            if (!StringUtil.isNullOrEmpty(peLogin.getCountryCode())) {
                                                                countryCode = peLogin.getCountryCode();
                                                            }
                                                            if (!StringUtil.isNullOrEmpty(peLogin.getMobileNo())) {
                                                                mobileNumber = peLogin.getMobileNo();
                                                            }

                                                            if (session.getAttribute("Result") != null) {
                                                                result = (Result) session.getAttribute("Result");
                                                                errorMap = result.getExceptionMessages();
                                                            }

                                                            if (request.getParameter("langchange") != null) {
                                                                errorMap = null;
                                                                result = null;
                                                            }


                                                    %>




                                                  
                                                        <INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="ENTER"/>

                                                        <table width="95%"  border="0" align="center" cellpadding="2" cellspacing="0"     >

                                                            <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                                            <div class="error_code_main" > <%=result.getMessage()%> </div>
                                                            <%}%>

                                                            <tr style="display: none;">
                                                                <td  width="30%" style="text-align:right"> <%=appMsg.getString("f.name")%> </td>
                                                                <td   align="center" class="formlabels" width="70%"   >
                                                                    <div class="error_code">
                                                                        <%if (errorMap != null) {%>
                                                                        <%=errorMap.containsKey("customerName") ? errorMap.get("customerName") : ""%>
                                                                        <%}%>
                                                                    </div>
                                                                    <input    name="customerName" type="text" class="login" id="customerName" maxlength="50" value="<%=customerName%>"/>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align:right; display: none"><%=appMsg.getString("f.country.code")%> </td>
                                                                <td   align="center" class="formlabels" >
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align:right; display: none"><%=appMsg.getString("f.mobile.no")%> </td>
                                                                <td   align="center" class="formlabels">
                                                                    </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td style="text-align:right">  <%=appMsg.getString("f.nationality")%> </td>
                                                                <td   align="center" class="formlabels">
                                                                    <div class="error_code">
                                                                        <%if (errorMap != null) {%>
                                                                        <%=errorMap.containsKey("nationality") ? errorMap.get("nationality") : ""%>
                                                                        <%}%>
                                                                    </div>

                                                                    <select    id="nationality"  name="nationality" tabindex="1" class="loginsel"    >
                                                                        <option value="">Select Nationality</option>
                                                                        <%

                                                                            for (int j = 0; j < countryList.size(); j++) {

                                                                                {
                                                                                    if (nationality.equals(countryList.get(j).getCountryCode())) {
                                                                                        out.print("<option selected value=\"" + countryList.get(j).getCountryCode() + "\">" + countryList.get(j).getNationality() + "</option>");
                                                                                    } else {
                                                                                        out.print("<option value=\"" + countryList.get(j).getCountryCode() + "\">" + countryList.get(j).getNationality() + "</option>");
                                                                                    }
                                                                                }
                                                                            }

                                                                        %>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td style="text-align:right"><%=appMsg.getString("f.email")%></td>
                                                                <td   align="center" class="formlabels">
                                                                    <div class="error_code"><%if (errorMap != null) {%>
                                                                        <%=errorMap.containsKey("customerEmail") ? errorMap.get("customerEmail") : ""%>
                                                                        <%}%> </div>

                                                                    <input    name="customerEmail" type="text" class="login" id="customerEmail" maxlength="50" value="<%=customerEmail%>"/>

                                                                </td>
                                                            </tr>
                                                            <div class="error_code">

                                                                <%if (errorMap != null) {%>
                                                                <%=errorMap.containsKey("termAndCondition") ? errorMap.get("termAndCondition") : ""%>
                                                                <%}%> </div>
                                                            <div class="check" style="display:none;">
                                                                <input id="termAndCondition" name="termAndCondition"
                                                                       type="checkbox"  tabindex="3" value="false" checked="checked" />
                                                                <label for="termAndCondition"> </label>
                                                                <span class="terms_Con"  >

                                                                    <a   style="visibility: hidden;"    target="_blank" ><%=appMsg.getString("f.term.condition")%></a>
                                                                </span>
                                                            </div>


                                                        </table>
                                                        



                                                        <div class="button1" style="display: none">
                                                            <input    <%=peLogin.getPreviewSTyle()%>   id="Existing_User" name="Existing_User" type="submit" align="center" value=" <%=appMsg.getString("f.existing.user.login")%>" class="general-button" style="width:98%;"    />

                                                        </div>
                                                        <div class="button1" style="display: none">
                                                            <input <%=peLogin.getPreviewSTyle()%>  id="User_With_Token" name="User_With_Token" type="submit"  align="center" value=" <%=appMsg.getString("f.user.with.security.code")%>" class="general-button" style="width:98%;"  />

                                                        </div>


                                                    
                                                        <form  class="form ng-pristine ng-hide ng-invalid ng-invalid-required" name="theform" id="theform" action="<%=controller%>"    method="post"    >
                                                           <INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="ENTER"/>  <box class="ng-isolate-scope">
                                                                <div class="box  ">
                                                                    <div class="top"></div>
                                                                    <p class="ng-binding ng-scope">Before enjoying our WiFi network, please, enter your cell phone number for security reasons.</p>
                                                                    <div class="selectPlaceholder ng-scope" data-placeholder="Your country">
                                                                        
                                                                        <div class="error_code"><%if (errorMap != null) {%>
                                                                        <%=errorMap.containsKey("countryCode") ? errorMap.get("countryCode") : ""%>
                                                                        <%}%> </div>


                                                                    <select    id="countryCode"  name="countryCode" tabindex="1"    ng-model="prefix" class="ng-pristine ng-touched"   >
                                                                        <option value="">Select Country</option>
                                                                        <%try {

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
                                                                    
                                                                    
                                                                    
                                                                    
                                                                       
                                                                    </div>
                                                                    <div class="error_code"><%if (errorMap != null) {%>
                                                                        <%=errorMap.containsKey("mobileNumber") ? errorMap.get("mobileNumber") : ""%>
                                                                        <%}%> </div>
                                                        <input name="mobileNumber" type="text" class="login" id="mobileNumber" maxlength="12" placeholder="Enter your phone number without the country prefix"   class="ng-pristine ng-untouched ng-scope"  value="<%=mobileNumber%>"/>
                                                                    
                                                               <button <%=peLogin.getPreviewSTyle()%>  id="Enter" name="Continue" type="submit"  align="center"  class="btn green full midi ng-binding ng-scope" > Continue</button>
                                                                   
                                                                   
                                                                         
                                                                        <span class="standaloneLink ng-binding ng-scope" >By clicking on the button above, you agree to the 


                                                                            <div class="morph-button morph-button-overlay morph-button-fixed">
                                                                                <button type="button">network terms &amp; conditions</button>
                                                                                <div class="morph-content">
                                                                                    <div class="content-style-overlay"> <span class="icon icon-close">Close the overlay</span>
                                                                                        <h2>Terms &amp; Conditions</h2>

                                                                                        <p>Provider of Service (hereinafter "Provider") and operator of Network Hotspot Connection (hereinafter "Network Operator") undertake to respect privacy of Service user. Provider and Network Operator oblige to handle the information collected by us according to the law, esp. to Directive 95/46/EC.</p>
                                                                                        <h2>I. Acceptance of Terms of Use</h2>
                                                                                        <p>By using network services you agree to be bound by these terms. If you do not agree, please, do not use network services.</p>
                                                                                        <h2>II. Privacy Policy</h2>
                                                                                        <p>By using network services you agree to conditions of these principles of Privacy Policy. Any personal information you supply to us will be used in the manner set out in Privacy policy.</p>
                                                                                        <p>The Provider does not collect any information that can be connected to the concrete user (name, address, phone number or email), in case that user does not voluntarily impart them e.g. by authenticated connection.</p>
                                                                                        <p>The Provider collects and uses personal data imparted by user such as age range, favourite sites, interests, education, check-in, time and place of connection, click on ad, MAC address, only for proper functioning of the system, analyses and to aim the promotion.</p>
                                                                                        <p>The Provider declares that use of personal data serves only to aim the promotion and identification of user. User's personal data will not be passed on the third party with exception of specific warning and his express consent. User is entitled to withdraw express consent anytime.</p>
                                                                                        <p>By using network services you impart your personal data through network services to the Provider and Network Operator and give approval to use all imparted
                                                                                            personal data. The Provider is authorized to use personal data, especially for aiming the promotion. Approval to receive promotion is granted voluntarily to unlimited time period until it is withdrawn by you.</p>
                                                                                        <p>Your approval to the Provider and the Network Operator to use your personal data is provided voluntarily to unlimited time period and the Provider and the Network Operator can use it until it is withdrawn by you. You are entitled to withdraw approval anytime and apply all your rights resulting from the law.</p>
                                                                                        <h2>III. User Declaration</h2>
                                                                                        <p>You undertake to do not act in any way that could be unlawful or encourage others to act unlawfully. In particular, do not infringe intellectual property rights, do not reveal confidential or sensitive information and do not engage in any criminal offence or encourage others to do so.</p>
                                                                                        <p>You undertake to do not act in any way that is inappropriate, e.g. harassing, defamatory, threatening, obscene, abusive, racist, sexist, offensive or otherwise objectionable. You will not pretend to be anyone other than yourself. You will not collect email addresses or other personal data or use the network services to send spam.</p>
                                                                                        <p>You undertake to do not act in any way that may affect the running of the network services or other technology connected to it (for example, other Wi-Fi users' devices). In particular, do not upload or download very large files and make sure your device is protected by up-to-date anti-virus software. Make sure that your device complies with all applicable laws and standards. You must make sure that you have any necessary licences before you use it to connect to network services and make sure that your device is compatible.</p>
                                                                                        <h2>IV. User Responsibility</h2>
                                                                                        <p>You are responsible to us for all damage, losses, costs or expenses suffered by the Provider or the Network Operator arising out of any breach by you of these rules (for example, if you use the Wi-Fi for copyright infringement or to commit a criminal offence).</p>
                                                                                        <p>If the Provider or the Network Operator are subject to any claim or request for information about your use of network services, we may disclose information about you (for example, your IP address or the email address you provided when accessing the Wi-Fi).</p>
                                                                                        <p>Nothing in these terms of use limits or affects your general liability.</p>
                                                                                        <p>You agree that you will comply with all applicable local, state, federal, and foreign laws in using network services and accessing and using the internet access.</p>
                                                                                        <h2>V. Safety Statement</h2>


                                                                                        <p>You acknowledge that you connect to the network services through Wi-Fi at your own risk and neither the Provider nor the Network Operator is liable for damages, losses or expenses which may arise from unavailability of the service, unexpected operation or data loss.</p>
                                                                                        <p>Authenticated connection to the network services is always provided by applications of the third parties. Security of the communication is supplied by the issuer of the applications of social networks (Facebook Connect, Twitter, Google+, etc.). In case of breach of the security neither the Provider nor the Network Operator takes any responsibility for damages caused by misuse of the transferred data, data loss or damage.</p>
                                                                                        <p>The Provider and the Network Operator are obliged to protect personal data from unauthorized access or publication, to preserve the accuracy of the data. To ensure the appropriate use of the data the Provider and Network Operator use appropriate physical, technical and administrative procedures to ensure data collection. The Provider and Network Operator retain data only as required under local law and only if it has a legitimate business purpose.</p>
                                                                                        <p>Neither the Provider nor the Network Operator is liable for any damages caused by unauthorized use of the network and damage due to unauthorized
                                                                                            interference in the network.</p>
                                                                                        <p>When entering the credit card to pay for Premium Internet Access the Provider assures that all data is secured and the Network Operator or other unauthorised third party has no access to your payment information.</p>
                                                                                        <h2>VI. Ads</h2>
                                                                                        <p>Ads viewed within connection via network services may contain links to websites operated by the third parties. The Provider does not know the content of such websites in detail. By placing ads across media network the Provider only provides access to the websites of the third parties, but accepts no responsibility for their content. Referenced content on the website of the third parties is in no way supported or approved by the Provider. The Provider assumes no liability for any information or materials placed on the websites of third parties nor for any infringement of rights or legitimate interests of third parties, which have occurred on the websites of third parties. Responsibility for the content and operation of referenced websites and damages in connection with their use are exclusively sustained by their operators. The websites operated by the third party are not covered (or may not be covered) by privacy policy, and therefore the rules, policies, procedures and consequences referred to in this document. We therefore recommend to the user to ask operators directly for the conditions of data collection and dissemination.</p>

                                                                                        <p>In-session ads and global AdExchange ads.
                                                                                            The Provider may use also the third party advertising companies to serve ads. These companies may use information (not including your name, address, email address or telephone number) about your visits to this and other websites in order to provide advertisements about goods and services of interest to you. In order to do this, the Provider and our advertising partners may place a cookie (a small text file) on your device.</p>

                                                                                        <p>Cookies. When the Network Operator serves in-session ads everyone who uses his internet connection visits a website containing cookies. These sites send your browser a cookie - a small piece of data stored on your device. The purpose of the cookie is to improve your browsing experience. If you do not want to accept that your device receives and stores cookies, you can alter your security settings on your web browser. However, note that certain parts of browsed sites may only be used fully if your browser allows cookies. Thus, your reading experience of sites may be affected negatively by removing and not allowing cookies. In addition, the Provider may serve ads on websites using ad-serving technology. In doing so, one of ad servers will place or read a unique ad-serving cookie on your device and will use non-personal information about your browser and your activity at the site to serve ads on this and other sites. The ad-serving cookie is a persistent cookie. In addition, note that you are always able to prevent cookies from any website from being installed on your computer by readjusting your browser settings. For more information about cookies and how to disable them, you should consult the help section of your browser.</p>
                                                                                        <h2>VII. Network Functionality</h2>
                                                                                        <p>Network services works as internet connection services free of charge, except for Premium Internet Access. It may not be available 24/7 for technical, legal or operational reasons. The Provider can also suspend your access at any time in our sole discretion without responsibility to you. You use the network services at your own risk and neither the Provider nor the Network Operator is responsible to you for any damages, losses, costs or expenses you suffer because the network services are unavailable, does not operate as expected or causes loss or damage to any data.</p>
                                                                                        <h2>VIII. Premium Internet Access (Pay-Thru, Pay-As-You-Go)</h2>
                                                                                        <p>When you select Premium Internet Access you need to provide valid credit card information to pay for it. You have to authorize the price of the selected Premium internet to be charged to your credit card. You are responsible for maintaining up-to-date and accurate information (including without limitation legal name, valid billing address, email, telephone number, credit card information). After the payment is proceeded you are able to use selected Premium Internet Access provided by the Network Operator. </p>
                                                                                        <p>In case of multi-device access you are responsible for maintaining the secrecy of the PIN delivered to entered email address.

                                                                                        </p>

                                                                                        <p>The Network Operator undertakes to: i) set the price and the length of connections; ii) take the whole responsibility for the functional and proper internet access; iii) issue the invoice for Premium Internet Access (if requested).</p>
                                                                                        <p>You hereby authorize the Provider to process your credit card information and to charge your credit card in the amounts that you have purchased.</p>
                                                                                        <p>The Provider sends you a statement about the payment, fulfil all claims and refund you in case of successful claim.</p>
                                                                                        <p>You acknowledge and agree that network services and associated internet access are made available to you through the Network Operator. If you should encounter any problems with Premium Internet Access or otherwise require technical support in connection with your use of the internet, please contact the Network Operator. </p>
                                                                                        <p>To refund the payment of the internet connection, you are obliged to contact the Network Operator no later than 7 days after the service was supposed to be delivered and inform the Network Operator about the malfunction, failure or another technical issue. Without a proper official request for refund or another official complaint delivered to Network Operator, you waive the right to a refund, and other complaints and disputes might be solved in a sole
                                                                                            discretion of the Provider and/or the Network Operator.</p>
                                                                                        <h2>IX. SMS Authentication</h2>
                                                                                        <p>User might be obliged to authenticate through SMS Authentication upon law requirements in selected locations or upon the Network Operator requirements. The Network Operator may interact with your phone's SMS inbox for the sole purpose of service activation and sending incoming messages to your inbox for further business communications of the Network Operator or his affiliate partners.
                                                                                            The Provider may use the third party service in order to send you an authentication SMS when you authenticate. In order to send you the SMS, we send your phone number and the authentication message to the third party service. The third party is contractually obligated to only use your phone number for the transmission of the authentication SMS. The Network Operator may contact you to send you messages about faults and service issues. Furthermore, the Provider and the Network Operator reserve the right to use email or SMS to notify you of any eventual claims related to your use of network services, including without limitation claims of violation of third party rights.</p>
                                                                                        <h2>X. The Effectiveness and Change of the Statement</h2>
                                                                                        <p>The Provider reserves the right to amend or modify this document anytime. The change takes effect by the publication on the network services, unless it is explicitly mentioned another date of effectiveness. These Network Terms &amp; Conditions in English version prevail in case of conflict with any language version or Network Terms &amp; Conditions of partners.</p>
                                                                                        <p>Date of issue 23. 7. 2013, revision 31. 8. 2016</p>


                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                            <!-- morph-button --> 

                                                                        </span> 
                                                                        <div class="clear"></div>
                                                                </div>



                                                                <div class="clear"></div>
                                                                </div>
                                                            </box>
                                                        </form>
                                                </div>
                                            </div> 

                                            <div class=" "> <div class="bottomGradient"></div></div>
                                        </div>  
                                    </popup>
                                    <!-- pop up --> 
                                    <script src="pop/js/classie.js"></script> 
                                    <script src="pop/js/uiMorphingButton_fixed.js"></script> 
                                    <script src="pop/js/page.js"></script> 
                                    <!-- pop up --> 






 





                                    </body>











                                    <%
                                        } catch (Exception ex) {

                                            logger.log(Level.ALL, ex.getMessage());
                                            response.sendRedirect(controllerPage + "Error.jsp");
                                            return;
                                        }


                                    %>