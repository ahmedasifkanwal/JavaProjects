jQuery.noConflict();

var example = '3d-pie',
        theme = 'default';

(function($) { // encapsulate jQuery
    $(function() {
        $('#G_ID').highcharts({
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 50,
                    beta: 0
                }
            },
            title: {
                text: 'G_TITLE',
               
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            }, legend: {
                enabled: true
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 40,

                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                    type: 'pie',
                    name: 'Count',
                    data: [
                        G_DATA
                    ]
                }]
        });
    });
})(jQuery);