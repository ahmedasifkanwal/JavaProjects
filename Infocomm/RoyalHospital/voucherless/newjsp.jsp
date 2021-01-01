<%-- 
    Document   : newjsp
    Created on : Jan 10, 2017, 12:15:26 PM
    Author     : Shibu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
<html>
   
<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, maximum-scale=1, user-scalable=no" />
      <meta name="apple-mobile-web-app-capable" content="yes" />
      <meta name="mobile-web-app-capable" content="yes" />
      <title></title>
      <link href="boilerplate.css" rel="stylesheet" type="text/css">
      <link href="resp.css" rel="stylesheet" type="text/css">
      <link href="socimain.css" rel="stylesheet" type="text/css">
      <script src="respond.min.js"></script>
      <link rel="stylesheet" href="css/reset.min.css">
      
	  
	    <!-- pop up -->
	  <link rel="stylesheet" type="text/css" href="pop/css/demo.css" />
	  <link rel="stylesheet" type="text/css" href="pop/css/component.css" />
	  <link rel="stylesheet" type="text/css" href="pop/css/content.css" />
	  <script src="pop/js/modernizr.custom.js"></script>
	  <!-- pop up -->
	  
	  
      <!-- loading -->
      <script src="loading/jquery.min.js"></script>
      <script src="loading/modernizr.js"></script>
      <script>
         //paste this code under head tag or in a seperate js file.
         // Wait for window load
         $(window).load(function() {
         	// Animate loader off screen
         	$(".se-pre-con").fadeOut("slow");;
         });
      </script>
      <!-- loading -->
      <!-- image move -->
      <script type="text/javascript" src="jquery.min.js"></script>
	  <script src="js/jquery.parallaxify.min.js" type="text/javascript"></script>
	  
     
       
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
   </head>
   <body >



   

 <div class="ab-parallex mobile" id="scene" >
	  <script type="text/javascript">
		$(function(){
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
		$(function(){
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
          <header class="black cobranded" ><span class="logo whitelabeled ng-scope" style="background: rgba(0,0,0,0.1);" > <img  src="images/omantel.png" ></span><span ng-show="!cobrand.haveLogo()" class="ng-binding">Al Mouj Free WiFi</span> </header>
      </app-header>
      <popup class="popup payPopup userValidate ng-scope appear">
         <div class="tableDisplay">
            <div class="verticalAlign">
               <div class="insidePopup brand">
                  <img   class="brandLogo ng-scope bigger"   src="images/logo.png" style="">
                  <div class="clear"></div>
                  <h1 class="brandName shadow ng-binding ng-scope" >Moorish Cafe</h1>
                  <div class="clear"></div>
      </popup>
      <form method="get" name="userValidateForm" class="form ng-pristine ng-hide ng-invalid ng-invalid-required" action="validate.html"   >
	      <box class="ng-isolate-scope">
	      <div class="box  ">
	      <div class="top"></div>
	      <p class="ng-binding ng-scope">Before enjoying our WiFi network, please, enter your cell phone number for security reasons.</p>
	      <div class="selectPlaceholder ng-scope" data-placeholder="Your country">
	    <select name="prefix" id="select-choice" ng-model="prefix" class="ng-pristine ng-touched">
	      <option value="" class="ng-binding">Select your country</option>
	      <!-- ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+968" class="ng-binding ng-scope preffered" style="">Oman (+968)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+93" class="ng-binding ng-scope">Afghanistan (+93)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+355" class="ng-binding ng-scope">Albania (+355)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+213" class="ng-binding ng-scope">Algeria (+213)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">American Samoa (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+376" class="ng-binding ng-scope">Andorra (+376)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+244" class="ng-binding ng-scope">Angola (+244)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Anguilla (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Antigua and Barbuda (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+54" class="ng-binding ng-scope">Argentina (+54)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+374" class="ng-binding ng-scope">Armenia (+374)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+297" class="ng-binding ng-scope">Aruba (+297)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+61" class="ng-binding ng-scope">Australia (+61)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+43" class="ng-binding ng-scope">Austria (+43)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+994" class="ng-binding ng-scope">Azerbaijan (+994)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Bahamas (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+973" class="ng-binding ng-scope">Bahrain (+973)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+880" class="ng-binding ng-scope">Bangladesh (+880)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Barbados (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+375" class="ng-binding ng-scope">Belarus (+375)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+32" class="ng-binding ng-scope">Belgium (+32)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+501" class="ng-binding ng-scope">Belize (+501)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+229" class="ng-binding ng-scope">Benin (+229)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Bermuda (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+975" class="ng-binding ng-scope">Bhutan (+975)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+591" class="ng-binding ng-scope">Bolivia (+591)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+387" class="ng-binding ng-scope">Bosnia and Herzegovina (+387)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+267" class="ng-binding ng-scope">Botswana (+267)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+55" class="ng-binding ng-scope">Brazil (+55)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+673" class="ng-binding ng-scope">Brunei (+673)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+359" class="ng-binding ng-scope">Bulgaria (+359)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+226" class="ng-binding ng-scope">Burkina Faso (+226)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+257" class="ng-binding ng-scope">Burundi (+257)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+855" class="ng-binding ng-scope">Cambodia (+855)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+237" class="ng-binding ng-scope">Cameroon (+237)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Canada (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+238" class="ng-binding ng-scope">Cape Verde (+238)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Cayman Islands (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+236" class="ng-binding ng-scope">Central Africa (+236)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+235" class="ng-binding ng-scope">Chad (+235)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+56" class="ng-binding ng-scope">Chile (+56)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+86" class="ng-binding ng-scope">China (+86)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+57" class="ng-binding ng-scope">Colombia (+57)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+269" class="ng-binding ng-scope">Comoros (+269)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+242" class="ng-binding ng-scope">Congo (+242)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+682" class="ng-binding ng-scope">Cook Islands (+682)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+506" class="ng-binding ng-scope">Costa Rica (+506)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+385" class="ng-binding ng-scope">Croatia (+385)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+53" class="ng-binding ng-scope">Cuba (+53)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+357" class="ng-binding ng-scope">Cyprus (+357)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+420" class="ng-binding ng-scope">Czech Republic (+420)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+243" class="ng-binding ng-scope">Democratic Republic of the Congo (+243)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+45" class="ng-binding ng-scope">Denmark (+45)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+253" class="ng-binding ng-scope">Djibouti (+253)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Dominica (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Dominican Republic (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+670" class="ng-binding ng-scope">East Timor (+670)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+593" class="ng-binding ng-scope">Ecuador (+593)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+20" class="ng-binding ng-scope">Egypt (+20)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+503" class="ng-binding ng-scope">El Salvador (+503)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+240" class="ng-binding ng-scope">Equatorial Guinea (+240)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+372" class="ng-binding ng-scope">Estonia (+372)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+251" class="ng-binding ng-scope">Ethiopia (+251)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+500" class="ng-binding ng-scope">Falkland Islands (+500)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+298" class="ng-binding ng-scope">Faroe Islands (+298)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+679" class="ng-binding ng-scope">Fiji (+679)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+358" class="ng-binding ng-scope">Finland (+358)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+33" class="ng-binding ng-scope">France (+33)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+594" class="ng-binding ng-scope">French Guiana (+594)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+689" class="ng-binding ng-scope">French Polynesia (+689)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+241" class="ng-binding ng-scope">Gabon (+241)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+220" class="ng-binding ng-scope">Gambia (+220)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+995" class="ng-binding ng-scope">Georgia (+995)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+49" class="ng-binding ng-scope">Germany (+49)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+233" class="ng-binding ng-scope">Ghana (+233)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+350" class="ng-binding ng-scope">Gibraltar (+350)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+30" class="ng-binding ng-scope">Greece (+30)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+299" class="ng-binding ng-scope">Greenland (+299)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Grenada (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+590" class="ng-binding ng-scope">Guadeloupe (+590)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Guam (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+502" class="ng-binding ng-scope">Guatemala (+502)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+44" class="ng-binding ng-scope">Guernsey (+44)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+224" class="ng-binding ng-scope">Guinea (+224)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+245" class="ng-binding ng-scope">Guinea-Bissau (+245)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+592" class="ng-binding ng-scope">Guyana (+592)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+509" class="ng-binding ng-scope">Haiti (+509)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+504" class="ng-binding ng-scope">Honduras (+504)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+852" class="ng-binding ng-scope">Hong Kong (+852)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+36" class="ng-binding ng-scope">Hungary (+36)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+354" class="ng-binding ng-scope">Iceland (+354)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+91" class="ng-binding ng-scope">India (+91)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+62" class="ng-binding ng-scope">Indonesia (+62)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+964" class="ng-binding ng-scope">Iraq (+964)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+353" class="ng-binding ng-scope">Ireland (+353)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+972" class="ng-binding ng-scope">Israel (+972)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+39" class="ng-binding ng-scope">Italy (+39)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+225" class="ng-binding ng-scope">Ivory Coast (+225)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Jamaica (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+81" class="ng-binding ng-scope">Japan (+81)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+44" class="ng-binding ng-scope">Jersey (+44)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+962" class="ng-binding ng-scope">Jordan (+962)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+254" class="ng-binding ng-scope">Kenya (+254)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+965" class="ng-binding ng-scope">Kuwait (+965)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+996" class="ng-binding ng-scope">Kyrgyzstan (+996)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+856" class="ng-binding ng-scope">Laos (+856)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+371" class="ng-binding ng-scope">Latvia (+371)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+961" class="ng-binding ng-scope">Lebanon (+961)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+266" class="ng-binding ng-scope">Lesotho (+266)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+231" class="ng-binding ng-scope">Liberia (+231)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+218" class="ng-binding ng-scope">Libya (+218)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+423" class="ng-binding ng-scope">Liechtenstein (+423)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+370" class="ng-binding ng-scope">Lithuania (+370)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+352" class="ng-binding ng-scope">Luxembourg (+352)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+853" class="ng-binding ng-scope">Macao (+853)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+389" class="ng-binding ng-scope">Macedonia (+389)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+261" class="ng-binding ng-scope">Madagascar (+261)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+265" class="ng-binding ng-scope">Malawi (+265)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+60" class="ng-binding ng-scope">Malaysia (+60)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+960" class="ng-binding ng-scope">Maldives (+960)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+223" class="ng-binding ng-scope">Mali (+223)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+356" class="ng-binding ng-scope">Malta (+356)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+596" class="ng-binding ng-scope">Martinique (+596)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+222" class="ng-binding ng-scope">Mauritania (+222)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+230" class="ng-binding ng-scope">Mauritius (+230)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+52" class="ng-binding ng-scope">Mexico (+52)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+691" class="ng-binding ng-scope">Micronesia (+691)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+373" class="ng-binding ng-scope">Moldova (+373)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+377" class="ng-binding ng-scope">Monaco (+377)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+976" class="ng-binding ng-scope">Mongolia (+976)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+382" class="ng-binding ng-scope">Montenegro (+382)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Montserrat (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+212" class="ng-binding ng-scope">Morocco (+212)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+258" class="ng-binding ng-scope">Mozambique (+258)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+95" class="ng-binding ng-scope">Myanmar (+95)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+264" class="ng-binding ng-scope">Namibia (+264)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+977" class="ng-binding ng-scope">Nepal (+977)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+31" class="ng-binding ng-scope">Netherlands (+31)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+599" class="ng-binding ng-scope">Netherlands Antilles (+599)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+687" class="ng-binding ng-scope">New Caledonia (+687)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+64" class="ng-binding ng-scope">New Zealand (+64)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+505" class="ng-binding ng-scope">Nicaragua (+505)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+227" class="ng-binding ng-scope">Niger (+227)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+234" class="ng-binding ng-scope">Nigeria (+234)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+672" class="ng-binding ng-scope">Norfolk Island (+672)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+47" class="ng-binding ng-scope">Norway (+47)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+92" class="ng-binding ng-scope">Pakistan (+92)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+680" class="ng-binding ng-scope">Palau (+680)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+970" class="ng-binding ng-scope">State of Palestine (+970)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+507" class="ng-binding ng-scope">Panama (+507)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+675" class="ng-binding ng-scope">Papua New Guinea (+675)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+595" class="ng-binding ng-scope">Paraguay (+595)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+51" class="ng-binding ng-scope">Peru (+51)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+63" class="ng-binding ng-scope">Philippines (+63)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+48" class="ng-binding ng-scope">Poland (+48)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+351" class="ng-binding ng-scope">Portugal (+351)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Puerto Rico (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+974" class="ng-binding ng-scope">Qatar (+974)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+262" class="ng-binding ng-scope">Reunion/Mayotte (+262)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+40" class="ng-binding ng-scope">Romania (+40)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+7" class="ng-binding ng-scope">Russia (+7)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+250" class="ng-binding ng-scope">Rwanda (+250)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Saint Kitts and Nevis (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Saint Lucia (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Saint Vincent and the Grenadines (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+685" class="ng-binding ng-scope">Samoa (+685)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+378" class="ng-binding ng-scope">San Marino (+378)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+239" class="ng-binding ng-scope">Sao Tome and Principe (+239)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+966" class="ng-binding ng-scope">Saudi Arabia (+966)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+221" class="ng-binding ng-scope">Senegal (+221)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+381" class="ng-binding ng-scope">Serbia (+381)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+248" class="ng-binding ng-scope">Seychelles (+248)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+232" class="ng-binding ng-scope">Sierra Leone (+232)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+65" class="ng-binding ng-scope">Singapore (+65)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+386" class="ng-binding ng-scope">Slovenia (+386)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+677" class="ng-binding ng-scope">Solomon Islands (+677)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+252" class="ng-binding ng-scope">Somalia (+252)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+27" class="ng-binding ng-scope">South Africa (+27)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+82" class="ng-binding ng-scope">South Korea (+82)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+211" class="ng-binding ng-scope">South Sudan (+211)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+34" class="ng-binding ng-scope">Spain (+34)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+94" class="ng-binding ng-scope">Sri Lanka (+94)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+211" class="ng-binding ng-scope">Sudan (+211)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+597" class="ng-binding ng-scope">Suriname (+597)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+268" class="ng-binding ng-scope">Swaziland (+268)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+46" class="ng-binding ng-scope">Sweden (+46)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+41" class="ng-binding ng-scope">Switzerland (+41)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+963" class="ng-binding ng-scope">Syria (+963)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+886" class="ng-binding ng-scope">Taiwan (+886)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+992" class="ng-binding ng-scope">Tajikistan (+992)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+255" class="ng-binding ng-scope">Tanzania (+255)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+66" class="ng-binding ng-scope">Thailand (+66)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+228" class="ng-binding ng-scope">Togo (+228)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+676" class="ng-binding ng-scope">Tonga (+676)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Trinidad and Tobago (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+216" class="ng-binding ng-scope">Tunisia (+216)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+90" class="ng-binding ng-scope">Turkey (+90)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+993" class="ng-binding ng-scope">Turkmenistan (+993)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Turks and Caicos Islands (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+688" class="ng-binding ng-scope">Tuvalu (+688)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">U.S. Virgin Islands (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+256" class="ng-binding ng-scope">Uganda (+256)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+380" class="ng-binding ng-scope">Ukraine (+380)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+971" class="ng-binding ng-scope">United Arab Emirates (+971)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+44" class="ng-binding ng-scope">United Kingdom (+44)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">United States (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+598" class="ng-binding ng-scope">Uruguay (+598)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+998" class="ng-binding ng-scope">Uzbekistan (+998)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+678" class="ng-binding ng-scope">Vanuatu (+678)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+58" class="ng-binding ng-scope">Venezuela (+58)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+84" class="ng-binding ng-scope">Vietnam (+84)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+1" class="ng-binding ng-scope">Virgin Islands, British (+1)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+967" class="ng-binding ng-scope">Yemen (+967)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+260" class="ng-binding ng-scope">Zambia (+260)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      <option ng-repeat="prefix in prefixes" ng-class="{true:'preffered', false:''}[prefix.preffered]" value="+263" class="ng-binding ng-scope">Zimbabwe (+263)</option>
	      <!-- end ngRepeat: prefix in prefixes -->
	      </select>
      </div>
      <input type="tel" name="phone" placeholder="Enter your phone number without the country prefix"   class="ng-pristine ng-untouched ng-scope  " style="">
      <button type="submit" class="btn green full midi ng-binding ng-scope" >Continue</button>
      <span class="standaloneLink ng-binding ng-scope" >By clicking on the button above, you agree to the 
	  
	  
	    <div class="morph-button morph-button-overlay morph-button-fixed">
                    <button type="button">network terms &amp; conditions</button>
                    <div class="morph-content">
                      <div>
                        <div class="content-style-overlay"> <span class="icon icon-close">Close the overlay</span>
                          <h2>Terms &amp; Conditions</h2>
                          <p>Provider of Service (hereinafter “Provider”) and operator of Network Hotspot Connection (hereinafter "Network Operator") undertake to respect privacy of Service user. Provider and Network Operator oblige to handle the information collected by us according to the law, esp. to Directive 95/46/EC.</p>
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
                          <p>You undertake to do not act in any way that may affect the running of the network services or other technology connected to it (for example, other Wi-Fi users’ devices). In particular, do not upload or download very large files and make sure your device is protected by up-to-date anti-virus software. Make sure that your device complies with all applicable laws and standards. You must make sure that you have any necessary licences before you use it to connect to network services and make sure that your device is compatible.</p>
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
                          <p>Cookies. When the Network Operator serves in-session ads everyone who uses his internet connection visits a website containing cookies. These sites send your browser a cookie – a small piece of data stored on your device. The purpose of the cookie is to improve your browsing experience. If you do not want to accept that your device receives and stores cookies, you can alter your security settings on your web browser. However, note that certain parts of browsed sites may only be used fully if your browser allows cookies. Thus, your reading experience of sites may be affected negatively by removing and not allowing cookies. In addition, the Provider may serve ads on websites using ad-serving technology. In doing so, one of ad servers will place or read a unique ad-serving cookie on your device and will use non-personal information about your browser and your activity at the site to serve ads on this and other sites. The ad-serving cookie is a persistent cookie. In addition, note that you are always able to prevent cookies from any website from being installed on your computer by readjusting your browser settings. For more information about cookies and how to disable them, you should consult the help section of your browser.</p>
                          <h2>VII. Network Functionality</h2>
                          <p>Network services works as internet connection services free of charge, except for Premium Internet Access. It may not be available 24/7 for technical, legal or operational reasons. The Provider can also suspend your access at any time in our sole discretion without responsibility to you. You use the network services at your own risk and neither the Provider nor the Network Operator is responsible to you for any damages, losses, costs or expenses you suffer because the network services are unavailable, does not operate as expected or causes loss or damage to any data.</p>
                          <h2>VIII. Premium Internet Access (Pay-Thru, Pay-As-You-Go)</h2>
                          <p>When you select Premium Internet Access you need to provide valid credit card information to pay for it. You have to authorize the price of the selected Premium internet to be charged to your credit card. You are responsible for maintaining up-to-date and accurate information (including without limitation legal name, valid billing address, email, telephone number, credit card information). After the payment is proceeded you are able to use selected Premium Internet Access provided by the Network Operator. </p>
                          <p>In case of multi-device access you are responsible for maintaining the secrecy of the PIN delivered to entered email address.
                          
                          <p>
                          
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
 
</html>