<%@page import="com.bytes.hrm.dao.entity.SysLoginHistory"%>
<%@page import="com.bytes.hrm.dao.entity.SysUser"%>
<%@page import="com.bytes.hrm.common.helper.SessionListener"%>
<%@page import="com.bytes.hrm.common.helper.LoggedInUser"%>
<%@page import="com.bytes.hrm.common.db.helper.StringHelper"%>
<%@page import="com.bytes.hrm.common.helper.DateHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
    String ctx = request.getContextPath();
%>
<%
    try {
        if (session.getAttribute("Users") != null) {
            SysUser user = (SysUser) session.getAttribute("Users");
            SysLoginHistory loginHistory = new SysLoginHistory();
            loginHistory.setCountry(request.getLocale().getDisplayCountry());
            loginHistory.setIp(request.getRemoteAddr());
            loginHistory.setHost(request.getRemoteHost());
            loginHistory.setEmailId(user.getEmail());
            loginHistory.setLoginDatetime(DateHelper.getCurrentDate());
            loginHistory.setLoginStatus("Logged-Out");
            loginHistory.setUserName(user.getUsername());
            loginHistory.setUsertype(StringHelper.isNullOrEmpty(user.getUserAuthority()) ? "" : user.getUserAuthority());
            LoggedInUser logUser = new LoggedInUser();
            logUser.setUserName(user.getUsername());
            logUser.setSession(request.getSession(true));
            new SessionListener().logoutUser(user.getUsername(), loginHistory);

        }
    } catch (Exception ex) {
    }

%>
<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.7
Version: 4.7.1
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title><jsp:include page="../layout/_inc_page_title.jsp"/>   </title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for " name="description" />
        <meta content="" name="author" />

        <%@include file="../layout/_inc_head.jsp"  %>
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="assets/pages/css/login-5.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class=" login">
        <!-- BEGIN : LOGIN PAGE 5-1 -->
        <div class="user-login-5">
            <div class="row bs-reset">
                <div class="col-md-6 bs-reset mt-login-5-bsfix">
                    <div class="login-bg" style="background-image:url(<%=ctx%>/assets/pages/img/login/bg1.jpg)">
                </div>
                </div>
                <div class="col-md-6 login-container bs-reset mt-login-5-bsfix">
                    <div class="login-content">
                        <h1>Bytes HRM System</h1>
                        <p> World first unique,simple and rich in HR features with complete functionality </p>
   
                       
                        <s:form action="loginsuccess.itb" cssClass="login-form" method="post" theme="simple"  novalidate="novalidate">

                            <div class="alert alert-danger display-hide">
                                <button class="close" data-close="alert"></button>
                                <span>Enter any username and password. </span>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <s:textfield cssClass="form-control form-control-solid placeholder-no-fix form-group"  autocomplete="off" placeholder="Username" value="systemadmin" name="userName" id="userName" required="required"  /> </div>
                                <div class="col-xs-6">
                                    <s:password cssClass="form-control form-control-solid placeholder-no-fix form-group"  autocomplete="off" placeholder="Password" value="systemadmin" name="userPassWord" id="userPassWord" required="required" /> </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="rem-password">
                                        <label class="rememberme mt-checkbox mt-checkbox-outline">
                                            <s:checkbox  name="remember" value="1" /> Remember me
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-8 text-right">
                                    <div class="forgot-password">
                                        <a href="javascript:;" id="forget-password" class="forget-password">Forgot Password?</a>
                                    </div>
                                    <button class="btn green" type="submit">Sign In</button>
                                </div>
                            </div>
                        </s:form>
                        <!-- BEGIN FORGOT PASSWORD FORM -->
                        <form class="forget-form" action="javascript:;" method="post">
                            <h3 class="font-green">Forgot Password ?</h3>
                            <p> Enter your e-mail address below to reset your password. </p>
                            <div class="form-group">
                                <input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                            <div class="form-actions">
                                <button type="button" id="back-btn" class="btn green btn-outline">Back</button>
                                <button type="submit" class="btn btn-success uppercase pull-right">Submit</button>
                            </div>
                        </form>
                        <!-- END FORGOT PASSWORD FORM -->
                    </div>
                    <div class="login-footer">
                        <div class="row bs-reset">
                            <div class="col-xs-5 bs-reset">
                                <ul class="login-social">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <i class="icon-social-dribbble"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-7 bs-reset">
                                <div class="login-copyright text-right">
                                    <p style="text-align: center">Powered by:</p>
                                        <img src="<%=ctx%>/assets/pages/img/login/logo.png" />  <!--class="login-logo"-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../layout/_inc_footer_script.jsp" %>
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src= "assets/pages/scripts/login-5.js" type="text/javascript"></script>
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/login-5.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>