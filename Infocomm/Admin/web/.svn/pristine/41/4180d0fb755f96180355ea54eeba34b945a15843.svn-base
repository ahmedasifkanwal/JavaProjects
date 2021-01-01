
jQuery.noConflict();

var example = 'line-basic',
        theme = 'default';

(function ($) {
    $(function() {
        $('#G_ID').highcharts({
            title: {
                text: 'G_TITLE',
                x: -20 //center
            },
            subtitle: {
                text: '',
                x: -20
            },
            xAxis: {
                categories: [G_CATEGORY]
            },
            yAxis: {
                title: {
                    text: ''
                },
                plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
            },
            tooltip: {
                valueSuffix: ''
            },
            legend: {
                layout: 'horizontal',
                align: 'center',
                verticalAlign: 'bottom',
                enabled: false,
                borderWidth: 0

            },
            series: [G_SERIES_NAME_DATA]
        });
    });
})(jQuery);
	