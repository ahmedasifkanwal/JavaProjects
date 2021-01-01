
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>
                    <div class="form-group pull-right">
                        <jsp:include flush=""  page="../include/CSVImport.jsp"></jsp:include>
                            <label class="radio-inline text-blue">
                                <input class="radio" type="radio"  name="historicaldata"   id="chkcurrent"  checked>
                                Current </label>
                            <label class="radio-inline text-blue">
                                <input class="radio" type="radio" id="chkhistorical"  name="historicaldata"  >
                                Historical </label>



                        </div>
                    </div>

                <s:form action="complaint.icms"  theme="simple"   >
                    <div class="container"  >
                        <div class="row" style="margin-top: 5px ">


                            <div class="col-md-12">
                                <div class="panel">

                                    <div class="panel-body">
                                        <form class="form-control" role="form">
                                            <div class="form-group">

                                                <div class="col-md-3">
                                                    <div class="input-group" >

                                                        <label   for="cp" class="col-lg-2 control-label " style="margin-right:4px">LOGIN_DATE</label>
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i> </span>
                                                        <s:textfield id="daterange"   cssClass="form-control margin-top-none"  name="daterange"/>
                                                    </div>
                                                </div>



                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label" style="margin-right:8px">START_TIME</label>

                                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i> </span>
                                                        <s:textfield name="param1"   id="param1" cssClass="form-control timepicker"  />
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label" style="margin-right:9px">END_TIME</label>

                                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i> </span>
                                                        <s:textfield name="param2"  id="param2" cssClass="form-control timepicker"  />
                                                    </div>
                                                </div>



                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label">WIFI_USER_ID</label>

                                                        <span class="input-group-addon"><i class="fa fa-user"></i> </span>
                                                        <s:textfield   id="username"  cssClass="form-control margin-top-none"  name="username"/>
                                                    </div>
                                                </div>



                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label">OSA_SORC_IP</label>

                                                        <span class="input-group-addon"><i class="fa fa-arrow-circle-right"></i> </span>
                                                        <s:textfield   id="OSA_SOURCE_IP"  cssClass="form-control margin-top-none"  name="OSA_SOURCE_IP"/>



                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label">ODA_DEST_IP</label>

                                                        <span class="input-group-addon"><i class="fa fa-arrow-circle-left"></i> </span>
                                                        <s:textfield   id="ODA_DEST_IP"  cssClass="form-control margin-top-none"  name="ODA_DEST_IP"/>



                                                    </div>
                                                </div>

                                                        <div class="col-md-3">
                                                            <div class="input-group">
                                                                <label for="cp" class="col-lg-2 control-label">SA_SORC_IP</label>

                                                        <span class="input-group-addon"><i class="fa fa-arrow-right"></i> </span>
                                                        <s:textfield   id="SA_SOURCE_IP"  cssClass="form-control margin-top-none"  name="SA_SOURCE_IP"/>



                                                    </div>
                                                </div>

                                                        <div class="col-md-3">
                                                            <div class="input-group">
                                                                <label for="cp" class="col-lg-2 control-label" style="margin-right:10px">DA_DEST_IP</label>

                                                        <span class="input-group-addon"><i class="fa fa-arrow-left"></i> </span>
                                                        <s:textfield   id="DA_DESTI_IP"  cssClass="form-control margin-top-none"  name="DA_DESTI_IP"/>



                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label" style="margin-right:12px">MAC_ADDR</label>

                                                        <span class="input-group-addon"><i class="fa fa-road"></i> </span>
                                                        <s:textfield   id="macadds"  cssClass="form-control margin-top-none"  name="macadds"/>



                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label"  style="margin-right:22px">WEB_URL</label>

                                                        <span class="input-group-addon"><i class="fa fa-globe"></i> </span>
                                                        <s:textfield   id="uri"  cssClass="form-control margin-top-none"  name="uri"/>



                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <label for="cp" class="col-lg-2 control-label"  style="margin-right:4px">WEB_HOST</label>

                                                        <span class="input-group-addon"><i class="fa fa-globe"></i> </span>
                                                        <s:textfield   id="host"  cssClass="form-control margin-top-none"  name="host"/>



                                                    </div>
                                                </div>

                                                        <div class="col-md-3">
                                                            <div class="input-group">
                                                                <label for="cp" class="col-lg-2 control-label"  style="margin-right:43px">VLAN</label>

                                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i> </span>

                                                        <s:select headerKey=""  cssStyle="width:150px"   headerValue="ALL"   cssClass="form-control"  id="vlanId" name="vlanId" list="peVlanList" listKey="vlanId" listValue="vlanName" ></s:select>


                                                    </div>
                                                </div>


                                                        <div class="col-md-3 pull-right" style="margin-top:5px">
                                                            <div class="input-group">

                                                            <button     id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Refresh</button>
                                                        <jsp:include page="../control/WaitControl.jsp"></jsp:include>


                                                    </div>
                                                        </div>

                                                </div>


                                            </form>
                                        </div>


                                    </div>
                                </div>









                        </div>
                        <div class="panel-body">
                            <script type="text/javascript">
                                    (function ($) {
                                        $(function () {
                                            $("#refresh").click(function ()
                                            {
                                                var x = 0;
                                                setInterval(function () {
                                                    x++;
                                                    $('#ImgProcessingtime').html(x);
                                                }, 1000);

                                                var expired = false;
                                                if ($("#chkhistorical").is(':checked'))
                                                {
                                                    expired = true;

                                                }
                                                jQuery('#ImgProcessing').css("display", "inline");
                                                $("body").css('cursor', 'url(img/downloading.png),auto');

                                                var data =
                                                        {
                                                            'reportId': 'RPT_SEARCH_LI',
                                                            'param1': $("#param1").val(),
                                                            'param2': $("#param2").val(),
                                                            'mobile': $("#mobile").val(),
                                                            'username': $("#username").val(),
                                                            'OSA_SOURCE_IP': $("#OSA_SOURCE_IP").val(),
                                                            'ODA_DEST_IP': $("#ODA_DEST_IP").val(),
                                                            'SA_SOURCE_IP': $("#SA_SOURCE_IP").val(),
                                                            'ODA_DEST_IP': $("#ODA_DEST_IP").val(),
                                                                    'macadds': $("#macadds").val(),
                                                            'uri': $("#uri").val(),
                                                            'vlanId': $("#vlanId").val(),
                                                            'daterange': $("#daterange").val(),
                                                            'expired': expired


                                                        };
                                                $.ajax({
                                                    type: "POST",
                                                    url: "json/JsonSystemLi.jsp?data=" + JSON.stringify(data),
                                                    data: JSON.stringify(data),
                                                    contentType: "application/json",
                                                    success: function (data) {

                                                        var output = $.parseJSON(data);
                                                        

                                                        $('.table-responsive').html(output.datatable);
                                                        jQuery('#ImgProcessing').css("display", "none");

                                                        $("body").css('cursor', 'default');
                                                        x = 0;

                                                        if ($.trim(output.system_message).length > 10)
                                                        {
                                                            alert(output.system_message);
                                                        }


                                                    }
                                                    ,
                                                    error: function () {
                                                        alert("There is error.Please try again.");
                                                        x = 0;
                                                    }
                                                });
                                            }
                                            );



                                        });
                                    })(jQuery);





                                </script>



                            </div>





                    </div>

                </s:form>


            </div>
        </div>
    </div>



    <div class="row">

        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-list-alt"></span> Complaint </div>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" style="text-align: center">
                            <thead >
                                <tr >
                                <th style='text-align:center'>#</th>
                                <th style="text-align:center">Table heading</th>
                                <th style="text-align:center"  >Table heading</th>
                                <th style="text-align:center"  >Table heading</th>
                                <th  style="text-align:center">Table heading</th>
                                <th  style="text-align:center" >Table heading</th>
                                <th  style="text-align:center">Table heading</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


