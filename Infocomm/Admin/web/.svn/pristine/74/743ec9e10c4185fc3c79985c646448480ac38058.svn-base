
<div class="row" >
    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Top used website" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-webcam"  />  </span>
                Top Websites(om)
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
                            $('#Topwebsites').highcharts({
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
                                                                        url: "json/JsonLiStatistics.jsp?ROW=ROW1&Domain=om",
                                                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                                                        success: function (data) {
                                                                            var output = $.parseJSON(data);

                                            // $('#Topwebsite').highcharts().xAxis[0].update({categories: eval("['A','B']")}, true);
                                            $('#Topwebsites').highcharts().series[0].setData(eval(output.serieswebsites));
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

                <div  id="Topwebsites" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>



    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Top used website" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-webcam"  />  </span>
                Top Websites(com)
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
                            $('#Topwebsitescom').highcharts({
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
                                        url: "json/JsonLiStatistics.jsp?ROW=ROW1&Domain=com",
                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                        success: function (data) {
                                            var output = $.parseJSON(data);

                                            // $('#Topwebsite').highcharts().xAxis[0].update({categories: eval("['A','B']")}, true);
                                            $('#Topwebsitescom').highcharts().series[0].setData(eval(output.serieswebsites));
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

                <div  id="Topwebsitescom" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>



    <div class="col-sm-8 col-lg-4" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Top used website" data-placement="bottom">
                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-webcam"  />  </span>
                Top Websites(org)
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
                            $('#Topwebsitesorg').highcharts({
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
                                        url: "json/JsonLiStatistics.jsp?ROW=ROW1&Domain=org",
                                        //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                        success: function (data) {
                                            var output = $.parseJSON(data);

                                            // $('#Topwebsite').highcharts().xAxis[0].update({categories: eval("['A','B']")}, true);
                                            $('#Topwebsitesorg').highcharts().series[0].setData(eval(output.serieswebsites));
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

                <div  id="Topwebsitesorg" style="height: 350px; width: auto; "  ></div>



            </div>


        </div>
    </div>


</div>