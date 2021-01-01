<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Highcharts Example</title>
        <script src="js/jquery.timer.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>


        <style type="text/css">
            ${demo.css}
        </style>
        <script type="text/javascript">

            $(function() {
                var options = $('#container').highcharts({
                    chart: {
                        type: 'pie',
                        animation: Highcharts.svg, // don't animate in old IE
                        marginRight: 10,
                        events: {
                            load: function() {

                                // set up the updating of the chart each second
                              //  var series = this.series[0];
                                setInterval(function() {
                                 
                                   

                                  this.series[0].data[0].push(['IE2', 40]);
                                  this.canvas.refresh();

                                }, 1000);
                            }
                        }
                    },
                    title: {
                        text: 'Browser market shares at a specific website, 2014'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: [{
                            type: 'pie',
                            data:[ ["DD",10]]

                        }]
                });


                function getdata()
                {

                    return "['Firefox', 1005.0],['IE', 126.8]";
                }


                //Block

                setInterval(function()
                {

                    $.ajax({
                        type: "POST",
                        url: "json/JsonRefreshChart.jsp",
                        success: function(data) {
                            var data = $.parseJSON(data);
                            // alert(data.RESULT);


                            // options.series[0].data = data.RESULT;
                            data = {};
                            Chart.options.series[0].data.push("['Firefox', 1005.0],['IE', 126.8]");

                            // var chart = new Highcharts.Chart(options);
                        }
                    });


                }
                , 10000);

                //Block

            });




        </script>



    </head>
    <body  >

        <script src="hicharts/highcharts.js"></script>
        <script src="hicharts/exporting.js"></script>


        <div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>

        <div id="divdata" style="width: 600px; height: 400px; margin: 0 auto"></div>

    </body>
</html>
