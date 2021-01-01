<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
        <link rel="shortcut icon" href="img/logos/icms.ico">
            <title>Error</title>

            <!-- Font CSS  -->
            <!-- Core CSS  -->
            <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
                <!-- Theme CSS -->
                <link rel="stylesheet" type="text/css" href="css/theme.css">
                    <link rel="stylesheet" type="text/css" href="css/pages.css">



                        </head>
                        <body class="login-page">

                            <!-- Start: Main -->
                            <div id="main">
                                <div class="container">
                                    <div class="row">
                                        <div id="page-logo"> <img src="img/logos/logo-red.png" class="img-responsive" alt="logo"> </div>
                                    </div>
                                    <div class="row">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title"> <span class="glyphicon glyphicon-bullhorn"></span> Error </div>
                                            </div>
                                            <s:form action="dashboard.icms" method="post" theme="simple"  class="cmxform">

                                                <div class="panel-body" >
                                                    <div class="login-avatar">
                                                        Sorry !! the page is not available for view.</br>
                                                        <s:submit key="Back"  align="left" cssClass="submit btn btn-primary btn-gradient"  />
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <div class="form-group margin-bottom-none">



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
