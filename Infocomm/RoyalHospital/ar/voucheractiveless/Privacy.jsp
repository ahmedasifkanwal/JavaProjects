<%@page import="java.util.Locale"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="java.util.logging.Level"%>
<%

    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
    PeLogin peLogin = null;
    String controllerCom = "", welcomePage = "", welcomePageAr = "";
    try {
        peLogin = (PeLogin) session.getAttribute("peLogin");
        peLogin.setLocale(new Locale(""));
        peLogin.setPda("");
        session.setAttribute("peLogin", peLogin);
        controllerCom = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/";
        PeSession peSession = (PeSession) session.getAttribute("peSession");
        WIFILayoutManager.initializeFixedLayout(peLogin.getOwnerName(), peSession, peLogin.getLocale());
       
        welcomePage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE()  + "/WelcomeForm.jsp?langchange=yes";
        welcomePageAr = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/ar/WelcomeForm.jsp?langchange=yes";

%>


<!DOCTYPE html>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Omantel Wi-Fi - Privacy Policy</title>
	
    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="assets/css/custom.css" rel="stylesheet" media="screen">


	<link href="examples/carousel/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
	
    <!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" media="screen" />
    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->
	
	<!-- PIECHART -->
	<link rel="stylesheet" type="text/css" href="assets/css/jquery.easy-pie-chart.css">	
	
	<!-- Animo css-->
	<link href="plugins/animo/animate+animo.css" rel="stylesheet" media="screen">

    <!-- Picker -->	
	<link rel="stylesheet" href="assets/css/jquery-ui.css" />	
	
    <!-- jQuery -->		
    <script src="assets/js/jquery.v2.0.3.js"></script>
	

	
  </head>
  <body id="top" class="thebg" >
    
	<div class="navbar-wrapper2 navbar-fixed-top">
      <div class="container">
		<div class="navbar mtnav">
      <div class="container offset-3"> 
        <!-- Navigation-->   <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
           <li><a href="http://login.now">Home</a></li>
            <li><a href="http://www.omantel.om/OmanWebLib/customersupport/CustomerAgreement.aspx?LinkID=700&MenuId=718" target="_blank">Terms & Conditions</a></li>
            <li><a href="privacy.html">Privacy Policy</a></li>
            <li style="background-color:#f3b542; border-radius: 5px; padding-left: 10px; padding-right: 10px;"><a href="<%=welcomePage%>">English</a></li>
            <li style="background-color:#496fb8; border-radius: 5px; padding-left: 10px; padding-right: 10px;"><a href="<%=welcomePageAr%>" style=" color:#FFF;">Arabic</a></li>
          </ul>
        </div>
        <div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a href="index.html" class="navbar-brand"><img src="images/logo.png" alt="Omantel" style="margin-bottom: 10px;" class="logo"/></a>
			  </div>
     
        <!-- /Navigation--> 
      </div>
    </div>
      </div>
    </div>
	
	<div class="container breadcrub">
	     
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>	

	<!-- CONTENT -->
	<div class="container">

		
		<div class="container mt25 offset-0">
			
			
			<!-- CONTENT -->
			<div class="col-md-12 pagecontainer2 offset-0">
				<div class="hpadding50c">
					<p class="lato size30 slim">Privacy Policy</p>
					<p class="aboutarrow"></p>
				</div>
				<div class="line3"></div>
				
				<div class="hpadding50c">
					 
						
				 
					 
					
					<div class="col-md-12">
						<div class="opensans grey2">
							 <p>Oman Telecommunications Company - OmanTel knows and respects your concerns about your privacy. Certainly, it is our endeavor and objective to provide quality services to you. This covers you privacy.</p>

<p>This privacy policy has been formulated to guide and help you understand the nature of the information we collect from you on your visits to our website and how this gathered personal information will be treated by us.</p>

<h2 style=" color:#0066b3">How we collect Personal Information:</h2>		
<ul>
<li>Directly from you, when filling registration forms/eforms</li>
<li>During your navigation and visits to our website</li>
<li>From our records on how you use your OmanTel services</li>
</ul>

<h2 style=" color:#0066b3">Your personal information:</h2>
<p>Personal information held by OmanTel include data you voluntarily provided to us. This could cover your name, date of birth, current and permanent addresses, telephone/mobile phone number, email address,Your OmanTel user name and password. We also hold details of your OmanTel services (including their status), as well as certain details about your personal interests.</p>

<h2 style=" color:#0066b3">How we use your personal information:</h2>
<p>Personal information you voluntarily provided will help us to get in touch with you and process your requests where applicable. The information can also be used for marketing or quality assurance purposes. The information you provide will never be sold to any third party for their own marketing purposes without your permission in writing unless it is done on an aggregated basis for statistical purposes and research without any information which can be used to identify you.</p>

<h2 style=" color:#0066b3">Disclosure to Third Parties:</h2>
<p>We will not sell, trade, rent or release any information to any third party outside Omantel. Disclosure may only be made upon an order from a Judicial or Regulatory Authority</p>

<h2 style=" color:#0066b3">Browsing:</h2>
<p>When visiting our website; If our customers voluntarily provided us with their e-mail we will collect the domain names of visitors to our website, aggregate information on what pages they access and other information volunteered, such as survey or contact information. We then use the information we collect to improve the content of our web site, notify subscribers about updates to our web site, or contact subscribers or visitors for marketing purposes. The information we collect is not, under any circumstances, shared with any other companies or organizations for any purpose. Our website is configured to collect the information once you supply us with your e-mail address. Furthermore, If; when visiting our site, you supplied us with your e-mail address, your postal address, or your phone number, you could receive periodic emails, postal mailings, or phone calls from us with information on new products, services, or upcoming events. If you do not wish to receive these, just let us know.</p>

<h2 style=" color:#0066b3">Contact Us with your Questions and Comments</h2>
<p>Information you provide will be treated as confidential. Online Forms request information to help us provide you with enhanced quality of customer care. Such information provided will be used to respond to your questions, comments or requests by OmanTel.</p>

<h2 style=" color:#0066b3">Privacy policy Changes:</h2>
<p>OmanTel reserve the right to change this privacy policy terms and conditions as and when needed. All the changes will be shown here and you will be informed about them. You will also be informed about the gathered information, how we use them and to whom they are disclosed.</p>
						</div>
					</div>
					 		
					<div class="clearfix"></div>
					
					
				</div>
				

				
			<div class="clearfix"></div><br/><br/>
			</div>
			<!-- END CONTENT -->			
			

			
		</div>
		
		
	</div>
	<!-- END OF CONTENT -->
	

	
	
	<!-- FOOTER -->
	
	<div class="footerbgblack">
		<div class="container">		
			
			<div class="col-md-12">
				 
				<div class="scont" style="text-align:center">
					<a href="https://www.facebook.com/omantel.om" target="_blank" class="social1b"><img src="images/icon-facebook.png" alt=""/></a>
					<a href="https://twitter.com/omantel" target="_blank" class="social2b"><img src="images/icon-twitter.png" alt=""/></a>
					 
					<a href="https://www.youtube.com/user/omantelom" target="_blank" class="social4b"><img src="images/icon-youtube.png" alt=""/></a>
					<br/><br/><br/>
					 <br/>
					<span class="grey2">Copyright &copy; 2015 <a href="http://www.omantel.om/" target="_blank">Oman Telecommunications Company</a> All rights reserved. </span>
					<br/><br/>
					
				</div>
			</div>
			<!-- End of column 1-->
			
			 
			<!-- End of column 2-->		
			
			 
			<!-- End of column 3-->		
			
			 			
			<!-- End of column 4-->			
		
			
		</div>	
	</div>
	
	 
	<div class="footerbg3black">
		<div class="container center grey"> 
		 
		<a href="#top" class="gotop scroll"><img src="images/spacer.png" alt=""/></a>
		</div>
	</div>
	
	<!-- Javascript  -->
	<script src="assets/js/js-about.js"></script>
	
	<!-- Easy Pie Chart  -->
	<script src="assets/js/jquery.easy-pie-chart.js"></script>
	
    <!-- Nicescroll  -->	
	<script src="assets/js/jquery.nicescroll.min.js"></script>
	
    <!-- Custom functions -->
    <script src="assets/js/functions.js"></script>
	
    <!-- Custom Select -->
	<script type='text/javascript' src='assets/js/jquery.customSelect.js'></script>
	
	<!-- Load Animo -->
	<script src="plugins/animo/animo.js"></script>

    <!-- Picker -->	
	<script src="assets/js/jquery-ui.js"></script>	

    <!-- Picker -->	
    <script src="assets/js/jquery.easing.js"></script>	
	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="dist/js/bootstrap.min.js"></script>
  </body>
</html>

            
          
  
<%

    } catch (Exception ex) {

        response.sendRedirect(request.getContextPath() + "/session.expired.tiles");  return ;
    }

%>
