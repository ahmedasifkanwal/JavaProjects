
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

                <s:form action="datautilization.icms"  theme="simple"   >
                    <jsp:include page="../include/ChartComponents.jsp"/>



                    <div class="container"  >
                        <div class="row" style="margin-top: 5px ">
                            <jsp:include page="../control/WaitControl.jsp"></jsp:include>

                            <jsp:include page="../control/InBusinessTypeMobile.jsp"></jsp:include>
                            <div class="col-sm-2 col-md-2">
                                <div class="console-btn" style="color:#33cccc ;padding: 1px 1px 1px 10px ;border-radius:5px;width:90%" data-toggle="tooltip" title="" data-original-title="Click here to Refresh" data-placement="bottom">
                                    <div class="console-icon divider-right" >
                                        <span class="glyphicons glyphicons-refresh" ></span> </div>
                                    <div class="console-text">

                                        <div class="console-subtitle pull-right">
                                            <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Refresh</button>

                                        </div>
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
                                                            'reportId': 'RPT_WIFI_USER_ACCOUNT',
                                                            'ownerName': $("#ownerName").val(),
                                                            'status': $("#status").val(),
                                                            'mobile': $("#mobile").val(),
                                                            'expired': expired


                                                        };

                                                       

                                                $.ajax({
                                                    type: "POST",
                                                    url: "json/JsonHotspot.jsp?data=" + JSON.stringify(data),
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
                    <div class="panel-title"> <span class="glyphicon glyphicon-list-alt"></span> Hotspot(Customer) </div>
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


