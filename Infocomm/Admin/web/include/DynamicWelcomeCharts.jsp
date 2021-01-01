
<script type="text/javascript">




</script>


<div class="row">

    <jsp:include  page="DeviceTypesChart.jsp"></jsp:include>
    <jsp:include  page="ActivationStaticticsChart.jsp"></jsp:include>
    <jsp:include  page="DataUtilizationCharts.jsp"></jsp:include>
    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
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
                                        url: "json/JsonAdminStatisticalGraph.jsp?ROW=ROW1",
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
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="User activation in last 24 hours by location" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-user"  />  </span>
                Activation
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
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title=" Activation by mobile in last 24 hours by location" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-iphone"  />  </span>
                Mobile Activation
                <div style="float: right">
                    <span class="badge badge-primary margin-right-sm css_MobileActivationCount">
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
                            $('#MobileActivationCount').highcharts({
                                chart: {
                                    type: 'pie',
                                    options3d: {
                                        enabled: true,
                                        alpha: 20
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
                                        innerSize: 150,
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

                <div  id="MobileActivationCount" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>




</div>