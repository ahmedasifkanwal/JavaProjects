jQuery.noConflict();

var example = 'gauge-speedometer',
        theme = 'default';

(function ($) {
    $(function() {

        $('#G_ID').highcharts({
            chart: {
                type: 'G_TYPE', //'pyramid'Pie/funnel
                marginRight: 100
            },
            title: {
                text: 'G_TITLE',
                x: -50
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">Count: </td>' +
                        '<td style="padding:0"><b>{point.y:1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b> ({point.y:,.0f})',
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                        softConnector: true
                    }
                }
            },
            legend: {
                enabled: true
            },
            series: [{
                    text: 'G_TITLE',
                    data: [
                        G_DATA
                    ],
                }]
        });
    });

})(jQuery);