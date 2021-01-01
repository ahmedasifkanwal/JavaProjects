<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Omantel Wi-Fi</title>

    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="assets/css/custom.css" rel="stylesheet" media="screen">

    <!-- Carousel -->
    <link href="examples/carousel/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="assets/js/html5shiv.js"></script>
          <script src="assets/js/respond.min.js"></script>
        <![endif]-->

    <!-- Fonts -->
     
    <!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" media="screen" />
    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->

    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="css/responsive.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/fullscreen.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />

    <!-- Picker UI-->
    <link rel="stylesheet" href="assets/css/jquery-ui.css" />

    <!-- jQuery -->
    <script src="assets/js/jquery.v2.0.3.js"></script>
</head>
<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="java.util.logging.Level"%>
<%

    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
    PeLogin peLogin = null;
        PropertyEncoder engMsg = null;
    String controllerCom = "", welcomePage = "", welcomePageAr = "";
    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
        peLogin.setLocale(new Locale("ar"));
        peLogin.setPda("");
        session.setAttribute("peLogin", peLogin);
        controllerCom = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/";
        PeSession peSession = (PeSession) session.getAttribute("peSession");
     
  engMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());
        welcomePage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.getUamType().toLowerCase() + "/WelcomeForm.jsp?langchange=yes";
            welcomePageAr = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/ar/" + peLogin.getUamType().toLowerCase() + "/WelcomeForm.jsp?langchange=yes";

%>

<!-- Top wrapper -->
<div class="navbar-wrapper2 navbar-fixed-top">
    <div class="container">
        <div class="navbar mtnav">
            <div class="container offset-3">
                <!-- Navigation-->
                <div class="navbar-header">
                    <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.html" class="navbar-brand"><img src="images/logo.png" alt="Omantel" style="margin-bottom: 10px;" class="logo"/></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">
                        
                        
                        
                        
                        <li style="background-color:#496fb8; border-radius: 5px; padding-left: 10px; padding-right: 10px;"><a href="<%=welcomePageAr%>" style=" color:#FFF;">Arabic</a></li>
                        <li style="background-color:#f3b542; border-radius: 5px; padding-left: 10px; padding-right: 10px;"><a href="<%=welcomePage%>">English</a></li>
                        <li><a href="../voucheractiveless/Privacy.jsp"><%=engMsg.getString("f.privacy.policy")%></a></li>
                        <li><a href="http://www.omantel.om/OmanWebLib/customersupport/CustomerAgreement.aspx?LinkID=700&MenuId=718" target="_blank"><%=engMsg.getString("f.term.condition")%></a></li>
                        <li><a href="http://login.now"><%=engMsg.getString("f.home")%></a></li>
                         
                    </ul>
                </div>
                <!-- /Navigation-->
            </div>
        </div>
    </div>
</div>

<%
    } catch (Exception ex) {

        logger.log(Level.ALL, ex.getMessage());

    }


%>
<!-- /Top wrapper -->