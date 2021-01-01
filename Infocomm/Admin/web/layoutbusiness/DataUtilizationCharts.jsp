
<div class="col-sm-4 col-lg-3" >
    <div class="panel">
        <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Data Utilization, Today" data-placement="bottom">
            <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-bicycle"  />  </span>
                Utilization
            <div style="float: right">
                <span class="badge badge-primary margin-right-sm css_totalbanwidth">
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
                        $('#DataUtilizationDiv').highcharts({
                            title: {
                                text: ''
                            },
                            xAxis: {
                                categories: ['..']
                            },
                            labels: {
                                items: [{
                                        html: '',
                                        style: {
                                            left: '50px',
                                            top: '18px',
                                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                                        }
                                    }]
                            },
                            series: [{
                                   
                                    type: 'column',
                                    name: 'Download(MB)',
                                    data: [0]
                                }, {
                                    type: 'column',
                                    name: ' Upload(MB)',
                                    data: [0]
                                }, {
                                    type: 'spline',
                                    name: 'Average(MB)',
                                    data: [],
                                    marker: {
                                        lineWidth: 2,
                                        lineColor: Highcharts.getOptions().colors[3],
                                        fillColor: 'white'
                                    }
                                }, {
                                    type: 'pie',
                                    name: 'Total Utilization',
                                    data: [{
                                            name: 'Download(GB)',
                                            y: 13,
                                            color: Highcharts.getOptions().colors[0] // Jane's color
                                        }, {
                                            name: 'Upload(GB)',
                                            y: 23,
                                            color: Highcharts.getOptions().colors[1] // John's color
                                        }],
                                    center: [100, 90],
                                    size: 100,
                                    showInLegend: false,
                                    dataLabels: {
                                        enabled: false
                                    }
                                }]
                        });
                        var interval = 100;
                        var timing = function () {
                            var timer = setInterval(function () {
                                $.ajax({
                                    type: "POST",
                                    url: "json/JsonAdminStatisticsBusiness.jsp?ROW=ROW4",
                                    //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                    success: function (data) {
                                        var output = $.parseJSON(data);

                                        $('#DataUtilizationDiv').highcharts().xAxis[0].update({categories: eval(output.seriesUtilizationcategories)}, true);
                                        $('#DataUtilizationDiv').highcharts().series[0].setData(eval(output.seriesUtilization0));
                                        $('#DataUtilizationDiv').highcharts().series[1].setData(eval(output.seriesUtilization1));
                                        $('#DataUtilizationDiv').highcharts().series[2].setData(eval(output.seriesUtilizationavg));
                                        $('#DataUtilizationDiv').highcharts().series[3].data[0].update({y: eval(output.totalDownload)}, true);
                                        $('#DataUtilizationDiv').highcharts().series[3].data[1].update({y: eval(output.totalUpload)}, true);
                                        $(".css_totalbanwidth").html((output.totalDownload+output.totalUpload)+"GB");



                                    }
                                });
                                interval = 300000;
                                clearInterval(timer);
                                timing();
                            }, interval);};
                        
                        timing();

                    });

                })(jQuery);
            </script>

            <div  id="DataUtilizationDiv" style="height: 350px; width: auto; "  ></div>



        </div>


    </div>
</div>
