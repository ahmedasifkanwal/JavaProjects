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

    Integer timeleft = 60;
    Integer accessType = 0;
    String firstUrl = "http://www.omantel.om/default.aspx";
    PropertyEncoder appMsg = null, commonMsg = null;
    Accountuser accountuser = null;
    PeLogin peLogin = null;
    String mac_vlan = "", controller = "", controllerCom = "", breadCrum = "", paymentDetailsRow = "";
     Result result = null;
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
         controller = request.getContextPath() + "/fixedtemplate/Banner1/controller/LogoutController.jsp?lang=en";

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
        <title>Login Success</title>
    </head>

    <script type="text/javascript">
        window.onbeforeunload = warnUser;
        function warnUser() {

            var s = "<%=appMsg.getString("info.warn.user")%>";
            s = s.replace(/&#(\d+);/g,
                    function ($1, $2) {
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
            alert('balance1');
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

            //  document.form.timer_sec.value = sec;
            // document.form.timer_min.value = min;
            //  document.form.timer_hour.value = hour;
            $('#timer_hour_span').html(hour);
            $('#timer_min_span').html(min);
            $('#timer_sec_span').html(sec);

            document.title = text + " remaining";
        }
        //-->
    </script>
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
                                    <div class="warningHeader"><%=appMsg.getString("f.login.success")%></div>
                                 </div>
                                            <div class="container-fluid" style="padding-top:1em;">
                                                <div class="row" style="display: inline-block; margin: 0 auto">
                                                    <div class="boxDigit" id="hrs">
                                                         <div  id="timer_hour_span">00</div>
                                                        <div class="txt">Hours</div>
                                                    </div>
                                                    <div class="col">:</div>
                                                    <div class="boxDigit" id="min">
                                                        <div  id="timer_min_span">00</div>
                                                        <div class="txt">Minutes</div>
                                                    </div>
                                                    <div class="col">:</div>
                                                    <div class="boxDigit" id="sec">
                                                        <div  id="timer_sec_span">00</div>
                                                        <div class="txt">Seconds</div>
                                                    </div>
                                                </div>
                                            </div>      

                                       
                                    <p style="width: 15px"></p>
                                        <div id="disconnect">
                                            <input id="submit" name="submit" type="submit" value="<%=appMsg.getString("f.disconnect")%>" class="inputButtonDis"/>
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

            <script type="text/javascript">
                setInterval("BalanceTime()", 1000);
            </script>

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