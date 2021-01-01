jQuery.noConflict();

var example = '3d-pie',
        theme = 'default';

(function ($) {
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
               
                pointFormat: '{series.name}: <b>{point.y:1f}</b>'

            }, legend: {
                enabled: true
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    innerSize: 100,
                    depth: 40,

                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                    type: 'pie',
                    name: 'Count#',
                    data: [
                        G_DATA
                    ]
                }]
        });
    });
})(jQuery);