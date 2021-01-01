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

    String controller = "", controllerCom = "";

    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("PremiumForm");

    PeLogin peLogin = null;
    JSONObject obj = null;

    try {

        peLogin = (PeLogin) session.getAttribute("peLogin");
        peLogin.setLocale(new Locale(""));
        session.setAttribute("peLogin", peLogin);
        controllerCom = request.getContextPath() + "/fixedtemplate/Banner1/ar/common/";

        String folder = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "voucher" : "voucherless";
        controller = request.getContextPath() + "/fixedtemplate/Banner1/ar" + folder + "/WelcomeForm.jsp";

        //Banner Logic
        obj = getImage(peLogin.getMacvlan(), peLogin.getVlan(), "P0", request.getHeader("User-Agent").toString());
        obj.get("banner_space_1");
       
        //Banner Logic
%>

<html lang="en">
    <!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--        <meta http-equiv="refresh" content="6;url=learning.jsp">-->

        <title>Welcome to Wi-Fi </title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body 
            {
                margin : 0;
            }
            .imgprem {

                width: 100vw;
                height: 100vh;
                overflow:hidden; 
            }
            .txtwrap {
                position: absolute;
                z-index:1000;
                color: darkblue;
                font-size:0.8em;
            }

            #skip {
                display : none;
            }

        </style>
    </head>

    <body>
        <!--        <div class="row">
                    <div class="col-md-12 txtwrap">You will be redirected in 00 Seconds.</div>
                </div>-->
        <div class="rows">
            <div class="col-md-12 txtwrap"  style="padding: 10px">You should be automatically redirected in <span id="seconds">15</span> seconds.                 
                <span id="skip" class="pull-right back-btn" ><a class="pull-right" href="<%=controller%>">Skip &#62;&#62;</a></span>        
            </div>
        </div>  
        <div class="wrapper banner_space_1">
            <% if (!StringHelper.isNullOrEmptyObject(obj.get("banner_space_1"))) {%>
            <%=obj.get("banner_space_1")%>
            <%} else {%>
            <a href="#" target="_blank"><img class="Bannerimg slide imgprem" src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/defaultImage/default_inter_img.png" alt=""></a>
                <%}%>
        </div>

    </body>
    <script src="<%=request.getContextPath()%>/fixedtemplate/Banner1/includes/js/jquery-2.1.1.js" type="text/javascript"></script>

    <script type="text/javascript">
        // Countdown timer for redirecting to another URL after several seconds

        var seconds = 15; // seconds for HTML
        var foo; // variable for clearInterval() function

        function redirect() {
            document.location.href = '<%=controller%>';

        }

        function updateSecs() {
            document.getElementById("seconds").innerHTML = seconds;
            seconds--;
            if (seconds == 5) {
                document.getElementById("skip").style.display = "block";
            }
            if (seconds == -1) {
                clearInterval(foo);
                redirect();
            }
        }

        function countdownTimer() {
            foo = setInterval(function () {
                updateSecs()
            }, 1000);
        }

        countdownTimer();
    </script>
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
                    System.out.println("LBALBALBALBALBALBALBALBALBALBALBALBALBALBA--------ERRRRRRRR:FAIL" + obj);
                }

            }

        } catch (Exception ex) {

            System.out.println("LBALBALBALBALBALBALBALBALBALBALBALBALBALBA--------ERRRRRRRR:" + ex.getMessage());
            System.out.println("LBALBALBALBALBALBALBALBALBALBALBALBALBALBA--------ERRRRRRRR:" + ex.getMessage());
        }
        return obj;

    }

%>