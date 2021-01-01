<div class="row">

    <jsp:include  page="DeviceTypesChart.jsp"></jsp:include>
    <jsp:include  page="ActivationStaticticsChart.jsp"></jsp:include>
    <jsp:include  page="DataUtilizationCharts.jsp"></jsp:include>

    <div class="col-sm-8 col-lg-3" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title=" Utilization(Top 10 Users)" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-down_arrow"  />  </span>
                    Utilization(Top 10 Users)
                <div style="float: right">
                    <span class="badge badge-primary margin-right-sm css_top10user">

                        </span>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <script type="text/javascript">

                    (function ($) {
                        $(function () {
                            $('#top10user').highcharts({
                                chart: {
                                    type: 'bar'
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
                                       display: false,
                                       floating: false,
                                        enabled: false
                                       
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

                            var interval = 100;
                            var timing = function () {
                                var timer = setInterval(function () {
                                    $.ajax({
                                        type: "POST",
                                        url: "json/JsonAdminStatisticsBusiness.jsp?ROW=ROW7",
                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                        success: function (data) {

                                            var output = $.parseJSON(data);
                                       
                                            $('#top10user').highcharts().xAxis[0].update({categories: eval(output.categories)}, true);
                                            $('#top10user').highcharts().series[0].setData(eval(output.seriestable));
                                            $('#top10user').highcharts().series[1].setData(eval(output.seriestable1));

                                        }
                                    });
                                  
                                    interval = 36000; /* Increment you do want for timer */
                                    clearInterval(timer);
                                    timing();
                                }, interval);
                            }
                            timing();
                        });
                    })(jQuery);

                </script>

                <div  id="top10user" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>



    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <a href="onlineusers.icms">
                <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Online users by locations. " data-placement="bottom">
                    <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-globe_af"  />  </span>
                        Online
                        <div style="float: right">
                            <span class="badge badge-primary margin-right-sm css_OnlineCount">
                                0
                            </span>
                        </div>
                    </div>
                </div>
            </a>
            <div class="panel-body">
                <script type="text/javascript">
                    jQuery.noConflict();
                    var example = '3d-pie',
                            theme = 'default';

                    (function ($) {
                        $(function () {
                            $('#OnlineCount').highcharts({
                                chart: {
                                    type: 'pie',
                                    options3d: {
                                        enabled: true,
                                        alpha: 30,
                                        beta: 20
                                    }
                                },
                                title: {
                                    text: ''
                                },
                                subtitle: {
                                    text: ''
                                },
                                plotOptions: {
                                    pie: {
                                        innerSize: 200,
                                        depth: 30
                                    }
                                },
                                series: [{
                                        name: 'Online',
                                        data: [['Loading..', 0.00000000000001]]
                                    }]
                            });

                            var interval = 100;
                            var timing = function () {
                                var timer = setInterval(function () {
                                    $.ajax({
                                        type: "POST",
                                        url: "json/JsonAdminStatisticsBusiness.jsp?ROW=ROW5",
                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                        success: function (data) {
                                            var output = $.parseJSON(data);
                                            $('#LoginCount').highcharts().series[0].setData(eval(output.seriesLoginCount));
                                            $(".css_LoginCount").html(output.LoginCountTotal);
                                            $('#OnlineCount').highcharts().series[0].setData(eval(output.seriesOnlineCount));
                                            $(".css_OnlineCount").html(output.OnlineCount);
                                            $('#MobileActivationCount').highcharts().series[0].setData(eval(output.seriesMobileActivationCount));
                                            $(".css_MobileActivationCount").html(output.MobileActivationCount);

                                        }
                                    });
                                    interval = 60000; /* Increment you do want for timer */
                                    clearInterval(timer);
                                    timing();
                                }, interval);
                            }
                            timing();

                        });

                    })(jQuery);
                </script>

                <div  id="OnlineCount" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>

    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="User Activation in last 24 hours by location" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-user"  />  </span>
                Activation(Last 24 Hours)
                <div style="float: right">
                    <span class="badge badge-primary margin-right-sm css_LoginCount">
                        0
                    </span>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <script type="text/javascript">
                    jQuery.noConflict();
                    var example = '3d-pie',
                            theme = 'default';

                    (function ($) {
                        $(function () {
                            $('#LoginCount').highcharts({
                                chart: {
                                    type: 'pie',
                                    options3d: {
                                        enabled: true,
                                        alpha: 45
                                    }
                                },
                                title: {
                                    text: ''
                                },
                                subtitle: {
                                    text: ''
                                },
                                plotOptions: {
                                    pie: {
                                        innerSize: 100,
                                        depth: 10
                                    }
                                },
                                series: [{
                                        name: 'Activation',
                                        data: [['Loading..', 0.00000000000001]]
                                    }]
                            });



                        });

                    })(jQuery);
                </script>

                <div  id="LoginCount" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>


    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Top used website" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-webcam"  />  </span>
                    Top Websites
                    <div style="float: right">
                        <span class="badge badge-primary margin-right-sm css_seriesdate">

                        </span>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <script type="text/javascript">

                    (function ($) {
                        $(function () {
                            $('#Topwebsite').highcharts({
                                chart: {
                                    type: 'funnel',
                                    marginRight: 250
                                },
                                title: {
                                    text: '',
                                    x: 10
                                },
                                plotOptions: {
                                    series: {
                                        dataLabels: {
                                            enabled: true,
                                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                                            softConnector: true
                                        },
                                        neckWidth: '40%',
                                        neckHeight: '25%'

                                                //-- Other available options
                                                // height: pixels or percent
                                                // width: pixels or percent
                                    }
                                },
                                legend: {
                                    enabled: false
                                },
                                series: [{
                                        name: 'Count',
                                        data: [0
                                        ]
                                    }]
                            });
                            var interval = 100;
                            var timing = function () {
                                var timer = setInterval(function () {
                                    $.ajax({
                                        type: "POST",
                                        url: "json/JsonAdminStatisticsBusiness.jsp?ROW=ROW6",
                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                        success: function (data) {
                                            var output = $.parseJSON(data);
                                            $('#Topwebsite').highcharts().series[0].setData(eval(output.serieswebsites));

                                        }
                                    });
                                    interval = 360000; /* Increment you do want for timer */
                                    clearInterval(timer);
                                    timing();
                                }, interval);
                            }
                            timing();
                        });
                    })(jQuery);

                </script>

                <div  id="Topwebsite" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>





</div>