<%@page import="com.info.cms.helper.SessionListener"%>
<%@page import="com.info.cms.helper.LoggedInUser"%>
<%@page import="com.info.cms.helper.StringHelper"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.wifi.cms.entity.SysLoginHistory"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    try {
            if (session.getAttribute("Users") != null) {
                SysUsers user = (SysUsers) session.getAttribute("Users");
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
            SessionListener.logoutUser(user.getUsername(), loginHistory);

        }
            } catch (Exception ex) {
            }

%>
<html>
    <head>
        <link rel="shortcut icon" href="img/logos/icms.ico"/>
        <title>WiFi Admin 1.1 Login</title>

        <!-- Font CSS  -->
        <!-- Core CSS  -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <!-- Theme CSS -->
        <link rel="stylesheet" type="text/css" href="css/theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/pages.css"/>

    </head>


    <body class="login-page">

        <!-- Start: Main -->
        <div id="main">
            <div class="container">
                <div class="row">
                    <div id="page-logo">

                    </div>
                </div>
                <div class="row">
                    <div class="panel">
                        <div class="panel-heading">
                            <div class="panel-title"> <span class="glyphicon glyphicon-lock"></span> iCMS1.1 Admin Login </div>
                        </div>
                        <s:form action="loginsuccess.icms" method="post" theme="simple"  class="cmxform">

                            <div class="panel-body">


                                <div   style="border-color: #C9C9C9; box-shadow: 0px 1px 1px 0px rgba(0, 0, 0, 0.33); background-color: #FFFFFF; background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.15) 35%, rgba(0, 0, 0, 0.12) 100%);
                                       border: 1px solid transparent; border-radius: 4px;   height: 100px; text-align:center; ;}">

                                    <img src="img/logos/logo.png" class="img-responsive" alt="logo " style="margin-left: 137px; padding-top: 10px; max-width: 95px; "/>

                                </div>



                                <div class="login-avatar">  <s:if test="getActionErrors()!=null">

                                        <div class="alert alert-danger alert-dismissable">
                                            <s:actionerror cssErrorClass="customeErrorhome" />
                                        </div>



                                    </s:if>
                                    <s:else>
                                        <div class="alert alert-success alert-dismissable">

                                            Please login to access the administration panel. </div>



                                    </s:else> </div>



                                <div class="form-group">
                                    <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
                                        <s:textfield name="userName" cssClass="form-control phone" title="Please enter your username"  value="systemadmin" > </s:textfield>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span> </span>
                                        <s:password name="userPassWord" cssClass="form-control product"  title="Please enter your password" value="" />
                                        <s:fielderror   fieldName="userPassWord" cssClass="customeError"/>


                                        </div>
                                    </div>




                            </div>
                            <div class="panel-footer">
                                <div class="form-group margin-bottom-none">
                                    <s:submit method="execute" key="BTN01" align="center"  cssClass="btn btn-danger btn-gradient pull-right" />


                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: Main -->

    </body>

</html>
