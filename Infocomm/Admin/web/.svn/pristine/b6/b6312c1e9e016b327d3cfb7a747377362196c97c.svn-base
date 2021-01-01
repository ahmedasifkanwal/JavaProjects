
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />






<div class="row">

    <div class="col-sm-12 col-lg-12" >
        <div class="panel">
            <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Top 10 Categories Browsed." data-placement="bottom">

                <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-adress_book"  />  </span>
                    Top 20 Categories


                    <div style="float: right">
                        <span class="badge badge-primary margin-right-sm css_seriesCategoriesTotal"> 0</span>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <script type="text/javascript">

                    jQuery.noConflict();



                    (function($) {
                        $(function() {
                            $('#seriesCategoriesCon').highcharts({
                                chart: {
                                    type: 'column'
                                },
                                title: {
                                    text: ''
                                },
                                subtitle: {
                                    text: ''
                                },
                                xAxis: {
                                    type: 'category',
                                    labels: {
                                        rotation: -45,
                                        style: {
                                            fontSize: '11px',
                                            fontFamily: 'Verdana, sans-serif'
                                        }
                                    }
                                },
                                yAxis: {
                                    min: 0,
                                    title: {
                                        text: 'Categories count'
                                    }
                                },
                                legend: {
                                    enabled: false
                                },
                                tooltip: {
                                    pointFormat: 'Category Count: <b>{point.y:1f} </b>'
                                },
                                series: [{
                                        name: 'Count',
                                        data: [
                                            ['Loading..', 0],
                                        ],
                                        dataLabels: {
                                            enabled: true,
                                            rotation: -90,
                                            color: '#FFFFFF',
                                            align: 'right',
                                            format: '{point.y:1f}', // one decimal
                                            y: 10, // 10 pixels down from the top
                                            style: {
                                                fontSize: '13px',
                                                fontFamily: 'Verdana, sans-serif'
                                            }
                                        }
                                    }]
                            });
                        });

                    })(jQuery);
                </script>

                <div  id="seriesCategoriesCon"  style="height: 350px; width: auto; "></div>



            </div>


        </div>
    </div>


</div>

