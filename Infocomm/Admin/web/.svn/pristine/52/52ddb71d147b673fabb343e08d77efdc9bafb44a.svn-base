
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.6/proj4.js"></script>
<script src="https://code.highcharts.com/maps/highmaps.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="https://code.highcharts.com/mapdata/countries/us/us-all.js"></script>

<script type="text/javascript">

    (function ($) {
        $(function () {

            var H = Highcharts,
                                map = H.maps['countries/us/us-all'],
                                chart;


            // Add series with state capital bubbles
                        $.getJSON("json/data/us-capitals.json", {'name': "GetJSON", 'method': "json"},
                                function (data) {
                                    $.each(json, function () {
                                        this.z = this.population;
                                        data.push(this);
                                    });
                                });


            $('#mapp').highcharts('Map', {
                            title: {
                                text: 'Highmaps lat/lon demo'
                            },
                            tooltip: {
                                pointFormat: '{point.capital}, {point.parentState}<br>' +
                                        'Lat: {point.lat}<br>' +
                                        'Lon: {point.lon}<br>' +
                                        'Population: {point.population}'
                            },
                            xAxis: {
                                crosshair: {
                                    zIndex: 5,
                                    dashStyle: 'dot',
                                    snap: false,
                                    color: 'gray'
                                }
                            },
                            yAxis: {
                                crosshair: {
                                    zIndex: 5,
                                    dashStyle: 'dot',
                                    snap: false,
                                    color: 'gray'
                                }
                            },
                            series: [{
                                    name: 'Basemap',
                                    mapData: map,
                                    borderColor: '#606060',
                                    nullColor: 'rgba(200, 200, 200, 0.2)',
                                    showInLegend: false
                                }, {
                                    name: 'Separators',
                                    type: 'mapline',
                                    data: H.geojson(map, 'mapline'),
                                    color: '#101010',
                                    enableMouseTracking: false,
                                    showInLegend: false
                                }, {
                                    type: 'mapbubble',
                                    dataLabels: {
                                        enabled: true,
                                        format: '{point.capital}'
                                    },
                                    name: 'Cities',
                                    data: data,
                                    maxSize: '12%',
                                    color: H.getOptions().colors[0]
                                }]
                        });

            chart = $('#mapp').highcharts();
                    });

        // Display custom label with lat/lon next to crosshairs
                $('#mapp').mousemove(function (e) {
                    var position;

            if (chart) {
                            if (!chart.lab) {
                                chart.lab = chart.renderer.text('', 0, 0)
                                        .attr({
                                            zIndex: 5
                                        })
                                        .css({
                                            color: '#505050'
                                        })
                                        .add();
                            }

                e = chart.pointer.normalize(e);
                                position = chart.fromPointToLatLon({
                                    x: chart.xAxis[0].toValue(e.chartX),
                                    y: chart.yAxis[0].toValue(e.chartY)
                                });

                chart.lab.attr({
                                    x: e.chartX + 5,
                                    y: e.chartY - 22,
                                    text: 'Lat: ' + position.lat.toFixed(2) + '<br>Lon: ' + position.lon.toFixed(2)
                                });
                            }
                        });

        $('#mapp').mouseout(function () {
                    if (chart && chart.lab) {
                        chart.lab.destroy();
                        chart.lab = null;
                    }
                });
           
    })(jQuery);

</script>

<div class="row" >



    <div  id="mapp" style="height: 350px; width: auto; "  ></div>

</div>