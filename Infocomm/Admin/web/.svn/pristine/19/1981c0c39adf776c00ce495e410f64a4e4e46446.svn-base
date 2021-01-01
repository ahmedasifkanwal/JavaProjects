
<div class="col-sm-8 col-lg-4" >
    <div class="panel">
        <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Device Types used, Today" data-placement="bottom">
            <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-alarm"  />  </span>
                Device Type
            <div style="float: right">
                    <span class="badge badge-primary margin-right-sm css_DeviceNameCount">
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
                        $('#DeviceNameCount').highcharts({
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
                                        name: 'Device Count',
                                        data: [['Loading..', 0.00000000000001]]
                                    }]
                            });

                        var interval = 100;
                        var timing = function () {
                            var timer = setInterval(function () {
                                $.ajax({
                                    type: "POST",
                                    url: "json/JsonAdminStatisticalGraph.jsp?ROW=ROW2",
                                    //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                                    success: function (data) {
                                        var output = $.parseJSON(data);
                                        $('#DeviceNameCount').highcharts().series[0].setData(eval(output.seriesDeviceNameCount));
                                                    $(".css_DeviceNameCount").html(output.DeviceNameCount);




                                                }
                                            });
                                            interval = 600000; /* Increment you do want for timer */
                                            clearInterval(timer);
                                            timing();
                                        }, interval);
                                    }
                                    timing();

                    });

                })(jQuery);
            </script>

            <div  id="DeviceNameCount" style="height: 350px; width: auto; "  ></div>



        </div>


    </div>
</div>
