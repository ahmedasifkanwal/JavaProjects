
<div class="col-sm-8 col-lg-4" >
    <div class="panel">
        <div class="panel-heading" data-toggle="tooltip" title="" data-original-title=" Connected vs Login device every hours." data-placement="bottom">
            <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-cardio"  />  </span>
                Connected vs Login
                <div style="float: right">
                    <span class="badge badge-primary margin-right-sm css_ActivationComparision">

                    </span>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <script type="text/javascript">

                (function ($) {
                    $(function () {
                        $('#ActivationComparision').highcharts({
                            chart: {
                                type: 'area',
                                spacingBottom: 30
                            },
                            
                            title: {
                                text: ''
                            },
                            subtitle: {
                                text: '',
                                floating: true,
                                align: 'right',
                                verticalAlign: 'bottom',
                                y: 15
                            },
                            legend: {
                                enabled: false,
                                layout: 'horizontal',
                                align: 'left',
                                verticalAlign: 'bottom',
                                x: 0,
                                y: 30,
                                floating: true,
                                borderWidth: 0,
                                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
                            },
                            xAxis: {
                                categories: ['..'],
                                labels: {
                                         enabled: false

                                }
                            },
                            yAxis: {
                                title: {
                                    text: ''
                                },
                                labels: {
                                    formatter: function () {
                                        return this.value;
                                    }
                                }
                            },
                            tooltip: {
                                formatter: function () {
                                    return '<b>' + this.series.name + '</b><br/>' +
                                            this.x + ': ' + this.y;
                                }
                            },
                            plotOptions: {
                                area: {
                                    fillOpacity: 0.5
                                }
                            },
                            credits: {
                                enabled: false
                            },
                                            series: [{
                                                    name: 'Connected',
                                                    data: [['Loading..', 0.00000000000001]]
                                                }, {
                                                    name: 'Login',
                                                    data: [['Loading..', 0.00000000000001]]
                                                }]
                                        });
                                        var interval = 100;
                                        var timing = function () {
                                            var timer = setInterval(function () {
                                                $.ajax({
                                                    type: "POST",
                                                    url: "json/JsonAdminStatisticalGraph.jsp?ROW=ROW3",
                                                    //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                                    success: function (data) {


                                                        var output = $.parseJSON(data);

                                                        $('#ActivationComparision').highcharts().xAxis[0].update({categories: eval(output.seriesActivationcategories)}, true);
                                                        $('#ActivationComparision').highcharts().series[0].setData(eval(output.seriesActivationComparision0));
                                                        $('#ActivationComparision').highcharts().series[1].setData(eval(output.seriesActivationComparision1));
                                                    }
                                                });
                                                interval = 3000; /* Increment you do want for timer */
                                                clearInterval(timer);
                                                timing();
                                            }, interval);
                                        }
                                        timing();
                                    });
                })(jQuery);

            </script>

            <div  id="ActivationComparision" style="height: 350px; width: auto; "  ></div>



        </div>


    </div>
</div>
