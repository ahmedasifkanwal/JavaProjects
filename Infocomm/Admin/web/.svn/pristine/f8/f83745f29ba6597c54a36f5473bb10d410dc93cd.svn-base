
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

                    <s:form action="loginstatictics.icms"  theme="simple"   >
                        <jsp:include page="../include/ChartComponents.jsp"/>

                        <div class="container"  >
                        <div class="row" style="margin-top: 5px ">
                            <jsp:include page="../control/WaitControl.jsp"></jsp:include>
                            <jsp:include page="../control/InDaterangeOwnerVlan.jsp"></jsp:include>
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
                            <div class="col-sm-6 col-lg-12" >
                                <div class="panel" style="margin-bottom: 10px">
                                    <div class="panel-heading" data-toggle="tooltip" title="" data-original-title=" Connected vs Login device every hours." data-placement="bottom">
                                        <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-user"  />  </span>
                                            Connected vs Login




                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <script type="text/javascript">

                                            (function ($) {
                                                $(function () {
                                                    $('#ActivationComparision').highcharts({
                                                        chart: {
                                                            type: 'spline'
                                                         
                                                        },
                                                        title: {
                                                            text: ''
                                                        },
                                                        subtitle: {
                                                            text: ''
                                                        },
                                                        xAxis: {
                                                            type: 'datetime',
                                                            dateTimeLabelFormats: {// don't display the dummy year
                                                                month: '%b \'%y',
                                                                year: '%Y',
                                                                day: '%e. %b',
                                                                hour: '%H:%M',
                                                                minute: '%H:%M',
                                                            },
                                                            title: {
                                                                text: 'Date'
                                                            }
                                                        },
                                                        yAxis: {
                                                            title: {
                                                                text: 'Count'
                                                            },
                                                            min: 0,
                                                                                                              },
                                                        tooltip: {
                                                            headerFormat: '<b>{series.name}</b><br>',
                                                            pointFormat: '{point.x:%e-%B-%Y, %H:%M %p} COUNT: {point.y:.0f}'
                                                        },
                                                        plotOptions: {
                                                            spline: {
                                                                marker: {
                                                                    enabled: true
                                                                }
                                                            }
                                                        },
                                                        series: [{
                                                                name: 'Connected',
                                                                data: [
                                                                   
                                                                ]
                                                            }, {
                                                                name: 'Login',
                                                                data: [
                                                                   
                                                                ]
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
                                                        var data =
                                                                {
                                                                    'daterange': $("#daterange").val(),
                                                                    'vlanId': $("#vlanId").val(),
                                                                    'ownerName': $("#ownerName").val(),
                                                                    'reportId': 'RPT_LOGINCONNECTED',
                                                                    'durationType': $("#durationType").val(),
                                                                    'filterCode': $("#toprecords").val(),
                                                                    'expired': expired


                                                                };
                                                        $.ajax({
                                                            type: "POST",
                                                            url: "json/JsonConnectedVsLogin.jsp?data=" + JSON.stringify(data),
                                                            data: JSON.stringify(data),
                                                            contentType: "application/json",
                                                            success: function (data) {
                                                                var output = $.parseJSON(data);
                                                      //    alert("SQL"+output.SQL);
                                                        //  retun;
                                                                $('#ActivationComparision').highcharts().series[0].setData(eval(output.seriesActivationComparision0));
                                                                $('#ActivationComparision').highcharts().series[1].setData(eval(output.seriesActivationComparision1));
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
                                        <div  id="ActivationComparision" style="height: 350px; width: auto; "  ></div>
                                    </div>
                                </div>
                            </div>
                            </div>
                </s:form>
            </div>
        </div>
    </div>

