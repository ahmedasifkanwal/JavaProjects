<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="java.util.logging.Level"%>
<%
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("FAQ Payment");
    PropertyEncoder engMsg = null;
    PeLogin peLogin = null;
    String faq = "#", privacy = "#", contact = "#";
    String uam = "";
    PeSession peSession = null;
    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
        uam = peLogin.getPaymentMethodName();
        faq = request.getContextPath() + "/faq.dy.tiles";
        privacy = request.getContextPath() + "/privacy.dy.tiles";
        contact = request.getContextPath() + "/contactus.dy.tiles";
        peSession = (PeSession) session.getAttribute("peSession");
        engMsg = WIFILayoutManager.getApplicationMsg(new Locale(""));

%>



<!doctype html>
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ministry of Higher Education</title>
<link href="../voucherless/boilerplate.css" rel="stylesheet" type="text/css">
<link href="../voucherless/resp.css" rel="stylesheet" type="text/css">
<link href="../voucherless/florastyle.css" rel="stylesheet" type="text/css">
<link href="../voucherless/style_ar.css" rel="stylesheet" type="text/css">

<!-- 
To learn more about the conditional comments around the html tags at the top of the file:
paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/

Do the following if you're using your customized build of modernizr (http://www.modernizr.com/):
* insert the link to your js here
* remove the link below to the html5shiv
* add the "no-js" class to the html tags at the top
* you can also remove the link to respond.min.js if you included the MQ Polyfill in your modernizr build 
-->
<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="../voucherless/respond.min.js"></script>
</head>
<body>
<div class="gridContainer clearfix">
  <div id="LayoutDiv1">
  <div id="topheader">
    <jsp:include page="../layout/Header.jsp"></jsp:include>
  </div>
  <div id="privacy">
   <h1> Privacy Policy </h1>
                    <div class="line"> </div>
                    <p align="justify"><br />
                        Oman Telecommunications Company - OmanTel knows and respects your concerns about   your privacy. Certainly, it is our endeavor and objective to provide quality   services to you. This covers you privacy. <br />
                        <br />
                        This privacy policy has been   formulated to guide and help you understand the nature of the information we   collect from you on your visits to our website and how this gathered personal   information will be treated by us.<br />
                        <br />
                        <strong>How we collect Personal   Information:</strong><br />
                    <ul type="square">
                        <li>Directly from you, when filling registration forms/eforms </li>
                        <li>During your navigation and visits to our website </li>
                        <li>From our records on how you use your OmanTel services </li>
                    </ul>
                    <p><br />
                        <strong>Your personal information:</strong><br />
                        <br />
                        Personal information held by   OmanTel include data you voluntarily provided to us. This could cover your name,   date of birth, current and permanent addresses, telephone/mobile phone number,   email address,Your OmanTel user name and password. We also hold details of your   OmanTel services (including their status), as 
                        well as certain details about   your personal interests.<br />
                        <br />
                        <strong>How we use your personal   information:</strong><br />
                        <br />
                        Personal information you voluntarily provided will help   us to get in touch with you and process your requests where applicable. The   information can also be used for marketing or quality assurance purposes. The   information you provide will never be sold to any third party for their own   marketing purposes without your permission in writing unless it is done on an   aggregated basis for statistical purposes and research without any information   which can be used to identify you.<br />
                        <br />
                        <strong>Disclosure to Third Parties: </strong><br />
                        <br />
                        We will not sell, trade, rent or release any information to any   third party outside Omantel. Disclosure may only be made upon an order from a   Judicial or Regulatory Authority<br />
                        <br />
                        <strong>Browsing:</strong><br />
                        <br />
                        When visiting   our website; If our customers voluntarily provided us with their e-mail we will   collect the domain names of visitors to our website, aggregate information on   what pages they access and other information volunteered, such as survey or   contact information. We then use the information we collect to improve the   content of our web site, notify subscribers about updates to our web site, or   contact subscribers or visitors for marketing purposes. The information we   collect is not, under any circumstances, shared with any other companies or   organizations for any purpose. Our website is configured to collect the   information once you supply us with your e-mail address.
                        Furthermore, If;   when visiting our site, you supplied us with your e-mail address, your postal   address, or your phone number, you could receive periodic emails, postal   mailings, or phone calls from us with information on new products, services, or   upcoming events. If you do not wish to receive these, just let us   know.<br />
                        <br />
                        <strong>Contact Us with your Questions and   Comments</strong><br />
                        <br />
                        Information you provide will be treated as confidential.   Online Forms request information to help us provide you with enhanced quality of   customer care. Such information provided will be used to respond to your   questions, comments or requests by OmanTel.<br />
                        <br />
                        <strong>Privacy policy   Changes:</strong><br />
                        <br />
                        OmanTel reserve the right to change this privacy policy   terms and conditions as and when needed. All the changes will be shown here and   you will be informed about them. You will also be informed about the gathered   information, how we use them and to whom they are disclosed.</p>
  
  </div>
  </div>
 </div>
 
</body>
</html>

            
            
            
            
            
            
            
  
<%

    } catch (Exception ex) {

        response.sendRedirect(request.getContextPath() + "/session.expired.tiles");
    }

%>
