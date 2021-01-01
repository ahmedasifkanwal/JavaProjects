
<div class="row" >
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
                                                                        url: "json/JsonLiStatistics.jsp?ROW=ROW1&Domain=all",
                                                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                                                        success: function (data) {
                                                                            var output = $.parseJSON(data);

                                            // $('#Topwebsite').highcharts().xAxis[0].update({categories: eval("['A','B']")}, true);
                                            $('#Topwebsite').highcharts().series[0].setData(eval(output.serieswebsites));
                                            $(".css_seriesdate").html(output.seriesdate);
                                            $('#BrowserMobile').highcharts().series[0].setData(eval(output.seriesbrowseractivation0));
                                            $('#BrowserMobile').highcharts().series[1].setData(eval(output.seriesbrowseractivation1));

                                        }
                                    });
                                    interval = 3600000; /* Increment you do want for timer */
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




    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Browser vs Mobile Application Activation" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-webcam"  />  </span>
                    Browser vs Mobile
                    <div style="float: right">
                        <span class="badge badge-primary margin-right-sm">

                        </span>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <script type="text/javascript">

                    (function ($) {
                        $(function () {
                            $('#BrowserMobile').highcharts({
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
                                        month: '%e. %b',
                                        year: '%b'
                                    },
                                    title: {
                                        text: 'Date'
                                    }
                                },
                                yAxis: {
                                    title: {
                                        text: 'Count'
                                    },
                                    min: 0
                                },
                                tooltip: {
                                    headerFormat: '<b>{series.name}</b><br>',
                                    pointFormat: '{point.x:%e. %b}: {point.y:.2f} m'
                                },
                                    plotOptions: {
                                        spline: {
                                            marker: {
                                                enabled: true
                                            }
                                        }
                                    },
                                    series: [{
                                            name: 'Browser',
                                            // Define the data points. All series have a dummy year
                                            // of 1970/71 in order to be compared on the same x axis. Note
                                            // that in JavaScript, months start at 0 for January, 1 for February etc.
                                            data: [
                                            ]
                                        }, {
                                            name: 'Mobile',
                                            data: [
                                            ]
                                        }]
                                });
                            });
                        })(jQuery);

                </script>

                <div  id="BrowserMobile" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>
    <jsp:include page="../include/SystemPerformance.jsp"/>

</div>