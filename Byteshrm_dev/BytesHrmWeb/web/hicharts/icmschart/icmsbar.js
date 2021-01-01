jQuery.noConflict();

var example = 'column-basic',
        theme = 'default';

(function($) { // encapsulate jQuery
    $(function() {
        $('#G_ID').highcharts({
            chart: {
                type: 'G_TYPE'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [G_CATEGORY]
            },
            yAxis: {
                min: 0,
                title: {
                    text: ''
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            legend: {
               
                enabled: false,
                borderWidth: 0

            },
            plotOptions: {
                column: {
                    pointPadding: 0.1,
                    borderWidth: 0
                }
            },
            series: [G_SERIES_NAME_DATA]
        });
    });
})(jQuery);