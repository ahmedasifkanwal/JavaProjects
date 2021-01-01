<%@page import="com.info.cms.helper.SessionListener"%>
<%@page import="com.info.cms.helper.LoggedInUser"%>
<%@page import="com.info.cms.helper.StringHelper"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.wifi.cms.entity.SysLoginHistory"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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


        <!-- Mirrored from admindesigns.com/stardom/blank.html by HTTrack Website Copier/3.x [XR&CO'2008], Mon, 02 Jun 2014 10:48:56 GMT -->

        <!-- Meta, title, CSS, favicons, etc. -->

        <title>WiFi Admin 1.1</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script language="JavaScript" type="text/javascript" src="js/common.js"></script>
            <!-- Font CSS  -->
            <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700">
                <!-- Core CSS  -->
                <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
                    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
                        <link rel="stylesheet" type="text/css" href="fonts/glyphicons_pro/glyphicons.min.css">
                            <link rel="stylesheet" type="text/css" href="fonts/icomoon/style.min.css">

                                <!-- Dynamic table start -->
                                <link rel="stylesheet" type="text/css" href="vendor/plugins/datatables/css/datatables.min.css">
                                    <link rel="stylesheet" type="text/css" href="vendor/plugins/datatables/extras/TableTools/media/css/TableTools.css">
                                        <link rel="stylesheet" type="text/css" href="vendor/editors/xeditable/css/bootstrap-editable.css">
                                            <!-- Dynamic end start -->

                                            <link rel="stylesheet" type="text/css" href="vendor/plugins/dynatree/skin-vista/ui.dynatree.css">

                                                <!-- Plugin CSS -->

                                                <link rel="stylesheet" type="text/css" href="vendor/plugins/chosen/chosen.min.css">
                                                    <link rel="stylesheet" type="text/css" href="vendor/plugins/timepicker/bootstrap-timepicker.min.css">
                                                        <link rel="stylesheet" type="text/css" href="vendor/plugins/colorpicker/colorpicker.css">
                                                            <link rel="stylesheet" type="text/css" href="vendor/plugins/datepicker/datepicker.css">
                                                                <link rel="stylesheet" type="text/css" href="vendor/plugins/daterange/daterangepicker.css">
                                                                    <link rel="stylesheet" type="text/css" href="vendor/plugins/formswitch/css/bootstrap-switch.css">
                                                                        <link rel="stylesheet" type="text/css" href="vendor/plugins/tags/tagmanager.css">

                                                                            <!-- Theme CSS -->
                                                                            <link rel="stylesheet" type="text/css" href="css/theme.css">
                                                                                <link rel="stylesheet" type="text/css" href="css/pages.css">
                                                                                    <link rel="stylesheet" type="text/css" href="css/plugins.css">
                                                                                        <link rel="stylesheet" type="text/css" href="css/responsive.css">



                                                                                            <body class="login-page">

                                                                                                <!-- Start: Main -->
                                                                                                <div id="main">
                                                                                                    <div class="container">
                                                                                                        <span id="msg_error"></span>
                                                                                                        <s:form action="loginsuccess.icms" method="post" theme="simple"  class="cmxform">

                                                                                                            <h2> IMISI to Mobile Number</h2> 

                                                                                                            <div class="row">



                                                                                                                <div class="form-group">
                                                                                                                    <label for="datepicker_2" class="col-lg-2 control-label">IMSI</label>
                                                                                                                    <div class="col-md-2" style="padding-bottom: 10px">
                                                                                                                        <div class="input-group"> <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i> </span>
                                                                                                                            <input type="text"  maxlength="20"  id="param1" class="form-control" value=""/>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>


                                                                                                                <div class="form-group">
                                                                                                                    <label for="datepicker_2" class="col-lg-2 control-label">Omantel=0 , Roaming=1</label>
                                                                                                                    <div class="col-md-1" style="padding-bottom: 10px">
                                                                                                                        <div class="input-group"> <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i> </span>
                                                                                                                            <input type="text"  maxlength="1"  id="param2" class="form-control" value="0"/>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="form-group">
                                                                                                                    <label for="datepicker_2" class="col-lg-2 control-label"></label>
                                                                                                                    <div class="col-md-1" style="padding-bottom: 10px">
                                                                                                                        <div class="input-group pull-right">
                                                                                                                            <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Get Mobile</button>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <h2> Mobile Number to HLR Verification</h2>


                                                                                                            <div class="row">



                                                                                                                <div class="form-group">
                                                                                                                    <label for="datepicker_2" class="col-lg-2 control-label">MSDN</label>
                                                                                                                    <div class="col-md-2" style="padding-bottom: 10px">
                                                                                                                        <div class="input-group"> <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i> </span>
                                                                                                                            <input type="text"  maxlength="20"  id="mobile" class="form-control" value=""/>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>


                                                                                                                <div class="form-group">

                                                                                                                    <div class="col-md-1" style="padding-bottom: 10px">

                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="form-group">
                                                                                                                    <label for="datepicker_2" class="col-lg-2 control-label"></label>
                                                                                                                    <div class="col-md-1" style="padding-bottom: 10px">
                                                                                                                        <div class="input-group pull-right">
                                                                                                                            <button id="refreshhlr"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Get Mobile HLR Status</button>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>


                                                                                                        </s:form>


                                                                                                    </div>
                                                                                                </div>
                                                                                                <!-- End: Main -->

                                                                                                <span id="xmlRequestBody"></span>

                                                                                                </br>
                                                                                                <span id="xmlResponseBody" ></span>

                                                                                                <span id="xmlerro"></span>

                                                                                            </body>


                                                                                            <script type="text/javascript">
                                                                                                (function ($) {
                                                                                                    $(function () {
                                                                                                        $("#refresh").click(function ()
                                                                                                        {


                                                                                                        var data =
                                                                                                        {
                                                                                                        'param1': $("#param1").val(),
                                                                                                                'param2': $("#param2").val(),
                                                                                                                'reportId': 'IMSI_TO_MOBILE'


                                                                                                        };
                                                                                                                $.ajax({
                                                                                                                type: "POST",
                                                                                                                        url: "json/JsonIMSI.jsp?data=" + JSON.stringify(data),
                                                                                                                        data: JSON.stringify(data),
                                                                                                                        contentType: "application/json",
                                                                                                                        success: function (data) {

                                                                                                                        var output = $.parseJSON(data);
                                                                                                                                alert(output.xmlRequestBody);
                                                                                                                                $("#xmlRequestBody").html(output.xmlRequestBody);
                                                                                                                                $("#xmlResponseBody").html(output.xmlResponseBody);
                                                                                                                                alert(output.xmlResponseBody);
                                                                                                                                alert("Resut:" + output.ISDN);
                                                                                                                                // $("#xmlerro").html(output.xmlerro);




                                                                                                                        }
                                                                                                                ,
                                                                                                                        error: function () {

                                                                                                                        $("#msg_error").html("Ops!! we face technical error.Please try again.");
                                                                                                                        }
                                                                                                                });
                                                                                                        }

                                                                                                        //Mobile to HLR verification
                                                                                                        $("#refresh1").click(function ()
                                                                                                        {


                                                                                                            var data =
                                                                                                                    {
                                                                                                                        'mobile': $("#mobile").val(),
                                                                                                                        'reportId': 'MOBILE_HRL_STATUS'


                                                                                                                    };
                                                                                                            $.ajax({
                                                                                                                type: "POST",
                                                                                                                url: "json/JsonIMSI.jsp?reportId=MOBILE_HRL_STATUS&data=" + JSON.stringify(data),
                                                                                                                data: JSON.stringify(data),
                                                                                                                contentType: "application/json",
                                                                                                                success: function (data) {

                                                                                                                    var output = $.parseJSON(data);
                                                                                                                    alert(output.xmlRequestBody);
                                                                                                                    $("#xmlRequestBody1").html(output.xmlRequestBody);
                                                                                                                    $("#xmlResponseBody1").html(output.xmlResponseBody);
                                                                                                                    alert(output.xmlResponseBody);
                                                                                                                    alert("Resut:" + output.MSDN);
                                                                                                                    // $("#xmlerro").html(output.xmlerro);




                                                                                                                }
                                                                                                                ,
                                                                                                                error: function () {

                                                                                                                    $("#msg_error").html("Ops!! we face technical error.Please try again.");
                                                                                                                }
                                                                                                            });
                                                                                                        }



                                                                                                        );



                                                                                                    });
                                                                                                })(jQuery);

                                                                                            </script>