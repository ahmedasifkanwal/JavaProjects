<!doctype html>
<html class="demo-2 demo-dark">
	  <head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="refresh" content="10; URL=http://www.omantel.om">
	  <title></title>
	  <link href="boilerplate.css" rel="stylesheet" type="text/css">
	  <link href="resp.css" rel="stylesheet" type="text/css">
	  <link href="socimain.css" rel="stylesheet" type="text/css">
	  <script src="respond.min.js"></script>
	  <link rel="stylesheet" href="css/reset.min.css">

 
      
       <!-- loading icon-->
		<link rel="stylesheet" type="text/css" href="delloading/css/style.css" />
		<script src="delloading/js/modernizr.custom.63321.js"></script>
 <!-- loading icon -->
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
          <link rel="stylesheet" href="css/demo.css">

	  <!-- image move -->
      
      
      <script type = "text/javascript">
/*author Philip M. 2010*/

var timeInSecs;
var ticker;

function startTimer(secs){
timeInSecs = parseInt(secs)-1;
ticker = setInterval("tick()",1000);   // every second
}

function tick() {
var secs = timeInSecs;
if (secs>0) {
timeInSecs--;
}
else {
clearInterval(ticker); // stop counting at zero
// startTimer(60);  // remove forward slashes in front of startTimer to repeat if required
}

document.getElementById("countdown").innerHTML = secs;
}

startTimer(10);  // 10 seconds 

      </script>


      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-90321498-1', 'auto');
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
	background: url(stardust.jpg) repeat;
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
 
.reload:hover {
	background: #317af2;
}
 
.clear {
	width: auto;
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
	position: absolute;
	min-height: 100% !important;
	width: 100%;
	z-index: 0;
}
.ibg-bg {
	position: absolute;
	width: 110%;
}

.main {
	position: relative;
}
</style>

	  </head>
	  <body>
	  
	  <div class="ab-parallex mobile" id="scene" >
	  <script type="text/javascript">
		$(function(){
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
				});
				
				 

			});
		}); // */
		</script>
<div class="layer main demo" data-depth="1.0" data-parallaxify-range="10" data-parallaxify-range-x="390" data-parallaxify-range-y="160" >
    <img src="interactive_bg/free_pda.jpg" alt="" style="min-width:1000px;width:100%;height:auto; margin-left:-190px; transition: .5s; transform: translateZ( +100px );"  >
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
         <img src="interactive_bg/free1.jpg" alt="" style="min-width:900px;width:100%;height:auto;" >
      </div>
     </div>
	 
	 
<!-- loading -->
<div class="se-pre-con"></div>
<!-- loading -->
 
<div class="gridContainer clearfix">
<div class="wrapper bg" >
<app-header header="header" class="ng-scope ng-isolate-scope">
        <header class="black cobranded" ><span class="logo whitelabeled ng-scope" style="background: rgba(0,0,0,1);" > <img  src="images/omantel.png" ></span><span  class="ng-binding">Free Wireless Internet 
       </span>
          <div id="countertop"> <div id="countdown"  ></div>
          
           
          
				<!-- the component -->
				<div class="spinner"></div>
          
          </div>
        <span  class="ng-binding"> </span> </header>
      </app-header>

 <div id="bottomConnectbut">
 <p>Visit WiFi partner or wait.</p>
 <a href="http://www.omantel.om" class="btn btnAd loaderButton banner ng-binding " id="div1" style="visibility:hidden;">Connect</a>
 
 <div class="clear">
 </div>

</div>