
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
                            <jsp:include page="../control/InDaterangeLocationDurationFilter.jsp"></jsp:include>
                            <jsp:include page="../control/InMacUserMobile.jsp"></jsp:include>


                        </div>
                        <div class="col-sm-6 col-lg-12" >
                            <div class="panel" style="margin-bottom: 10px">
                                <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Data Utilization" data-placement="bottom">
                                    <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-user"  />  </span>
                                        Data Utilization
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
                                                            type: 'column'
                                                        },
                                                        title: {
                                                            text: ''
                                                        },
                                                        subtitle: {
                                                            text: '</a>'
                                                        },
                                                        xAxis: {
                                                            categories: [],
                                                            title: {
                                                                text: ''
                                                            }
                                                        },
                                                        yAxis: {
                                                            min: 0,
                                                            title: {
                                                                text: 'MB',
                                                                align: 'middle'
                                                            },
                                                            labels: {
                                                                overflow: 'justify'
                                                            }
                                                        },
                                                        tooltip: {
                                                            valueSuffix: ''
                                                        },
                                                        plotOptions: {
                                                            column: {
                                                                dataLabels: {
                                                                    enabled: false
                                                                }
                                                            }
                                                        },
                                                        legend: {
                                                            layout: 'horizontal',
                                                            align: 'center',
                                                                verticalAlign: 'top',
                                                                x: 0,
                                                                y: 0,
                                                                floating: true,
                                                                borderWidth: 0,
                                                                backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
                                                                shadow: false,
                                                                display: false

                                                        },
                                                        credits: {
                                                            enabled: false
                                                        },
                                                        series: [{
                                                                name: 'Download',
                                                                data: []
                                                            }, {
                                                                name: 'Upload',
                                                                data: []
                                                            }]
                                                    });


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
                                                                    'daterange': $("#daterange").val(),
                                                                    'vlanId': $("#vlanId").val(),
                                                                    'ownerName': $("#ownerName").val(),
                                                                    'reportId': 'RPT_DATAUTILIZATION_BY_USER',
                                                                    'durationType': $("#durationType").val(),
                                                                    'filterCode': $("#toprecords").val(),
                                                                    'username': $("#username").val(),
                                                                    'macadds': $("#macadds").val(),
                                                                    'mobile': $("#mobile").val(),
                                                                    'expired': expired


                                                                };



                                                        $.ajax({
                                                            type: "POST",
                                                            url: "json/JsonDataUtilizationByUser.jsp?data=" + JSON.stringify(data),
                                                            data: JSON.stringify(data),
                                                            contentType: "application/json",
                                                            success: function (data) {
                                                                var output = $.parseJSON(data);
                                                                $('#graphid').highcharts().xAxis[0].update({categories: eval(output.categories)}, true);
                                                                $('#graphid').highcharts().series[0].setData(eval(output.seriestable));
                                                                $('#graphid').highcharts().series[1].setData(eval(output.seriestable1));
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
                    <div class="panel-title"> <span class="glyphicon glyphicon-list-alt"></span> Data Utilization </div>
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


