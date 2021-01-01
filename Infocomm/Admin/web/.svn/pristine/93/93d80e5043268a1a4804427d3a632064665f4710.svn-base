
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

                </div>

                    <s:form action="onlineusers.icms"  theme="simple"   >
                        <jsp:include page="../include/ChartComponents.jsp"/>

                    <div class="container"  >
                        <div class="row" style="margin-top: 5px ">
                            <jsp:include page="../control/WaitControl.jsp"></jsp:include>
                            <jsp:include page="../control/InOwnerVlan.jsp"></jsp:include>

                            <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Refresh</button>

                        </div>

                            <div class="col-sm-6 col-lg-12" >
                                <div class="panel" style="margin-bottom: 10px">
                                    <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Data Utilization" data-placement="bottom">
                                        <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-cardio"  />  </span>
                                        Online Users
                                        <span class="badge badge-primary margin-right-sm css_onlineCount">

                                            </span>
                                            <div class="pull-right">




                                            <jsp:include  flush=""  page="../control/TopRecordsCount.jsp"></jsp:include>


                                        </div>
                                    </div>
                                </div>

                                            <div class="panel-body">
                                <script type="text/javascript">





                                        (function ($) {
                                            $(function () {

                                                $('#graphid').highcharts({
                                                    chart: {
                                                        type: 'areaspline',
                                                        spacingBottom: 10
                                                    },
                                                    title: {
                                                        text: 'Online'
                                                    },
                                                     subtitle: {
                                                        text: 'Refresh After 30 Secs'
                                                    },
                                                    legend: {
                                                    },
                                                    xAxis: {
                                                        categories: [
                                                        ],
                                                        plotBands: [{// visualize the weekend
                                                                from: 0,
                                                                to: 10,
                                                                color: 'rgba(255,105,180, .2)'
                                                            }]
                                                    },
                                                    yAxis: {
                                                        title: {
                                                            text: 'Count'
                                                        }
                                                    },
                                                    tooltip: {
                                                        shared: true,
                                                        valueSuffix: ' Users'
                                                    },
                                                    credits: {
                                                        enabled: false
                                                    },
                                                    plotOptions: {
                                                        areaspline: {
                                                            fillOpacity: 0.5
                                                        }
                                                    },
                                                                series: [{
                                                                        name: 'Online',
                                                                        data: []
                                                                    },{
                                                                        name: 'Connected',
                                                                        data: []
                                                                    }]
                                                            });




                                                var interval = 100;

                                                
                                                    
                                                var timing = function () {
                                                    var timer = setInterval(function () {

                                                        var data =
                                                        {
                                                            'vlanId': $("#vlanId").val(),
                                                            'ownerName': $("#ownerName").val(),
                                                            'reportId': 'RPT_ONLINE',
                                                            'filterCode': $("#toprecords").val(),
                                                        };
                                                        $.ajax({
                                                            type: "POST",
                                                            url: "json/JsonOnlineUser.jsp?data=" + JSON.stringify(data),
                                                            //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                                            success: function (data) {
                                                                var output = $.parseJSON(data);

                                                                $('#graphid').highcharts().xAxis[0].update({categories: eval(output.categories)}, true);
                                                                $('#graphid').highcharts().series[0].setData(eval(output.series0));                                                              
                                                                $('#graphid').highcharts().series[1].setData(eval(output.series1));


                                                                $('.table-responsive').html(output.datatable);
                                                                $('.css_onlineCount').html(output.recordCount);
                                                            }
                                                        });
                                                        interval = 30000; /* Increment you do want for timer */
                                                         clearInterval(timer);
                                                        timing();
                                                    }, interval);
                                                }
                                                timing();







                                                $("#refresh").click(function ()


                                                {

                                                    jQuery('#ImgProcessing').css("display", "inline");
                                                    var data =
                                                            {
                                                                'vlanId': $("#vlanId").val(),
                                                                'ownerName': $("#ownerName").val(),
                                                                'reportId': 'RPT_ONLINE',
                                                                'filterCode': $("#toprecords").val(),
                                                            };



                                                    $.ajax({
                                                        type: "POST",
                                                        url: "json/JsonOnlineUser.jsp?data=" + JSON.stringify(data),
                                                        data: JSON.stringify(data),
                                                        contentType: "application/json",
                                                        success: function (data) {
                                                            var output = $.parseJSON(data);

                                                            $('#graphid').highcharts().xAxis[0].update({categories: eval(output.categories)}, true);
                                                            $('#graphid').highcharts().series[0].setData(eval(output.series0));

                                                            $('.table-responsive').html(output.datatable);
                                                            $('.css_onlineCount').html(output.recordCount);

                                                            jQuery('#ImgProcessing').css("display", "none");

                                                        }
                                                        ,
                                                        error: function () {
                                                            alert("There is error.Please try again.");
                                                        }
                                                    });
                                                }
                                                );



                                            });
                                        })(jQuery);

                                    </script>

                                    <div  id="graphid" style="height: 300px;  width: auto; "  ></div>





                            </div>


                            </div>
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
                <div class="panel-title"> <span class="glyphicon glyphicon-list-alt"></span> Online Users </div>
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

