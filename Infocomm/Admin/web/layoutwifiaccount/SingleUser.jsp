
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<script type="text/javascript" src="../js/jquery.timer.js"></script>

<script type="text/javascript" src="../js/jquery.min.js"></script>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<div class="container">
    <div class="row">
        <div class="col-md-10">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>

                </div>

                <s:form action="singleuser.icms"  theme="simple"   >

                    <div class="panel-body">

                        <div class="alert alert-info alert-dismissable" id="error_ctrl" >
                            <button type="button" class="close badge-blue" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle-o"></i> </button>
                            <strong>Info:</strong> <span id="msg_error">Please enter required fields.</span>
                        </div>
                        <div class="form-group"   >
                            <label for="cp" class="col-lg-2 control-label">Plan<span style="color: red; padding-left:  10px" >*</span></label>
                            <div class="col-md-10" style="padding-bottom: 10px">
                                <div class="input-group"> <span class="input-group-addon"><i class="fa fa-shopping-cart"></i> </span>
                                    <s:select headerKey=""  cssStyle="width:220px"   headerValue="ALL"   cssClass="form-control"  id="batchId" name="batchDesc" list="prepaidbatchList" listKey="batchId" listValue="batchDesc" ></s:select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cp2" class="col-lg-2 control-label">Wifi_Username<span style="color: red; padding-left:  10px" >*</span></label>
                                <div class="col-md-10" style="padding-bottom: 10px">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-user"></i> </span>
                                        <input type="text" maxlength="15" class="form-control" value="" id="username" name="username" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="timepicker" class="col-lg-2 control-label">Wifi_Password<span style="color: red; padding-left:  10px" >*</span></label>
                                <div class="col-md-10" style="padding-bottom: 10px">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-lock"></i> </span>
                                        <input type="text" maxlength="10" id="password" class="form-control" value="" >
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="timepicker" class="col-lg-2 control-label">Wifi_Re-Password <span style="color: red; padding-left:  10px" >*</span></label>
                                <div class="col-md-10" style="padding-bottom: 10px">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-lock"></i> </span>
                                        <input type="text"  maxlength="10" id="repassword" class="form-control" value="" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="datepicker" class="col-lg-2 control-label">First Name<span style="color: red; padding-left:  10px" >*</span></label>
                                <div class="col-md-10" style="padding-bottom: 10px">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i> </span>
                                        <input type="text"  maxlength="20" id="param1" class="form-control" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="datepicker" class="col-lg-2 control-label">Last Name</label>
                                <div class="col-md-10" style="padding-bottom: 10px">
                                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i> </span>
                                        <input type="text"  maxlength="20"  id="param2" class="form-control" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="datepicker_2" class="col-lg-2 control-label">Country<span style="color: red; padding-left:  10px" >*</span></label>
                                <div class="col-md-10" style="padding-bottom: 10px">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-flag"></i> </span>

                                    <s:select   cssStyle="width:220px"  cssClass="form-control" id="countryCode"  name="countryCode"  list="countryList"  headerKey="968"  headerValue="Oman-968"  listKey="countryCode" listValue="countryName+'-'+countryCode" />

                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="datepicker_2" class="col-lg-2 control-label">Mobile<span style="color: red; padding-left:  10px" >*</span></label>
                            <div class="col-md-10" style="padding-bottom: 10px">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i> </span>
                                    <input type="text"    maxlength="20" id="mobile" class="form-control margin-top-none" value="" name="mobile">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="datepicker_2" class="col-lg-2 control-label"></label>
                            <div class="col-md-10" style="padding-bottom: 10px">
                                <div class="input-group pull-right">
                                    <span class="label label-danger margin-right-lg">Note:</span>   <span class="label label-info margin-right-lg">It is Admin(<s:property value="currentUser.username"/>) responsibility to fill the correct information of below user.User will be traced by his below information in case of any misuse of Internet.</span>
                                    <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Add</button>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>



</s:form>

<script type="text/javascript">
    (function ($) {
        $(function () {
            $("#refresh").click(function ()
            {
                jQuery('#error_ctrl').css("color", "black");


                if ($("#username").val().trim() == '' ||
                        $("#password").val().trim() == '' ||
                        $("#repassword").val().trim() == '' ||
                        $("#batchId").val().trim() == '' ||
                        $("#mobile").val().trim() == '' ||
                        $("#countryCode").val().trim() == '' ||
                        $("#param1").val().trim() == ''
                        )
                {


                    $("#msg_error").html("Please enter all mandatory field.");
                    jQuery('#error_ctrl').css("color", "red");
                    return   false;

                } else
                {

                    $("#msg_error").html("Please wait we are cresting user.");
                    jQuery('#error_ctrl').css("color", "blue");

                }

                var data =
                        {
                            'reportId': 'OP_ADD_USER_ACCOUNT',
                            'username': $("#username").val(),
                            'password': $("#password").val(),
                            'repassword': $("#repassword").val(),
                            'mobile': $("#mobile").val(),
                            'countryCode': $("#countryCode").val(),
                            'batchId': $("#batchId").val(),
                            'param1': $("#param1").val(),
                            'param2': $("#param2").val()


                        };

                $.ajax({
                    type: "POST",
                    url: "json/JsonWiFiUserAccount.jsp?data=" + JSON.stringify(data),
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function (data) {

                        var output = $.parseJSON(data);
                        if ($.trim(output.system_message).length > 4)
                        {
                            $("#msg_error").html(output.system_message);
                        }


                    }
                    ,
                    error: function () {
                        jQuery('#error_ctrl').css("color", "red");
                        $("#msg_error").html("Ops!! we face technical error.Please try again.");

                    }
                });
            }
            );



        });
    })(jQuery);

</script>





